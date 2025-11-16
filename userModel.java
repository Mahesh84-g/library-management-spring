package com.mahesh.model;

public class userModel {
	private int id;
	private String userName;
	private String password;
	private String role;
	public int getId() {
		return id;
	}
	public String getUserName() {
		return userName;
	}
	public String getPassword() {
		return password;
	}
	public String getRole() {
		return role;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public userModel() {
	
	}
	@Override
	public String toString() {
		return "userModel [id=" + id + ", userName=" + userName + ", password=" + password + ", role=" + role + "]";
	}
	

}
