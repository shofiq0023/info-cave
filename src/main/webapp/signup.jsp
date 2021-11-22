<%@ include file="includes/header.jsp" %>
<%
	if(session.getAttribute("userId") != null) {
		response.sendRedirect("profile.jsp");
	}
%>

	<div class="container">
		<h2 class="mb-4 mt-5 text-center">Sign Up</h2>
		<c:if test="${error != null }">
			<p class="test-center text-danger">This email is already in use</p>
		</c:if>
		<form action="New" class="form" method="POST">
			<div class="form-group mb-3">
				<label class="form-label">Full Name: </label>
				<input class="form-control" type="text" placeholder="enter your full name..." name="fullName" id="fullName" required>
			</div>
			<div class="form-group mb-3">
				<label class="form-label">Email: </label>
				<input class="form-control" type="email" placeholder="enter email...." name="userEmail" id="email" required>
			</div>
			<div class="form-group mb-3">
				<label class="form-label">Author name: </label>
				<input class="form-control" type="text" placeholder="enter your author name..." name="userAuthorName" id="author" required>
			</div>
			<div class="form-group mb-3">
				<label class="form-label">Password: </label>
				<input class="form-control" type="password" placeholder="enter your password..." name="userPassword" id="password" required>
			</div>
			<div class="form-group mb-3">
				<label class="form-label">Confirm Password: </label>
				<input class="form-control" type="password" placeholder="confirm your password..." name="confirmPassword" id="conPassword" required>
				<p class="text-danger mt-1" id="passErr"></p>
			</div>
			<p>Already have an account? <a href="signin.jsp">Sign in</a></p>
			<input class="form-control btn-dark mb-5" type="submit" value="Submit" id="submit">
		</form>
	</div>

	<script>
	let fullName = document.getElementById("fullName");
	let email = document.getElementById("email");
	let author = document.getElementById("author");
	let password = document.getElementById("password");
	let conPassword = document.getElementById("conPassword");
	let submit = document.getElementById("submit");
	let err = document.getElementById("passErr");
	let fullNameVal;
	let emailVal;
	let authorVal;
	let passVal = password.value;
	let conPassVal;
	
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
	
	fullName.addEventListener("keyup", () => {
		fullNameVal = fullName.value;
		validate(fullName, fullNameVal);
	});
	
	email.addEventListener("keyup", () => {
		emailVal = email.value;
		validate(email, emailVal);
	});
	
	author.addEventListener("keyup", () => {
		authorVal = author.value;
		validate(author, authorVal);
	});
	
	password.addEventListener("keyup", () => {
		passVal = password.value;
		validate(password, passVal);
	});
	
	conPassword.addEventListener("keyup", () => {
		conPassVal = conPassword.value;
		if(passVal != conPassVal) {
			submit.disable = true;
			submit.classList.remove("btn-dark");
			err.innerText = "*Password do not match";
		} else {
			submit.disabled = false;
			submit.classList.add("btn-dark");
			err.innerText = "";
		}
	});
	
	</script>
	
<%@ include file="includes/footer.jsp" %>