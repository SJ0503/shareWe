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

#buttonBar {
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
	width: 40px;
	height: 40px;
	background-color: #009223;
	border-color: transparent;
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


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">Share</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item active text-white">general</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- food section -->


	<div class="row g-4 justify-content-center" id="categoryBox">


		<!-- 카테고리 -->
		<div class="col-lg-9" style="margin-top: 90px;">
			<ul class="filters_menu">

				<a href="goGeneral"><li>All</li></a>
				<a href="getgCategory?category=식품" id="clickVege"><li>식품</li></a>
				<a href="getgCategory?category=과일" id="clickFruit"><li>과일</li></a>
				<a href="getgCategory?category=생필품" id="ClickDaily"><li>생필품</li></a>
				<a href="getgCategory?category=패션/뷰티" id="ClickDaily"><li>패션/뷰티</li></a>
				<a href="getgCategory?category=여행/도서" id="ClickDaily"><li>여행/도서</li></a>

				<!-- <input id="inputSerch" class="serchBar"  type="search" placeholder="keywords">
				<button  type="button" id="buttonBar" class="serchBar"><i class="fa fa-search"></i></button> -->

			</ul>
		</div>

		<!-- 코드 시작-------------------------------- -->
		<div class="col-lg-9"
			style="width: 60% !important; justify-content: center; align-items: center;">
			<div class="row g-4 justify-content-center" id="boardDiv">
				<c:forEach items="${gboard_list}" var="g">
					<div class="col-md-1 col-lg-2 col-xl-3"
						style="margin-right: 10px; margin-left: 10px; width: 23%; height: 10%; margin-bottom: 20px;">
						<div class="rounded position-relative fruite-item">
							<div class="fruite-img">
								<a href="G_BoardContent?g_num=${g.g_num}"> <img
									src="resources/g_Image/${g.g_img1}"
									class="img-fluid w-100 rounded-top" alt="">
								</a>
							</div>
							<div
								class="text-white bg-secondary px-3 py-1 rounded position-absolute"
								style="top: 10px; left: 10px; background-color: #009223 !important;">${g.category}</div>

							<div
								class="p-4 border border-secondary border-top-0 rounded-bottom"
								style="border-color: #009223 !important;">

								<br> <a href="G_BoardContent?g_num=${g.g_num}"><h5>${g.g_title}</h5></a>
								<h6 style="display: inline;">${g.g_writer}</h6>
								<c:choose>
									<c:when test="${empty loginMember}">
										<a onclick="location.href='goLogin'" style="float: right;"
											type="button"
											class="btn border border-secondary rounded-pill px-3 text-primary">❤
											찜</a>
									</c:when>

									<c:otherwise>

										<c:set var="num" value="0" />
										<c:forEach items="${gfavorite_list}" var="f">
											<c:if test="${f.g_num eq g.g_num}">
												<c:set var="num" value="1" />
											</c:if>


										</c:forEach>
										<c:if test="${num eq '1'}">

											<a onclick="checkGFavorite(${g.g_num})" id="${g.g_num}"
												style="float: right; display: none;"
												class="btn border border-secondary rounded-pill px-3 text-primary">❤
												찜</a>
											<a onclick="delGFavorite(${g.g_num})"
												id="favCancel${g.g_num}"
												style="float: right; background-color: green; color: white !important;"
												class="btn border border-secondary rounded-pill px-3 text-primary">❤
												찜</a>
										</c:if>
										<c:if test="${num eq '0'}">
											<a onclick="checkGFavorite(${g.g_num})" id="${g.g_num}"
												style="float: right;" type="button"
												class="btn border border-secondary rounded-pill px-3 text-primary">❤
												찜</a>
											<a onclick="delGFavorite(${g.g_num})"
												id="favCancel${g.g_num}"
												style="float: right; display: none; background-color: green; color: white !important;"
												class="btn border border-secondary rounded-pill px-3 text-primary">❤
												찜</a>
										</c:if>



									</c:otherwise>

								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<c:if test="${loginMember.type == 2 || loginMember.type == 3}">
			<div class="row g-4 justify-content-center">
				<button class="col-xl-1" id="write" type="button"
					onclick="location.href='gogBoard'">게시물작성</button>
			</div>
	</div>
	</c:if>
	</div>
	<!-- end food section -->

	<!-- Fruits Shop End-->


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
	<!-- 	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a> -->


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

	<script type="text/javascript">

				function checkGFavorite(g_num){
					 var id = "favCancel" + g_num;
				
					console.log(g_num)
					console.log(id)
					document.getElementById(id).style.display = "inline";
					document.getElementById(g_num).style.display = "none";
					
				$.ajax(
				{
					url : "insertgFavorite",
					data : {'g_num' : g_num},
					type :'get',
					success : function(data){
						
					},
					error : function(){
						alert("로그인이 필요합니다")
					}
				}
			)
		}
				</script>
	<script type="text/javascript">
			function delGFavorite(g_num){
				var id = "favCancel" + g_num;
				console.log(g_num)
				console.log(id)
				document.getElementById(g_num).style.display = "inline";
				document.getElementById(id).style.display = "none";
						$.ajax(
						{
							url : "delgFavorite",
							data : {'g_num' : g_num},
							type :'get',
							success : function(){
								
							},
							error : function(){
								alert("통신실패")
							}
						}
					)
				}
		</script>

</body>

</html>