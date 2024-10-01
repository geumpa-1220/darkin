package com.example.darkin.dto;

import java.sql.Timestamp;

public class UserDto {
	private Integer id;
	private String username,email,pwd,bio;
	private Timestamp signday;

	
	public Timestamp getSignday() {
		return signday;
	}
	public void setSignday(Timestamp signday) {
		this.signday = signday;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
		
	

}
