<%@ include file="includes/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.infoCave.web.Blogs" %>
<%@ page import="com.infoCave.web.User" %>
<%@ page import="com.infoCave.dao.GetBlogsByUserDAO" %>
<%@ page import="com.infoCave.dao.GetUserDAO" %>
<%
	if(session.getAttribute("userId") == null) {
		response.sendRedirect("signin.jsp");
	}
%>
<%
	GetUserDAO userDao = new GetUserDAO();
	User singleUser = userDao.getUser((int)session.getAttribute("userId"));
%>

	<div class="container">
		<h2 class="my-5">Your Profile</h2>
		<div class="accordion mb-5" id="profileDiv">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		       <i class="fas fa-user me-2"></i> Profile
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#profileDiv">
		      <div class="accordion-body">
		        <div class="row">
					<div class="col-6">
						<h5>Full Name:</h5>
						<p><%= singleUser.getFullName() %></p>
					</div>
					<div class="col-6">
						<h5>Author name:</h5>
						<p><%= singleUser.getAuthorName() %></p>
					</div>
					<div class="col-6">
						<h5>Email:</h5>
						<p><%= singleUser.getEmail() %></p>
					</div>
				</div>
				<a href="edit?id=${userId}" class="btn btn-dark"><i class="fas fa-pen"></i> Edit Profile</a>
				<a href="#deleteModal" class="btn btn-danger" data-bs-toggle="modal"><i class="fas fa-trash"></i> Delete Profile</a>
				
				<!--User delete Modal -->
				<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Delete Account?</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				        </div>
				        <div class="modal-body">
				        	<h5>Do you really want to delete your account? This cannot be undone</h5>
				        	<p>All of your posted blogs will also be deleted forever</p>
				        </div>
				      <div class="modal-footer">
				      	<a href="DeleteAccount?id=<c:out value='${userId}' />" type="button" class="btn btn-danger">Yes, Delete account</a>
				        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">No</button>
				      </div>
				    </div>
				  </div>
				</div>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item" id="blogDiv">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		        <i class="fas fa-file-alt me-2"></i> My Blogs
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#blogDiv">
		      <div class="accordion-body">
		        <div class="row">
		        	<%
		        		GetBlogsByUserDAO blogDao = new GetBlogsByUserDAO();
		        		List<Blogs> blogList = blogDao.getBlogs((int)session.getAttribute("userId"));
		        		
		        	%>
		        	
		        	<% if(blogList.isEmpty()){ %>
		        		<p>No Blogs</p>
		        	<% } %>
		        	
		        	<% for(Blogs blog : blogList) { %>
		        	<div class="col-6 mb-4">
		        		<div class="card">
							<div class="card-body">
								<h5 class="card-title"><%= blog.getTitle() %></h5>
								<p class="card-text text-secondary">Author: <%= blog.getAuthor() %></p>
								<p class="card-text"><%= blog.getSnippets() %></p>
								<a href="getEditBlog?id=<%= blog.getId() %>" class="btn btn-dark"><i class="fas fa-pen"></i> Edit</a>
								<a href="deleteBlog?id=<%= blog.getId() %>" class="btn btn-danger"><i class="fas fa-trash"></i> Delete</a>
							</div>
						</div>
		        	</div>
		        	<% } %>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		</div>
	</div>

<%@ include file="includes/footer.jsp" %>