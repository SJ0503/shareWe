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

#myform input[type=radio] {
	display: none !important;
}

#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform label {
	font-size: 2em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 #009223;
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 #009223;
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 #009223;
}

#reviewBtn:hover {
	background-color: #009223;
	color: white !important;
}

.starScore {
	font-size: 1.5em;
	color: #009223;
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



	<!-- Single Page Header start -->

	<div id="carouselExample" class="carousel slide">


		<!-- Single Page Header End -->


		<!-- 게시글 상세 -->

		<div class="row g-4 justify-content-center hero-header"
			style="margin-left: 28%; margin-right: 28%;">

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>

			<div id="carouselExampleControls" class="carousel slide"
				data-bs-ride="carousel" style="position: relative;" align="center">
				<div class="carousel-inner" style="position: absoulte;">
					<div class="carousel-item active">
						<img class="d-block"
							style="object-fit: cover !important; height: 450px;"
							src="resources/g_Image/${c_board.c_img1}" alt="..." />
					</div>
					<c:if test="${not empty c_board.c_img2}">
						<div class="carousel-item">
							<img class="d-block"
								style="object-fit: cover !important; height: 450px;"
								src="resources/g_Image/${c_board.c_img2}" alt="..." />
						</div>
					</c:if>
					<c:if test="${not empty c_board.c_img3}">
						<div class="carousel-item">
							<img class="d-block"
								style="object-fit: cover !important; height: 450px;"
								src="resources/g_Image/${c_board.c_img3}" alt="..." />
						</div>
					</c:if>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"
						style="background-color: grey"></span> <span
						class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"
						style="background-color: grey"></span> <span
						class="visually-hidden">Next</span>
				</button>
			</div>

			<div class="row g-4 justify-content-center">
				<div class="boardContent">
					<span><h6 style="display: inline;">작성자 :
							${c_board.c_writer}</h6></span> <span style="float: right;">${c_board.category}
						/ ${c_board.c_w_date}</span>
				</div>
				<div class="boardContent">
					<h5>${c_board.c_title}</h5>
					<h6>종료 날짜 : ${c_board.c_f_date}</h6>
					<br>
					<div>${c_board.c_content}</div>
				</div>
				<c:choose>
					<c:when test="${empty review_list}">
						<div class="boardContent">
							<h5>리뷰</h5>
							<br>
							<div class="boardContent"
								style="width: 80% !important; text-align: center; margin-left: 65px !important;">
								<h6>아직 등록된 리뷰가 없어요</h6>
							</div>
							<div class="boardContent"
								style="width: 80% !important; margin-left: 65px !important;">
								<form action="insertReview" method="post" id="myform">
									<br>
									<p style="margin-bottom: 0px;">작성자 : ${loginMember.email }</p>
									<input type="hidden" name="email" value="${loginMember.email }"
										readonly="readonly"> <span class="text-bold">평점
										:</span>
									<fieldset>
										<input type="radio" name="r_score" value="5" id="rate1"><label
											for="rate1">★</label> <input type="radio" name="r_score"
											value="4" id="rate2"><label for="rate2">★</label> <input
											type="radio" name="r_score" value="3" id="rate3"><label
											for="rate3">★</label> <input type="radio" name="r_score"
											value="2" id="rate4"><label for="rate4">★</label> <input
											type="radio" name="r_score" value="1" id="rate5"><label
											for="rate5">★</label>
									</fieldset>
									<textarea rows="3" cols="66" name="r_content"
										placeholder="리뷰를 작성해 주세요."
										style="margin-top: 10px; float: bottom;"></textarea>
									<input type="hidden" value="${c_board.c_num}" name="c_num">
									<input type="submit" value="작성" id="reviewBtn"
										class="btn border-secondary px-4 text-primary"
										style="width: 580px !important;">
								</form>

							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="boardContent">
							<h4>리뷰</h4>
							<div class="boardContent"
								style="width: 80% !important; margin-left: 65px !important;">
								<form action="insertReview" method="post" name="myform"
									id="myform">
									<br>
									<p style="margin-bottom: 0px;">작성자 : ${loginMember.email }</p>
									<input type="hidden" name="email" value="${loginMember.email }"
										readonly="readonly"> <span class="text-bold">평점
										:</span>
									<fieldset>
										<input type="radio" name="r_score" value="5" id="rate1"><label
											for="rate1">★</label> <input type="radio" name="r_score"
											value="4" id="rate2"><label for="rate2">★</label> <input
											type="radio" name="r_score" value="3" id="rate3"><label
											for="rate3">★</label> <input type="radio" name="r_score"
											value="2" id="rate4"><label for="rate4">★</label> <input
											type="radio" name="r_score" value="1" id="rate5"><label
											for="rate5">★</label>
									</fieldset>
									<textarea rows="3" cols="66" name="r_content"
										placeholder="리뷰를 작성해 주세요."
										style="margin-top: 10px; float: bottom;"></textarea>
									<input type="hidden" value="${c_board.c_num}"> <input
										type="submit" value="작성" id="reviewBtn"
										class="btn border-secondary px-4 text-primary"
										style="width: 580px !important;">
								</form>
							</div>
							<div class="boardContent"
								style="width: 80% !important; margin-left: 62px !important; margin-top: 60px;">
								<div style="padding-left: 230px;">
									<h5 style="margin-left: 38px; padding-top: 20px;">평점 :
										${scoreDAvg}</h5>

									<c:forEach begin="1" end="${scoreAvg}">
										<span style="margin-right: 5px;" class="starScore">★</span>
									</c:forEach>
									<c:if test="${scoreAvg < 5}">
										<c:forEach begin="1" end="${5 - scoreAvg}" step="1">
											<span style="margin-right: 5px;" class="starScore">☆</span>
										</c:forEach>
									</c:if>
								</div>
							</div>
							<c:forEach items="${review_list}" var="r">
								<div class="boardContent"
									style="width: 80% !important; margin-left: 65px !important; font-size: 13px !important;">
									<span style="margin-right: 10px; font-size: 18px;"><strong>${r.email}</strong></span>
									<span>${r.r_date}</span>
									<p>
										<c:forEach begin="1" end="${r.r_score}" step="1">
											<span style="margin-right: 5px;" class="starScore">★</span>
										</c:forEach>
										<c:if test="${r.r_score < 5}">
											<c:forEach begin="1" end="${5 - r.r_score}" step="1">
												<span style="margin-right: 5px;" class="starScore">☆</span>
											</c:forEach>
										</c:if>
									</p>
									<p>게시글 : ${c_board.c_title}</p>
									<span>${r.r_content}</span>
								</div>
							</c:forEach>

						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>


		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db0a7dd04d902c908bc5aaa345eaa55c&libraries=services"></script>
		<script>
			var addr = document.getElementById("addr").innerText;

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 2
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							addr,
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">픽업 장소</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		</script>


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

		<script type="text/javascript">
			function checkCFavorite() {
				var c_num = $
				{
					c_board.c_num
				}
				;
				console.log(c_num);

				$.ajax({
					url : "checkCFavorite",
					data : {
						'c_num' : c_num
					},
					type : 'get',
					success : function(data) {
						if (data == 1) {

							$("#zzim").text('♥ 찜 완료')
						} else {
							$("#zzim").text('이미 찜한 상품 입니다')
						}
					},
					error : function() {
						alert("통신실패")
					}
				})
			}
		</script>
</body>

</html>