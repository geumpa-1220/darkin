package com.example.darkin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.darkin.dto.GroupMemberDto;
import com.example.darkin.dto.GroupMessageDto;
import com.example.darkin.dto.GroupRoomDto;

@Mapper
public interface GroupRoomMapper {
	
	public List<GroupRoomDto> allGroupList();
	public List<GroupRoomDto> myRooms(String user);
	public int checkGroup(String user);
	public List<GroupRoomDto> getGroupForUser(String user);
	
	public void insertAndGetGroupRoom(GroupRoomDto groupRoomDto);
	
	public int selectMember(GroupMemberDto member);
	public void insertMember(GroupMemberDto member);
	public List<GroupMemberDto> selectMembers(int roomId);
	public GroupRoomDto nowGroup(int roomId);

	public void insertAndGetMessage(GroupMessageDto messageDto);
	public GroupMessageDto selectMessageById(int id);
	public List<GroupMessageDto> selectByRoomId(int roomId);
}
