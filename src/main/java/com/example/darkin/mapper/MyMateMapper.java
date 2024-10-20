package com.example.darkin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.darkin.dto.MyMateDto;
import com.example.darkin.dto.RoomDto;

@Mapper
public interface MyMateMapper {
	
	public RoomDto selectRoom(String userName,String mateName);
	public void insertSenderRoom(String userName,String mateName);
	
	public RoomDto selectMateRoom(String mate, String user);
	public void insertMateRoom(String mateName,String userName);
	
	public List<RoomDto> roomList(String user);
	public List<MyMateDto> selectMessages(String user,String mate);
	public void insertMessage(MyMateDto mateDto);

}
