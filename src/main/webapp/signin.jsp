<%@ include file="includes/header.jsp" %>
<%
	if(session.getAttribute("userId") != null) {
		response.sendRedirect("profile.jsp");
	}
%>
	<div class="container">
		<h2 class="mb-4 mt-5 text-center">Sign In</h2>
		<c:if test="${success != null}">
			<p class="text-success text-center">Your account was created. Now signin using that account information</p>
		</c:if>
		<form action="Login" class="form" method="POST">
			<div class="form-group mb-3">
				<label class="form-label">Email: </label>
				<input class="form-control" type="email" placeholder="enter your email..." name="userEmail" id="email" required>
			</div>
			<div class="form-group mb-3">
				<label class="form-label">Password: </label>
				<input class="form-control" type="password" placeholder="enter your password..." name="userPassword" id="password" required>
			</div>
			<p>Don't have an account? <a href="signup.jsp">Create a new account</a></p>
			<input class="form-control btn-dark mb-5" type="submit" value="Submit" id="submit">
		</form>
	</div>
	
	<script>
	let email = document.getElementById("email");
	let password = document.getElementById("password");
	let submit = document.getElementById("submit")
	let emailVal;
	let passVal;
	
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
	
	email.addEventListener("keyup", () => {
		emailVal = email.value;
		validate(email, emailVal);
	});
	
	password.addEventListener("keyup", () => {
		passVal = password.value;
		validate(password, passVal);
	});
	</script>
	
<%@ include file="includes/footer.jsp" %>