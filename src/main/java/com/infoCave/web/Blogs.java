package com.infoCave.web;

public class Blogs {
	private int id;
	private String title;
	private String author;
	private String snippets;
	private String detail;
	
	public Blogs(int id, String title, String author, String snippets, String detail) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.snippets = snippets;
		this.detail = detail;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getSnippets() {
		return snippets;
	}
	public void setSnippets(String snippets) {
		this.snippets = snippets;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
}
