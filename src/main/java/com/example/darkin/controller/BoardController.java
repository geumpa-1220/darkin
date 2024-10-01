package com.example.darkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.darkin.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

}
