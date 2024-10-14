package com.example.darkin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.darkin.dto.MyMateDto;
import com.example.darkin.dto.RoomDto;
import com.example.darkin.dto.UserDto;
import com.example.darkin.service.MyMateService;
import com.example.darkin.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChatController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private MyMateService myMateService;
	
	
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
	public String myMate(@RequestParam String mate , Model model)
	{
		model.addAttribute("mate",mate);
		return "/chat/myMate";
	}
}
