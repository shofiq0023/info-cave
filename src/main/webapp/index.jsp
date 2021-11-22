<%@ include file="includes/header.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.infoCave.web.Blogs" %>
<%@ page import="com.infoCave.dao.GetBlogsDAO" %>
<%
	GetBlogsDAO dao = new GetBlogsDAO();
	List<Blogs> blogList = dao.getBlogs();
	
%>
	<div class="container">
		<h1 class="my-5">All BLogs</h1>
		<div class="row mb-5">
			<% if(blogList.isEmpty()) { %>
				<h5>No Blogs were found</h5>
			<% } %>
			
			<%
				for( Blogs blog : blogList) {
			%>
			<div class="col-lg-6 mb-4">
				<div class="blog">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title"><%= blog.getTitle() %></h5>
							<p class="card-text text-secondary">Author: <%= blog.getAuthor() %></p>
							<p class="card-text text-capitalize"><%= blog.getSnippets() %></p>
							<a href="blogDetail?id=<%= blog.getId() %>" class="btn btn-dark">Read <i class="fas fa-chevron-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<% } %>
			<!-- 
			<div class="col-lg-6">
				<div class="blog">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Special title treatment</h5>
							<p class="card-text text-secondary">Author: John Doe</p>
							<p class="card-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
							<a href="#" class="btn btn-dark">Read <i class="fas fa-chevron-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			-->
		</div>
	</div>
	
<%@ include file="includes/footer.jsp"%>