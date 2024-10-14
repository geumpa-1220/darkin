package com.example.darkin.service;

import org.springframework.stereotype.Service;

import com.example.darkin.dto.MyMateDto;
import com.example.darkin.dto.RoomDto;
import com.example.darkin.mapper.MyMateMapper;

@Service
public class MyMateService {
	private MyMateMapper myMateMapper;
	
	
	public RoomDto selectRoom(String mateName , String userName) {
		RoomDto roomDto=myMateMapper.selectRoom(mateName);
		if(roomDto == null) {
			myMateMapper.insertRoom(mateName,userName);
			roomDto=myMateMapper.selectRoom(mateName);
			return roomDto;
		}
		else{
			return roomDto;
		}
	 	
	}
	
	
	public MyMateDto selectMessages(int roomId)
	{
		return myMateMapper.selectMessages(roomId);
	}
	

}
