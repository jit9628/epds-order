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
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
</head>

<body>
    <section class="login_bg ">
        <div class="container">
            <div class="row">
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-6 col-xl-6 col-xxl-6 col-xxx-6 m-auto mt-5 ">
                    <div class="text-center">
                        <!-- <img src="./images/logo.png" alt="logo"> -->
                        <h2>EPDS ORDER</h2>
                    </div>
                    <div class="card mt-5 mb-5">
                        <div class="card-body">
                            <h4 class="mt-3 mb-3">Registration</h4>
                            <form class="mb-5 px-2"  id="myFormSave">
                                <div class="row">
                                    <div class="col mb-3">
                                        <label class="form-label fw-semibold">First Name</label>
                                        <input type="test" name="firstName" class="form-control"
                                            placeholder="Enter Your First Name" id="firstname">
                                            <span id="first"></span>
                                    </div>
                                    <div class=" col mb-3">
                                        <label class="form-label fw-semibold">Last Name</label>
                                        <input type="text" name="lastName" class="form-control"
                                            placeholder="Enter Your Last Name" id="lastname">
                                            <span id="second"></span>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-semibold">Email</label>
                                    <input type="text" name="email" class="form-control"
                                        placeholder="Enter your Email id" id="email">
                                        <span id="third"></span>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-semibold">Mobile Number</label>
                                    <input type="text" name="mobile" class="form-control"
                                        placeholder="0000000000" id="mobile">
                                        <span id="fourth"></span>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-semibold">Password</label>
                                    <input type="password" name="password" class="form-control"
                                        placeholder="Enter Password" id="password">
                                        <span id="five"></span>
                                </div>
                                <div class="d-grid gap-2 mt-4 mb-2">
                                    <button  value="register"
                                        class="btn btn-primary text-uppercase btn_color fw-semibold py-2" id="registerd">Register</button>
                                </div>
                                <a href="login">Login</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Script Section Start -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
      <%-- <script src="${pageContext.request.contextPath}/resources/ajaxcall/register.js"></script> --%>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <!-- Script Section End -->
    
    <script type="text/javascript">
    
	
    $("#myFormSave").submit(function(event) {
    	event.preventDefault(); // Prevent default form submission
    	var firstname = $("#firstname").val();
    	var lastname = $("#lastname").val();
    	var email = $("#email").val();
    	var contactnumber = $("#mobile").val();
    	var password= $("#password").val();
    	// Validate the form
    	if (validateForm()) {
    		// If the form is valid, send it via AJAX
    	
    		$.ajax({
    			url: '/api/auth/signup',
    			type: 'POST',
    			dataType: 'json',
    			contentType: "application/json",
    			headers: {
    				'Accept': 'application/json',
    				'Content-Type': 'application/json'
    			},
    			/*data: $(this).serialize(),*/
    			data: JSON
    				.stringify({
    					 "firstname":firstname,
    					    "lastname":lastname,
    					    "username":"abcd",
    					    "email":email,
    					    "mobile":contactnumber,
    					    "password":password
    				}),
    			success: function(response) {
    				alert("Created ..");
    				// Handle the successful response here
    				successResponseMessage("Your Account Is Saved ..");
    				//window.setTimeout(() => { window.location.href = "/api/page/Product-dtl-usr"; }, 4000);
    				window.location.href = "/api/test/check-out";
    				
    			},
    			error: function(error) {
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
    		$("#first").text("please fill Firstname");
    		$("#first").addClass("text-danger");
    		$("#firstname")
    			.addClass("border border-danger");
    	}else if(!/^[a-zA-Z]*$/g.test(firstname)){
    		isValid = false;
    		$("#first").text("Please Fill Valid  Firstname");
    		$("#first").addClass("text-danger");
    		$("#firstname")
    			.addClass("border border-danger");
    	} else {

    		$("#first").text("");
    		$("#firstname").removeClass(
    			"border border-danger");
    		$("#firstname").addClass(
    			"border border-success");

    	}
    	var lastname = $("#lastname").val();
    	if (lastname.trim() === "") {
    		isValid = false;
    		$("#second").text("please fill Firstname");
    		$("#second").addClass("text-danger");
    		$("#lastname")
    			.addClass("border border-danger");
    	}
    	else {
    		$("#second").text("");
    		$("#lastname").removeClass(
    			"border border-danger");
    		$("#lastname")
    			.addClass("border border-success");

    	}



    	// Validate the email field (you can add more validations here)
    	var email = $("#email").val();
    	if (email.trim() === "") {
    		isValid = false;
    		$("#third").text("please fill email");
    		$("#third").addClass("text-danger");
    		$("#email")
    			.addClass("border border-danger");
    	} else if (!isValidEmail()) {
    		isValid = false;
    		$("#third").text();
    		$("#third").text("please fill is Valid Email");
    		$("#third").addClass("text-danger");
    		$("#email")
    			.addClass("border border-danger");
    	} else {

    		$("#fourth").text("");
    		$("#email").removeClass("border border-danger");
    		$("#email").addClass("border border-success");

    	}

    	

    	var mobile = $("#mobile").val();

    	if (mobile.trim() === "") {
    		isValid = false;
    		$("#fourth").text("please fill number");
    		$("#fourth").addClass("text-danger");
    		$("#mobile")
    			.addClass("border border-danger");
    	}

    	else if (!validateMobile()) {
    		isValid = false;
    		$("#fourth").text("please fill valid phone number");
    		$("#fourth").addClass("text-danger");
    		$("#mobile")
    			.addClass("border border-danger");
    	}
    	else {
    		$("#fourth").text("");
    		$("#mobile").removeClass(
    			"border border-danger");
    		$("#mobile")
    			.addClass("border border-success");

    	}
    	var password = $("#password").val();
    	if (mobile.trim() === "") {
    		isValid = false;
    		$("#five").text("please fill number");
    		$("#five").addClass("text-danger");
    		$("#password")
    			.addClass("border border-danger");
    	}else{
    		$("#five").text("");
    		$("#password").removeClass(
    			"border border-danger");
    		$("#password")
    			.addClass("border border-success");
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
    function validatePostalCode() {
    	var postalcodes = $("#postalcode").val();
    	// Define a regular expression for a valid mobile number format
    	var postalcodeRegex = /^[0-9]{6}$/;
    	return postalcodeRegex.test(postalcodes);
    }

    </script>
    
    
    
    
    
    
    
    
</body>
</html>