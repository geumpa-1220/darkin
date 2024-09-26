package com.example.darkin.service;

import org.springframework.ui.Model;

import com.example.darkin.dto.UserDto;

import jakarta.servlet.http.HttpSession;

public interface UserService {
	
	public String signUp(UserDto userDto);
	public String login(UserDto userDto , HttpSession session , Model model);
	public String profile(Model model , HttpSession session);

}
