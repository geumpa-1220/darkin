package com.example.darkin.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.darkin.dto.MyMateDto;
import com.example.darkin.dto.RoomDto;
import com.example.darkin.mapper.MyMateMapper;

@Service
public class MyMateService {
	@Autowired
	private MyMateMapper myMateMapper;
	
	
	public RoomDto selectRoom(String userName , String mateName) {
	    
	    if (myMateMapper.selectRoom(userName,mateName) == null) {
	            // 방이 존재하지 않는 경우에만 삽입
	            myMateMapper.insertSenderRoom(userName , mateName);
	            
	            return myMateMapper.selectRoom(userName,mateName);
	        }
	    else {
	    	
	            return myMateMapper.selectRoom(userName,mateName);
	        }
	    }
	    



	public RoomDto selectMateRoom(String mate , String user)
	{
		return myMateMapper.selectMateRoom(mate,user);
	}
	
	public void insertMateRoom(String mateName , String userName)
	{
		myMateMapper.insertMateRoom(mateName, userName);
	}
	
	public List<RoomDto> roomList(String user)
	{
		return myMateMapper.roomList(user);
	}
	
	
	public List<MyMateDto> selectMessages(String user,String mate )
	{
		return myMateMapper.selectMessages(user,mate);
	}
	
	
	public void insertMessage(MyMateDto mateDto) {
		myMateMapper.insertMessage(mateDto);
	}

}
