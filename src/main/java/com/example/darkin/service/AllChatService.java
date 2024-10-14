package com.example.darkin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.darkin.dto.AllChatDto;
import com.example.darkin.mapper.AllChatMapper;

@Service
public class AllChatService {

    private final AllChatMapper allChatMapper;

    // 생성자를 통해 AllChatMapper를 주입
    public AllChatService(AllChatMapper allChatMapper) {
        this.allChatMapper = allChatMapper;
    }

    public void saveMessage(AllChatDto message) {
        allChatMapper.saveMessage(message);
    }
    
    public List<AllChatDto> selectAllMessage() {
    	return allChatMapper.selectAllMessage();
    }
}