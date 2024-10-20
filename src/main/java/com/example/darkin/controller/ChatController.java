package com.example.darkin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.darkin.dto.GroupMemberDto;
import com.example.darkin.dto.GroupMessageDto;
import com.example.darkin.dto.GroupRoomDto;
import com.example.darkin.dto.MyMateDto;
import com.example.darkin.dto.RoomDto;
import com.example.darkin.dto.UserDto;
import com.example.darkin.service.GroupRoomService;
import com.example.darkin.service.MyMateService;
import com.example.darkin.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChatController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private MyMateService myMateService;
	
	@Autowired
	private GroupRoomService groupRoomService;
	
	@GetMapping("/chat/allChat")
	public String allChatForm()
	{
		return "/chat/allChat";
	}
	
	@GetMapping("/chat/choice")
	public String choice()
	{
		return "/chat/choice";
	}
	
	@GetMapping("/chat/matching")
	public String matching(@RequestParam int age , Model model)
	{
		List<UserDto> userDto = userService.matching(age);
		model.addAttribute("users",userDto);
		return "/chat/matching";
	}

	@GetMapping("/chat/myMate")
	public String myMate(@RequestParam String mate , Model model , HttpSession session)
	{
		
		String user=(String)session.getAttribute("username");
		
		RoomDto roomDto=myMateService.selectRoom(user,mate);
		
		System.out.println("id:"+roomDto.getId());
		
		List<MyMateDto> messages=myMateService.selectMessages(user,mate);
		
		List<RoomDto> roomList=myMateService.roomList(user);

		model.addAttribute("messages",messages);
		model.addAttribute("room",roomDto);
		model.addAttribute("roomList",roomList);
		return "/chat/myMate";
	}
	
	
	@GetMapping("/chat/myRooms")
	public String myRooms(HttpSession session , Model model)
	{
		String user=(String)session.getAttribute("username");
		List<RoomDto> roomList=myMateService.roomList(user);
		
		model.addAttribute("roomList",roomList);
		return "/chat/myRooms";
	}
	
	
	@GetMapping("/chat/allGroupList")
	public String allGroup(Model model)
	{
		List<GroupRoomDto> groupRoomDto = groupRoomService.allGroupList();
		model.addAttribute("allGroupList",groupRoomDto);
		return "/chat/allGroupList";
	}
	
	@GetMapping("/chat/myGroup")
	public String myGroup(HttpSession session,Model model)
	{
		String user = (String)session.getAttribute("username");
		List<GroupRoomDto> groupMember = groupRoomService.selectInGroup(user);
		
		model.addAttribute("myRooms",groupMember);
		return "/chat/myGroup";
	}
	
	@GetMapping("/chat/insertGroup")
	public String insertGroupFrom()
	{
		return "/chat/insertGroup";
	}
	@PostMapping("/chat/insertGroup")
	public String insertGroup(HttpSession session,GroupRoomDto groupRoomDto)
	{
		String user = (String)session.getAttribute("username");
		groupRoomDto.setUsers(user);
		GroupRoomDto newRoom =groupRoomService.insertAndGetGroupRoom(groupRoomDto);
		int roomId = newRoom.getId();
		return "redirect:/chat/groupChat?roomId="+roomId;
	}
	
	
	@GetMapping("/chat/groupChat")
	public String groupChat(@RequestParam int roomId , Model model , HttpSession session)
	{
		String user = (String)session.getAttribute("username");
		
		List<GroupMemberDto> members = groupRoomService.selectMembers(roomId,user);
		GroupRoomDto grouproom = groupRoomService.nowGroup(roomId);
		List<GroupMessageDto> messages = groupRoomService.selectByRoomId(roomId);
		
		model.addAttribute("groupRoom",grouproom);
		model.addAttribute("members",members);
		model.addAttribute("messages",messages);
		
		return "/chat/groupChat";
	}
	
}












