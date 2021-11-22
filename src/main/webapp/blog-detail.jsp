<%@ include file="includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

%>
	<div class="container">
		<a href="index.jsp" class="btn btn-dark mt-5"><i class="fas fa-chevron-circle-left"></i> Go back</a>
		<h2 class="mb-3 mt-3"><c:out value="${blog.getTitle()}" /></h2>
		<p class="text-secondary mb-4"><c:out value="${blog.getAuthor()}" /></p>
		<p style="white-space: pre-wrap"><c:out value="${blog.getDetail()}" /></p>
	</div>
<%@ include file="includes/footer.jsp"%>