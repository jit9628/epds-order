<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="keywords" content="HTML, CSS, JavaScript">
	<title>Page Title</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/design.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar Start -->
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand text-center" href="javascript:void(0)">
					<!-- <img src="./images/logo.png"> -->
					<span class="sidebar-brand-text align-middle">
						EPDS-ORDER
					</span>
					<svg class="sidebar-brand-icon align-middle" width="32px" height="32px" viewBox="0 0 24 24"
						fill="none" stroke="#FFFFFF" stroke-width="1.5" stroke-linecap="square" stroke-linejoin="miter"
						color="#FFFFFF" style="margin-left: -3px">
						<path d="M12 4L20 8.00004L12 12L4 8.00004L12 4Z"></path>
						<path d="M20 12L12 16L4 12"></path>
						<path d="M20 16L12 20L4 16"></path>
					</svg>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						Pages
					</li>
					<li class="sidebar-item active">
						<a data-bs-target="#dashboards" data-bs-toggle="collapse" class="sidebar-link">
							<i class="align-middle" data-feather="sliders"></i> <span
								class="align-middle">Dashboards</span>
						</a>
						<ul id="dashboards" class="sidebar-dropdown list-unstyled collapse show"
							data-bs-parent="#sidebar">
							<li class="sidebar-item active"><a class="sidebar-link"
									href="javascript:void(0)">Analytics</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="./Form.html">Form Page</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="javascript:void(0)">Users</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="javascript:void(0)">Messages</a></li>
						</ul>
					</li>

					<li class="sidebar-item">
						<a data-bs-target="#pages" data-bs-toggle="collapse" class="sidebar-link collapsed">
							<i class="align-middle" data-feather="layout"></i> <span class="align-middle">Pages</span>
						</a>
						<ul id="pages" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
							<li class="sidebar-item"><a class="sidebar-link" href="javascript:void(0)">Settings</a>
							</li>
							<li class="sidebar-item"><a class="sidebar-link" href="javascript:void(0)">File Upload </a>
							</li>
							<li class="sidebar-item"><a class="sidebar-link" href="javascript:void(0)">Clients</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="javascript:void(0)">Folders</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="javascript:void(0)">Chat</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="javascript:void(0)">Blank Page</a>
							</li>
						</ul>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="javascript:void(0)">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
								fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round" class="feather feather-credit-card align-middle">
								<rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
								<line x1="1" y1="10" x2="23" y2="10"></line>
							</svg> <span class="align-middle">Invoice</span>
						</a>
					</li>

				</ul>
			</div>
		</nav>
		<!-- Sidebar End -->

		<div class="main">
			<!-- Header Section Start -->
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
					<i class="hamburger align-self-center"></i>
				</a>

				<form class="d-none d-sm-inline-block">
					<div class="input-group input-group-navbar">
						<input type="text" class="form-control" placeholder="Search…" aria-label="Search">
						<button class="btn" type="button">
							<i class="align-middle" data-feather="search"></i>
						</button>
					</div>
				</form>


				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item">
							<a class="nav-icon js-fullscreen d-none d-lg-block" href="javascript:void(0)">
								<div class="position-relative">
									<i class="align-middle" data-feather="maximize"></i>
								</div>
							</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-icon pe-md-0 dropdown-toggle" href="javascript:void(0)"
								data-bs-toggle="dropdown">
								<img src="${pageContext.request.contextPath}/resources/images/user.png" class="avatar img-fluid rounded" alt="Charles Hall" />
							</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="javascript:void(0)">
									<i class="align-middle me-1" data-feather="user"></i>
									Profile
								</a>
								<a class="dropdown-item" href="javascript:void(0)">
									<i class="align-middle me-1" data-feather="pie-chart"></i>
									Analytics
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="javascript:void(0)">
									<i class="align-middle me-1" data-feather="settings"></i>
									Settings & Privacy
								</a>
								<a class="dropdown-item" href="javascript:void(0)">
									<i class="align-middle me-1" data-feather="help-circle"></i>
									Help Center
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="./Login.html">Log out</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>
			<!-- Header Section End -->

			<!-- Min Section Start -->
			<main class="content">
				<div class="container-fluid p-0">

					<div class="row mb-2 mb-xl-3">
						<div class="col-auto d-none d-sm-block">
							<h3>FPS - 12345</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6 col-xxl-12 d-flex">
							<div class="w-100">
								<div class="row">
									<div class="col-sm-6 col-md-4">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Wheet</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="users"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">2382 <span>Kg</span></h1>
											</div>
										</div>
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Dal</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="users"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">500 <span>Kg</span></h1>
											</div>
										</div>
									</div>
									<div class="col-sm-6 col-md-4">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Sugar</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="user"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">210 <span>Kg</span></h1>
											</div>
										</div>
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Food Packet</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="shopping-cart"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">64 <span>Kg</span></h1>
											</div>
										</div>
									</div>
									<div class="col-sm-6 col-md-4">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Ghee</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="user"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">210 <span>Ltr</span></h1>
											</div>
										</div>
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Oil</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="shopping-cart"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">64 <span>Ltr</span></h1>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					
					</div>


				</div>
			</main>
			<!-- Min Section End -->

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a href="" target="_blank" class="text-muted"><strong>EPDS-ORDER</strong></a> &copy;
							</p>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<!-- Script Section Start -->
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>


	<!-- Pie Chart Start -->
	<script>
		document.addEventListener("DOMContentLoaded", function () {
			var ctx = document.getElementById("pie-chart").getContext("2d");
			var gradientLight = ctx.createLinearGradient(0, 0, 0, 225);
			gradientLight.addColorStop(0, "rgba(215, 227, 244, 1)");
			gradientLight.addColorStop(1, "rgba(215, 227, 244, 0)");
			var gradientDark = ctx.createLinearGradient(0, 0, 0, 225);
			gradientDark.addColorStop(0, "rgba(51, 66, 84, 1)");
			gradientDark.addColorStop(1, "rgba(51, 66, 84, 0)");
			// Line chart
			new Chart(document.getElementById("pie-chart"), {
				type: "line",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "Sales ($)",
						fill: true,
						backgroundColor: window.theme.id === "light" ? gradientLight : gradientDark,
						borderColor: window.theme.primary,
						data: [
							2115,
							1562,
							1584,
							1892,
							1587,
							1923,
							2566,
							2448,
							2805,
							3438,
							2917,
							3327
						]
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					tooltips: {
						intersect: false
					},
					hover: {
						intersect: true
					},
					plugins: {
						filler: {
							propagate: false
						}
					},
					scales: {
						xAxes: [{
							reverse: true,
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}],
						yAxes: [{
							ticks: {
								stepSize: 1000
							},
							display: true,
							borderDash: [3, 3],
							gridLines: {
								color: "rgba(0,0,0,0.0)",
								fontColor: "#fff"
							}
						}]
					}
				}
			});
		});
	</script>
	<!-- Pie Chart End -->

	<!-- Script Section End -->
</body>
</html>