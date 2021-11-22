<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="assets/icon.svg">
<title>Info Cave | 
<%
	String uri = request.getRequestURI();
	String title = uri.substring(uri.lastIndexOf("/") + 1);
	String titleName;
	
	switch(title){
		case "blog-detail.jsp":
			titleName = "Blog detail";
			out.print(titleName);
			break;
		case "blog-edit.jsp":
			titleName = "Edit blog";
			out.print(titleName);
			break;
		case "create-blog.jsp":
			titleName = "Create a new blog";
			out.print(titleName);
			break;
		case "index.jsp":
			titleName = "All blogs";
			out.print(titleName);
			break;
		case "":
			// checks the "/" route
			titleName="All Blogs";
			out.print(titleName);
			break;
		case "profile.jsp":
			titleName = "User Account";
			out.print(titleName);
			break;
		case "profile-edit.jsp":
			titleName = "Edit Profile";
			out.print(titleName);
			break;
		case "signin.jsp":
			titleName = "Sign In";
			out.print(titleName);
			break;
		case "signup.jsp":
			titleName = "Sign Up";
			out.print(titleName);
			break;
	}
	
%>
</title>
</head>
<body>

<%@ include file="navbar.jsp" %>