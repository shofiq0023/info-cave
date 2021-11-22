<%@ include file="includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	if(session.getAttribute("userId") == null) {
		response.sendRedirect("signin.jsp");
	}
%>

	<div class="container">
		<h2 class="mb-4 mt-5 text-center">Edit blog</h2>
		<a class="btn btn-dark mb-3" href="profile.jsp"><i class="fas fa-chevron-circle-left"></i> Profile</a>
		<form action="editBlog" class="form" method="POST">
			<input type="hidden" value="${blog.getId()}" name="blogId">
			<div class="form-group mb-3">
				<label class="form-label">Blog title: </label>
				<input class="form-control" type="text" placeholder="enter your title...." name="blogTitle" value="<c:out value="${blog.getTitle()}" />" id="title" required>
			</div>
			<div class="form-group mb-3">
				<label class="form-label">Snippets (Short description): </label>
				<input class="form-control" type="text" placeholder="enter your blog snippet..." name="blogSnippet" value="<c:out value="${blog.getSnippets()}" />" id="snippets" required>
			</div>
			<div class="form-group mb-3">
				<label class="form-label">Blog detail: </label>
				<textarea rows="6" class="form-control" placeholder="enter your blog...." name="blogDetail" id="detail" required><c:out value="${blog.getDetail()}" /></textarea>
			</div>
			<input class="form-control btn-dark mb-5" type="submit" value="Submit" id="submit">
		</form>
	</div>

	
	<script>
	let title = document.getElementById("title");
	let snippets = document.getElementById("snippets");
	let submit = document.getElementById("submit")
	let titleVal;
	let snippetsVAl;
	
	const validate = (dom, val) => {
		if(val === "") {
			dom.style.borderColor = "red";
			submit.disabled = true;
			submit.classList.remove("btn-dark");
		} else {
			dom.style.borderColor = "";
			submit.disabled = false;
			submit.classList.add("btn-dark");
		}
	}
	
	title.addEventListener("keyup", () => {
		titleVal = title.value;
		validate(title, titleVal);
	});
	
	snippets.addEventListener("keyup", () => {
		snippetsVAl = snippets.value;
		validate(snippets, snippetsVAl);
	});
	
	</script>
	
<%@ include file="includes/footer.jsp" %>