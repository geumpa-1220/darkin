package com.example.darkin.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.darkin.dto.GroupMemberDto;
import com.example.darkin.dto.GroupMessageDto;
import com.example.darkin.dto.GroupRoomDto;
import com.example.darkin.mapper.GroupRoomMapper;

@Service
public class GroupRoomService {
	@Autowired
	private GroupRoomMapper groupRoomMapper;
	
	
	public List<GroupRoomDto> allGroupList(){
		return groupRoomMapper.allGroupList();
	}
	
	public List<GroupRoomDto> myRooms(String user)
	{
		return groupRoomMapper.myRooms(user);
	}
	
	public List<GroupRoomDto> selectInGroup(String user)
	{
		if(groupRoomMapper.checkGroup(user) == 0)
		{
			return Collections.emptyList();
		}
		else {
			return groupRoomMapper.getGroupForUser(user);
		}
	}
	
	public GroupRoomDto insertAndGetGroupRoom(GroupRoomDto groupRoomDto)
	{
		groupRoomMapper.insertAndGetGroupRoom(groupRoomDto);
		return groupRoomDto;
	}
	
	public List<GroupMemberDto> selectMembers(int roomId,String user)
	{
		GroupMemberDto member =new GroupMemberDto();;
		member.setRoomId(roomId);
		member.setUser(user);
		if(groupRoomMapper.selectMember(member) == 0)
		{
			groupRoomMapper.insertMember(member);
			List<GroupMemberDto> members = groupRoomMapper.selectMembers(roomId);
			return members;
		}
		else {
			List<GroupMemberDto> members = groupRoomMapper.selectMembers(roomId);
			return members;
		}
	}
	
	
	public GroupRoomDto nowGroup(int roomId)
	{
		return groupRoomMapper.nowGroup(roomId);
	}
	
	
	public GroupMessageDto insertAndGetMessage(GroupMessageDto messageDto)
	{
		groupRoomMapper.insertAndGetMessage(messageDto);
		return groupRoomMapper.selectMessageById( messageDto.getId() );
	}
    
	
	public List<GroupMessageDto> selectByRoomId(int roomId)
	{
		return groupRoomMapper.selectByRoomId(roomId);
	}

}






