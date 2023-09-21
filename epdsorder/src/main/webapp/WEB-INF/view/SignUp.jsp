<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%> --%>
<%-- <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> --%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="keywords" content="HTML, CSS, JavaScript">
<title>EPDS-ORDER</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>

<body>
	<section class="login_section">
		<div class="signUp_bg"></div>
		<div class="container">
			<div class="login_container">
				<div class="row">
					<div class="col-md-7">
						<!-- Section 01 -->
					</div>
					<div class="col-md-4">
						<div class="login-content">
							<h2>EPDS ORDER</h2>
							<div class="user">
								<img
									src="${pageContext.request.contextPath}/resources/images/user.png"
									alt="img">
							</div>
							<h3 class="text-center my-3">Create a new account</h3>
							<form class="mt-5 signUp_form" id="myFormSave">
								<div class="mb-3">
									<label class="form-label">Email address</label> <input
										type="email" class="form-control"
										placeholder="Enter Your Email" id="email" name="email">
										  <span id="email-error"></span>
								</div>
								<div class="mb-3">
									<label class="form-label">Name</label> <input type="text"
										class="form-control" placeholder="Enter Your Name" id="firstname" name="firstname">
										 <span id="name-error"></span>
										
								</div>
								<div class="mb-3">
									<label class="form-label">Mobile Number</label> <input
										type="number" class="form-control"
										placeholder="Enter Your Mobile Number" id="mobile" name="mobile">
										  <span id="phone-error"></span>
								</div>
								<div class="mb-3">
									<label class="form-label">Password</label> <input
										type="password" class="form-control"
										placeholder="Enter Your Password" id="password" name="password">
										  <span id="password-error"></span>
								</div>

								<button type="submit" class="btn btn-primary w-100 mt-3">Registrar</button>
								<p class="mt-2">
									<a href="./Login.html">Login</a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="row">
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-4 col-xl-4 col-xxl-4 col-xxx-4 m-auto mt-5 ">
                    <div class="text-center">
                        <h2>EPDS ORDER</h2>
                    </div>
                    <div class="card mt-5">
                        <div class="card-body">
                            <h4 class="mt-3 mb-3">Login</h4>
                            <form class="mb-5 px-2" name="f1" action="./Dashboard.html" onsubmit="return validate()">
                                <div class="mb-3">
                                    <label class="form-label fw-semibold">Email</label>
                                    <input type="email" name="email" class="form-control"
                                        placeholder="Enter your Email id">
                                    <span id="nameloc"></span>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-semibold">Password</label>
                                    <input type="password" name="password" class="form-control"
                                        placeholder="Enter Password">
                                    <span id="passwordloc"></span>
                                </div>
                                <div class="d-grid gap-2 mt-4 mb-2">
                                    <button type="submit" value="register"
                                        class="btn btn-primary text-uppercase btn_color fw-semibold py-2">Submit</button>
                                </div>
                                <a href="./Registration.html">Create a new account</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div> -->
		</div>
	</section>

	<!-- Script Section Start -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<!-- Script Section End -->

	<!-- ================================ AJAX CALL =============== -->
	<script type="text/javascript">
		$("#myFormSave").submit(function(event) {
			event.preventDefault(); // Prevent default form submission
			var firstname = $("#firstname").val();
			var email = $("#email").val();
			var contactnumber = $("#mobile").val();
			var password = $("#password").val();
			// Validate the form
			if (validateForm()) {
				// If the form is valid, send it via AJAX

				$.ajax({
					url : '/api/auth/signup',
					type : 'POST',
					dataType : 'json',
					contentType : "application/json",
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					/*data: $(this).serialize(),*/
					data : JSON.stringify({
						"firstname" : firstname,
						"username" : "abcd",
						"email" : email,
						"mobile" : contactnumber,
						"password" : password
					}),
					success : function(response) {
						alert("Created ..");
						// Handle the successful response here
						successResponseMessage("Your Account Is Saved ..");
						//window.setTimeout(() => { window.location.href = "/api/page/Product-dtl-usr"; }, 4000);
					//	window.location.href = "/api/test/check-out";

					},
					error : function(error) {
						alert("Diclined ..");
						console.error(error);
					}
				});
			}
		});
		/*==validate all fields ========== */
		function validateForm() {
			var isValid = true;

			// Validate the name field (you can add more validations here)
			var firstname = $("#firstname").val();
			if (firstname.trim() === "") {
				isValid = false;
				$("#name-error").text("please fill Firstname");
				$("#name-error").addClass("text-danger");
				$("#firstname").addClass("border border-danger");
			} else if (!/^[a-zA-Z]*$/g.test(firstname)) {
				isValid = false;
				$("#name-error").text("Please Fill Valid  Firstname");
				$("#name-error").addClass("text-danger");
				$("#firstname").addClass("border border-danger");
			} else {

				$("#name-error").text("");
				$("#firstname").removeClass("border border-danger");
				$("#firstname").addClass("border border-success");

			}
			// Validate the email field (you can add more validations here)
			var email = $("#email").val();
			if (email.trim() === "") {
				isValid = false;
				$("#email-error").text("please fill email");
				$("#email-error").addClass("text-danger");
				$("#email").addClass("border border-danger");
			} else if (!isValidEmail()) {
				isValid = false;
				$("#email-error").text();
				$("#email-error").text("please fill is Valid Email");
				$("#email-error").addClass("text-danger");
				$("#email").addClass("border border-danger");
			} else {

				$("#email-error").text("");
				$("#email").removeClass("border border-danger");
				$("#email").addClass("border border-success");

			}

			var mobile = $("#mobile").val();

			if (mobile.trim() === "") {
				isValid = false;
				$("#phone-error").text("please fill number");
				$("#phone-error").addClass("text-danger");
				$("#mobile").addClass("border border-danger");
			}

			else if (!validateMobile()) {
				isValid = false;
				$("#phone-error").text("please fill valid phone number");
				$("#phone-error").addClass("text-danger");
				$("#mobile").addClass("border border-danger");
			} else {
				$("#phone-error").text("");
				$("#mobile").removeClass("border border-danger");
				$("#mobile").addClass("border border-success");

			}
			var password = $("#password").val();
			if (mobile.trim() === "") {
				isValid = false;
				$("#password-error").text("please fill number");
				$("#password-error").addClass("text-danger");
				$("#password").addClass("border border-danger");
			} else {
				$("#password-error").text("");
				$("#password").removeClass("border border-danger");
				$("#password").addClass("border border-success");
			}

			return isValid;
		}
		/*====validate Email=======*/
		function isValidEmail() {
			//	var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
			var email = $("#email").val();
			var validRegex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

			return validRegex.test(email);
		}
		/*====validate mobile number===*/
		function validateMobile() {
			var mobileNumbers = $("#mobile").val();
			// Define a regular expression for a valid mobile number format
			var mobileRegex = /^[0-9]{10}$/;
			return mobileRegex.test(mobileNumbers);
		}

		/*====validate mobile number===*/
		/* function validatePostalCode() {
			var postalcodes = $("#postalcode").val();
			// Define a regular expression for a valid mobile number format
			var postalcodeRegex = /^[0-9]{6}$/;
			return postalcodeRegex.test(postalcodes);
		} */
	</script>
















</body>
</html>