package com.example.darkin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.darkin.dto.UserDto;

@Mapper
public interface UserMapper {
	
	public void signUp(UserDto userDto);
	public UserDto loginOrProfile(String username);
	public void update(UserDto userDto);

	public List<UserDto> matching(int age);
}
