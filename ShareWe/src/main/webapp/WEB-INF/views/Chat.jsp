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

<style>
#topMenu {
	height: 30px;
	width: 850px;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #009223;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: black;
	background-color: #badc58;
}

.filters_menu {
	display: list-item;
	text-align: -webkit-match-parent;
	unicode-bidi: isolate;
}

#categoryBox .filters_menu li:hover {
	color: white;
	background-color: #009223;
}

#write {
	color: white;
	background-color: #009223;
	border-radius: 10px;
	width: 120px;
	height: 50px;
	box-shadow: 2px 2px 3px #999;
	border-color: transparent;
	position: fixed;
	right: 30px;
	bottom: 50px;
}

#inputSerch {
	border-top-color: #bdc3c7;
	border-bottom-color: #bdc3c7;
	border-left-color: #bdc3c7;
	border-right-color: #bdc3c7;
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
	height: 40px;
}

#buttonBar {
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
	width: 40px;
	height: 40px;
	background-color: #009223;
	border-color: transparent;
}

#searchBar {
	float: right 50px;
}

#buttonBar i {
	color: white;
}

.boardContent {
	border-bottom: 1px solid grey;
	padding-bottom: 20px;
	padding-left: 20px;
}

#clickcontents {
	float: right !important;
	border-radius: 120px;
	border-color: transparent !important;
}

.detailMenu {
	width: 100%;
	max-width: 100px;
}

.detailMenu ul {
	list-style: none;
	z-index: 2;
}

.detailMenu a {
	color: #000;
	text-decoration: none;
}

.detailMenu>ul {
	display: flex;
	width: 100%;
	justify-content: space-between;
	padding: 10px;
}

.detailMenu>ul>li {
	position: relative;
	width: 100%
}

.detailMenu>ul>li>a {
	font-size: 20px;
	font-weight: bold;
	padding: 10px 0;
}

.detailMenu>ul>li>a:hover {
	color: #999;
}

.detailMenu>ul>li>ul {
	padding: 0;
	display: none;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	border: 1px solid #ddd;
	border-radius: 6px;
	background: #fff;
}

.detailMenu>ul>li>ul>li {
	width: 140px !important;
	text-align: center;
}

.detailMenu>ul>li:hover ul {
	display: block;
	margin-top: 30px;
}

.detailMenu>ul>li  li a {
	display: block;
	padding: 10px 15px;
}

.detailMenu>ul>li  li a:hover {
	background: #eee;
}

.detailMenu>ul>li>li+li {
	margin-top: 5px;
}

#favCancel {
	color: white !important;
	background-color: #009223;
}
</style>


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
					<%
					if (loginMember == null) {
					%>
					<a href="goLogin" class="text-white"><small
						class="text-white mx-2">로그인</small>/</a> <a href="goMemberType"
						class="text-white"><small class="text-white mx-2">회원가입</small></a>
					<%
					} else {
					%>
					<span><small class="text-white mx-2"><%=loginMember.getNick()%>님
							환영합니다.</small></span>
					<%
					if (loginMember.getEmail().equals("admin")) {
					%>
					<a href="goAdmin" class="text-white"><small
						class="text-white ms-2">회원관리</small></a>
					<%
					}
					%>
					<a href="memberLogout" class="text-white"><small
						class="text-white mx-2">로그아웃</small></a>
					<%
					}
					%>

				</div>
			</div>
		</div>
		<div class="container px-0">
			<nav class="navbar navbar-light bg-white navbar-expand-xl">
				<a href="goMain" class="navbar-brand"><h1
						class="text-primary display-6" style="color: #009223 !important;">Share
						We?</h1></a>
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
		</div>
	</div>
	<!-- Modal Search End -->


	<!-- Single Page Header End -->


	<!-- 채팅 -->

	<div class="row g-4 justify-content-center"
		style="width: 900px; display: inline-block; margin-left: 400px;">
		<iframe src="chatBoardContent?g_num=${g_num}" width='700'
			height='1000'></iframe>
	</div>

	<c:choose>
		<c:when test="${g_num == 1}">
			<div class="row g-4 justify-content-center"
				style="width: 400px; display: inline-block; padding-top: 150px;">
				<iframe
					src='https://www.vchatcloud.com/chat-demo/iframe/iframe_pc/v4/index.html?
					channelKey=XOaECowsXk-POU1y2Gnfe-20240403001826'
					frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
					width='150' height='900'></iframe>

			</div>
		</c:when>
		<c:when test="${g_num == 65}">
			<div class="row g-4 justify-content-center"
				style="width: 400px; display: inline-block; padding-top: 150px;">
				<iframe
					src='https://www.vchatcloud.com/chat-demo/iframe/iframe_pc/v4/index.html?
					channelKey=ytiAPVFPhT-E1H8hKCCIe-20240404163216'
					frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
					width='150' height='900'></iframe>

			</div>
		</c:when>
		<c:when test="${g_num == 63}">
			<div class="row g-4 justify-content-center"
				style="width: 400px; display: inline-block; padding-top: 150px;">
				<iframe
					src='https://www.vchatcloud.com/chat-demo/iframe/iframe_pc/v4/index.html?
					channelKey=hYizoNHPnB-vZ7BUqab7A-20240404163207'
					frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
					width='150' height='900'></iframe>

			</div>
		</c:when>
		<c:otherwise>
			<div class="row g-4 justify-content-center"
				style="width: 400px; display: inline-block; padding-top: 150px;">
				<iframe
					src='https://www.vchatcloud.com/chat-demo/iframe/iframe_pc/v4/index.html?
					channelKey=lqTBmpEWva-1fiFqnQAXm-20240327104645'
					frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
					width='150' height='900'></iframe>

			</div>
		</c:otherwise>
	</c:choose>

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
	<script src="resources/asset/js/app.js"></script>

	<script type="text/javascript">
		function joinRoom(roomId, clientKey, nickName, callback) {
			// vchatcloud 객체
			channel = vChatCloud
					.joinChannel(
							{
								roomId : roomId, // 채팅방ID(채널키)
								clientKey : clientKey, // 클라이언트 고유키 (유저 식별값)
								nickName : nickName
							// 채팅방에 입장한 유저 별명
							},
							function(error, history) {
								$(
										'div.entery, div.chatout, div.notice, div.whisper, div.content')
										.remove();
								if (error) {
									if (callback)
										return callback(error, null);
									return error;
									/** error 정의
									    0	    SYSTEM_ERROR	        시스템 에러 – 관리자에게 문의하세요.
									    10101	USER_LIMIT_EXCEEDED	    접속 인원이 초과되었습니다.
									    10102	CHANNEL_NOT_EXISTED	    존재하지 않는 채팅방입니다.
									    10103	CHANNEL _BEFORE_OPENED	채팅방 개설시간 전입니다.
									    10104	CHANNEL _AFTER_CLOSED	채팅방이 종료되었습니다.
									    10105	ACTIVE_LIMIT_EXCEEDED	Active User 수를 초과했습니다.
									    10106	CHANNEL_USER_BANED	    추방된 유저입니다.
									    10107	USER_NOT_EXISTED	    접속하지 않은 유저입니다.
									    10901	MISSING_REQURIED_PARAM	필수 파라미터 누락
									 */
								}
								if (callback)
									callback(null, history);
								// 채팅영역에 글쓰기가 활성화될시 활성화
								if (typeof write == 'function')
									write(
											"실시간 채팅에 오신 것을 환영합니다. 개인정보를 보호하고 커뮤니티 가이드를 준수하는 것을 잊지 마세요!",
											'notice');
							})
		}
	</script>

</body>

</html>