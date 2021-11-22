package com.infoCave.web;

public class User {
	private int userId;
	private String fullName;
	private String email;
	private String authorName;
	private String password;
	
	public User(String fullName, String email, String authorName, String password) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.authorName = authorName;
		this.password = password;
	}

	public User(int userId, String fullName, String email, String authorName, String password) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.email = email;
		this.authorName = authorName;
		this.password = password;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
