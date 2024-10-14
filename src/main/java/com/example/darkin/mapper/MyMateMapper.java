package com.example.darkin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.darkin.dto.MyMateDto;
import com.example.darkin.dto.RoomDto;

@Mapper
public interface MyMateMapper {
	
	public RoomDto selectRoom(String mateName);
	public void insertRoom(String mateName,String userName);
	public MyMateDto selectMessages(int roomId);

}
