<%@page import="kr.smhrd.entity.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Fruitables - Vegetable Website Template</title>
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
	member loginMember = (member) session.getAttribute("loginMember");%>

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
					<a href="goMain" class="text-white"><small
						class="text-white mx-2">홈</small>|</a> <a href="goLogin"
						class="text-white"><small class="text-white mx-2">로그인</small></a>
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


	<!-- Search Start -->
	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">

			<div class="modal-content rounded-0">
				<div class="modal-header">
					<!-- <h5 class="modal-title" id="exampleModalLabel">Search by
						keyword</h5> -->
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="goSearch">
					<div class="modal-body d-flex align-items-center">
						<div class="input-group w-75 mx-auto d-flex"
							style="height: 800px; padding-bottom: 100px; width: 50% !important; justify-content: center; align-items: center;">
							<input type="text" class="form-control p-3" name="searchText"
								style="height: 58px;" placeholder="검색어를 입력해주세요."
								aria-describedby="search-icon-1"> <input type="submit"
								value="검색" id="search-icon-1"
								style="border-top-right-radius: 10px; border-bottom-right-radius: 10px; height: 58px;"
								class="btn btn-primary border-2 border-secondary py-3 px-4">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Search End -->


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">회원가입</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item active text-white">Join</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- 회원가입 유형 선택 Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="row g-4 justify-content-center">
				<div class="col-md-6 col-lg-3">
					<a href="javascript:kakaoLogin()">
						<div class="featurs-item text-center rounded bg-light p-4">
							<div class="featurs-content">
								<img src="resources/img/kakao_icon.png"
									style="height: 20px; width: 20px;">
								<!-- <i class="fa-solid fa-comment"></i> -->
							</div>
							<div class="featurs-content text-center">
								<p class="mb-0">카카오 로그인</p>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-6 col-lg-3">
					<a href="goJoin?type=general">
						<div class="featurs-item text-center rounded bg-light p-4">
							<div class="featurs-content">
								<i class="bi bi-person-circle"></i>
							</div>
							<div class="featurs-content text-center">
								<p class="mb-0">일반회원</p>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-6 col-lg-3">
					<a href="goJoin?type=company">
						<div class="featurs-item text-center rounded bg-light p-4">
							<div class="featurs-content">
								<i class="bi bi-building"></i>
							</div>
							<div class="featurs-content text-center">
								<p class="mb-0">기업회원</p>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 유형 End -->


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

<!-- 카카오 로그인 > 회원가입 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('2bc6b3bd3fef80118728da5119ebd261');
	console.log(Kakao.isInitialized()); // sdk초기화여부판단

	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth
				.loginForm({
					scope : "profile_nickname, account_email",
					success : function(response) {
						Kakao.API
								.request({
									url : '/v2/user/me',
									success : function(response) {
										console.log(response)

										const kakao_account = response.kakao_account;
										console.log(kakao_account);

										var id = response.id;
										var profile_nickname = response.kakao_account.profile.nickname;
										var account_email = response.kakao_account.email;
										localStorage.setItem("nickname",
												profile_nickname);
										localStorage.setItem("id", id);
										localStorage.setItem("email",
												account_email);

										let kakaoInfo = [];
										kakaoInfo.push(id, profile_nickname,
												account_email);
										//for(let i=0; i<kakaoInfo.length; i++){
										//       console.log(arr[i]);}

										let f = document.createElement('form');
										let obj;
										obj = document.createElement('input');
										obj.setAttribute('type', 'hidden');
										obj.setAttribute('name', 'kakaoInfo');
										obj.setAttribute('value', kakaoInfo);

										f.appendChild(obj);
										f.setAttribute('method', 'post');
										f.setAttribute('action',
												'goJoin?type=kakao');
										document.body.appendChild(f);
										f.submit();

										//if(kakao_account.email != null){
										//window.location.href = "goJoin?type=kakao"
										//}

									},
									fail : function(error) {
										console.log(error)
									},
								})
					},
					fail : function(error) {
						console.log(error)
					},
				})
	}
</script>


</html>