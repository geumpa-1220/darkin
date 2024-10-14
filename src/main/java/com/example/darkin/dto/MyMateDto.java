package com.example.darkin.dto;

import java.sql.Timestamp;

public class MyMateDto {
	private int id,roomId;
	private String sender,message;
	private Timestamp sentTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getSentTime() {
		return sentTime;
	}
	public void setSentTime(Timestamp sentTime) {
		this.sentTime = sentTime;
	}
	
	

}
