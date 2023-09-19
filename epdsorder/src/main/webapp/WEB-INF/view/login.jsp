<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<meta name="keywords" content="HTML, CSS, JavaScript">
<title>EPDS-ORDER</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/design.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">

</head>

<body>
	<section class="login_bg ">
		<div class="container">
			<div class="row">
				<div
					class="col-xs-8 col-sm-8 col-md-8 col-lg-4 col-xl-4 col-xxl-4 col-xxx-4 m-auto mt-5 ">
					<div class="text-center">
						<!-- <img src="./images/logo.png" alt="logo"> -->
						<h2>EPDS ORDER</h2>
					</div>
					<div class="card mt-5">
						<div class="card-body">
							<h4 class="mt-3 mb-3">Login</h4>
							<form class="mb-5 px-2" name="f1"onsubmit="return validate()"
								action="/api/auth/signin" method="post"
								modelAttribute="loginRequest">
								<div class="mb-3">
									<label class="form-label fw-semibold">Email</label> <input
										type="email" name="username" class="form-control"
										placeholder="Enter your Email id"> <span id="nameloc"></span>
								</div>
								<div class="mb-3">
									<label class="form-label fw-semibold">Password</label> <input
										type="password" name="password" class="form-control"
										placeholder="Enter Password"> <span id="passwordloc"></span>
								</div>
								<div class="d-grid gap-2 mt-4 mb-2">
									<button type="submit" value="register"
										class="btn btn-primary text-uppercase btn_color fw-semibold py-2">Submit</button>
								</div>
								<c:if test="${!isNotValid}">
									<div class="alert alert-danger alert-dismissible fade show"
										id="box1">
										<button type="button" class="btn-close"
											data-bs-dismiss="alert" id="close"></button>
										<b> invalid username or password ${isNotValid} </b>
									</div>
								</c:if>
								<a href="/SignUp">Create a new account</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Script Section Start -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<!-- Script Section End -->

	<script>
		function validate() {
			var email = document.f1.email.value;
			var password = document.f1.password.value;
			var status = false;

			if (email.length < 2) {
				document.getElementById("nameloc").innerHTML = " Plese Enter Velide email";
				status = false;
			} else {
				document.getElementById("nameloc").innerHTML = "your email has been successfully verified";
				status = true;
			}
			if (password.length < 6) {
				document.getElementById("passwordloc").innerHTML = " Password must be at least 6 char long";
				status = false;
			} else {
				document.getElementById("passwordloc").innerHTML = " test";
			}
			return status;
		}
	</script>
</body>
</html>