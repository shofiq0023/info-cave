<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><i class="fas fa-mountain"></i> Info Cave</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">All Blogs</a>
                </li>
                <c:if test="${userId != null }">
	                <li class="nav-item">
	                    <a class="nav-link" href="create-blog.jsp">Create a Blog</a>
	                </li>
                </c:if>
                <c:if test="${userId != null }">
	                <li class="nav-item">
	                	<!-- profile -->
	                    <a class="nav-link text-info" href="profile.jsp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="User Profile"><i class="fas fa-user fa-lg"></i></a>
	                </li>
                </c:if>
                <c:if test="${userId != null }">
	                <li class="nav-item">
	                	<!-- sign out -->
	                    <a class="nav-link text-danger" href="#logoutModal" data-bs-toggle="modal"><i class="fas fa-sign-out-alt fa-lg"></i></a>
	                </li>
                </c:if>
                <c:if test="${userId == null }">
                	<li class="nav-item">
                		<!-- sign in -->
                    	<a class="nav-link text-primary" href="signin.jsp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Sign in"><i class="fas fa-sign-in-alt fa-lg"></i></a>
                	</li>
                </c:if>
                <c:if test="${userId == null }">
                <li class="nav-item">
                	<!-- sign up -->
                    <a class="nav-link text-info" href="signup.jsp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Sign up"><i class="fas fa-user-plus fa-lg"></i></a>
                </li>
                </c:if>
            </ul>
        </div>
    </div>
  </nav>
  
  
<!-- Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Do you want to log out?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
      	<a href="Logout" type="button" class="btn btn-danger">Yes</a>
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>