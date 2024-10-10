package com.example.darkin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	
	
	
	@GetMapping("/chat/koreaChat")
	public String koreaChatForm()
	{
		return "/chat/koreaChat";
	}

}
