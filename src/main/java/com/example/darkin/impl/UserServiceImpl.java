package com.example.darkin.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.darkin.dto.UserDto;
import com.example.darkin.mapper.UserMapper;
import com.example.darkin.service.UserService;

import jakarta.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public String signUp(UserDto userDto)
	{
		userMapper.signUp(userDto);
		return "redirect:/user/login";
	}
	
	
	@Override
	public String login(UserDto userDto , HttpSession session , Model model)
	{
		UserDto dto=userMapper.loginOrProfile( userDto.getUsername() );
		
		if(dto != null && dto.getPwd().equals( userDto.getPwd() ) )
		{
			session.setAttribute("username", dto.getUsername());
			
			return "/index/main";
		}
		else
		{
			String error="이름 혹은 비밀번호가 틀렸습니다";
			model.addAttribute("error", error);
			return "user/login";
		}
	}
	
	
	@Override
	public String profile(Model model , HttpSession session)
	{
		String username=(String)session.getAttribute("username");
		UserDto userDto=userMapper.loginOrProfile(username);
		model.addAttribute("user", userDto);
		return "/user/profile";
	}

}



