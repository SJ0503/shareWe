<%@page import="kr.smhrd.entity.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Share We?</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resources/asset/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">
<link href="resources/asset/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="resources/asset/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/asset/css/sw_style.css" rel="stylesheet">

</head>

<body>
<%
	member loginMember = (member) session.getAttribute("loginMember");
	%>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->


	<!-- Navbar start -->
	<div class="container-fluid fixed-top" style="background-color: white !important;">
		<div class="container topbar bg-primary d-none d-lg-block">
			<div class="d-flex justify-content-between">
				<div class="top-info ps-2">
					<small class="me-3"></small> <small class="me-3"></small>
				</div>
				<div class="top-link pe-2">
					<c:if test="${loginMember.email eq 'admin'}">
						<a href="goMain" class="text-white"><small
							class="text-white mx-2">홈</small>|</a>
						<a href="memberLogout" class="text-white"><small
							class="text-white mx-2">로그아웃</small></a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="container px-0">
			<nav class="navbar navbar-light bg-white navbar-expand-xl">
				<a href="goMain" class="navbar-brand"><h1
						class="text-primary display-6">Share We?</h1></a>
				<button class="navbar-toggler py-2 px-3" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars text-primary"></span>
				</button>
				<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
					<div class="navbar-nav mx-auto">
						<a href="goGeneral" class="nav-item nav-link"
							style="color: black; font-size: 18px;"><strong>공구함</strong></a> <a
							href="goCompany" class="nav-item nav-link"
							style="color: black; font-size: 18px;"><strong>동네구경</strong></a>
							<%
								if (loginMember == null) {
								%>
								<a href="goLogin" class="nav-item nav-link"
									style="color: black; font-size: 18px;"><strong>우리동네</strong></a>
								<%
								} else {
								%>
								<a href="goHood" class="nav-item nav-link"
									style="color: black; font-size: 18px;"><strong>우리동네</strong></a>
								<%
								}
								%>
						<!-- <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a> -->
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle active"
								data-bs-toggle="dropdown" style="color: black; font-size: 18px;"><strong>카테고리</strong></a>
							<div class="dropdown-menu m-0 bg-secondary rounded-0">
								<a href="getCategory?category=식품" class="dropdown-item">식품</a> <a
									href="getCategory?category=과일" class="dropdown-item">과일</a> <a
									href="getCategory?category=생필품" class="dropdown-item">생필품</a> <a
									href="getCategory?category=패션/뷰티" class="dropdown-item">패션/뷰티</a>
								<a href="getCategory?category=여행/도서" class="dropdown-item">여행/도서</a>
							</div>
						</div>
								<a href="goSubscribe" class="nav-item nav-link" style="color: black; font-size: 18px;"><strong>POP 결제권</strong></a>
								
					</div>
					<div class="d-flex m-3 me-0">
						<button
							class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
							data-bs-toggle="modal" data-bs-target="#searchModal">
							<i class="fas fa-search text-primary"></i>
						</button>
						 <a href="goMyPage" class="my-auto"> <i class="fas fa-user fa-2x"></i></a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- Navbar End -->


	<!-- Modal Search Start -->
	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content rounded-0">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Search by
						keyword</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body d-flex align-items-center">
					<div class="input-group w-75 mx-auto d-flex">
						<input type="search" class="form-control p-3"
							placeholder="keywords" aria-describedby="search-icon-1">
						<span id="search-icon-1" class="input-group-text p-3"><i
							class="fa fa-search"></i></span>
					</div>
				</div>
			</div>

			<div class="container px-0">
				<nav class="navbar navbar-light bg-white navbar-expand-xl">
					<a href="goMain" class="navbar-brand"><h1
							class="text-primary display-6">Share We?</h1></a>
					<button class="navbar-toggler py-2 px-3" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
						<span class="fa fa-bars text-primary"></span>
					</button>
					<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
						<div class="navbar-nav mx-auto">
							<a href="goGeneral" class="nav-item nav-link" style="color: black">일반</a>
							<a href="goCompany" class="nav-item nav-link" style="color: black">기업</a>
							<!-- <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a> -->
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle active"
									data-bs-toggle="dropdown">카테고리</a>
								<div class="dropdown-menu m-0 bg-secondary rounded-0">
									<a href="cart.html" class="dropdown-item">채소</a> <a
										href="chackout.html" class="dropdown-item">과일</a> <a
										href="testimonial.html" class="dropdown-item">생필품</a>
									<!--<a href="404.html" class="dropdown-item active">404 Page</a> -->
								</div>
							</div>
							<a href="contact.html" class="nav-item nav-link"
								style="color: black">Contact</a>
						</div>
						<div class="d-flex m-3 me-0">
							<button
								class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
								data-bs-toggle="modal" data-bs-target="#searchModal">
								<i class="fas fa-search text-primary"></i>
							</button>
							<a href="goCart" class="position-relative me-4 my-auto"> <i
							class="bi bi-bell-fill fa-2x"></i> <span
								class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
								style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
							</a> <a href="goMyPage" class="my-auto"> <i
								class="fas fa-user fa-2x"></i></a>
						</div>
					</div>
				</nav>
			</div>

		</div>
	</div>
	<!-- Modal Search End -->


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">관리페이지</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item active text-white">Management page</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- 관리페이지 유형 선택 Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="row g-4 justify-content-center">

				<div class="col-md-6 col-lg-3">
					<a href="goAdMember">
						<div class="featurs-item text-center rounded bg-light p-4">
							<div class="featurs-content">
								<i class="bi bi-person-circle"></i>
							</div>
							<div class="featurs-content text-center">
								<p class="mb-0">회원 관리</p>
							</div>
						</div>
					</a>
				</div>


				<!-- <div class="col-md-6 col-lg-3">
						<a href="goAdReport">
							<div class="featurs-item text-center rounded bg-light p-4">
								<div
									class="featurs-content">
									<i class="bi bi-person-circle"></i>
								</div>
								<div class="featurs-content text-center">
									<p class="mb-0">신고회원 관리</p>
								</div>
							</div>
						</a>
					</div> -->

				<div class="col-md-6 col-lg-3">
					<a href="goAdApprove">
						<div class="featurs-item text-center rounded bg-light p-4">
							<div class="featurs-content">
								<i class="bi bi-building"></i>
							</div>
							<div class="featurs-content text-center">
								<p class="mb-0">기업회원승인</p>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 관리페이지 유형 선택 End -->


	<!-- 메인 페이지 하단 -->
	<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					<div class="footer-item">
						<h4 class="text-light mb-3">Contact</h4>
						<p>Address: Gwangju, Republic of Korea</p>
						<p>Email: ShareByuS@gmail.com</p>
						<p>Do you want to share it with us?</p>
						<img src="img/payment.png" class="img-fluid" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 페이지 하단 End -->

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="resources/asset/lib/easing/easing.min.js"></script>
	<script src="resources/asset/lib/waypoints/waypoints.min.js"></script>
	<script src="resources/asset/lib/lightbox/js/lightbox.min.js"></script>
	<script src="resources/asset/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="resources/asset/js/main.js"></script>
</body>


</html>