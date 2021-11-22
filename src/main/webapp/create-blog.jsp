<%@ include file="includes/header.jsp" %>
<%
	if(session.getAttribute("userId") == null) {
		response.sendRedirect("signin.jsp");
	}
%>

	<div class="container">
		<h2 class="mb-4 mt-5 text-center">Create a new blog</h2>
		<form action="CreateBlog" class="form" method="post">
			<div class="form-group mb-3">
				<label class="form-label">Blog title: </label>
				<input class="form-control" type="text" placeholder="enter your title...." name="blogTitle" id="title">
			</div>
			<div class="form-group mb-3">
				<label class="form-label">Snippets (Short description): </label>
				<input class="form-control" type="text" placeholder="enter your blog snippet..." name="blogSnippet" id="snippets">
			</div>
			<div class="form-group mb-3">
				<label class="form-label">Blog detail: </label>
				<textarea rows="6" class="form-control" placeholder="enter your blog...." name="blogDetail" id="detail"></textarea>
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