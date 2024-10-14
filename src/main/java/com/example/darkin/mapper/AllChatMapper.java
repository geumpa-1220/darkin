package com.example.darkin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.darkin.dto.AllChatDto;

@Mapper
public interface AllChatMapper {
	
	void saveMessage(AllChatDto message);
	List<AllChatDto> selectAllMessage();

}
