package com.example.darkin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.darkin.dto.UserDto;

@Mapper
public interface UserMapper {
	
	public void signUp(UserDto userDto);
	public UserDto loginOrProfile(String username);
	public void update(UserDto userDto);

}
