package com.example.darkin.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.darkin.mapper.BoardMapper;
import com.example.darkin.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	
	//@Overrite

}
