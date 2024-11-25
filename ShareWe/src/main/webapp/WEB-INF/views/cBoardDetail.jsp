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

.starScore {
	font-size: 1.5em;
	color: #009223;
}

#subCancel, #favCancel {
	color: white !important;
	background-color: #009223;
}

.option {
	border-color: #009223;
	height: 45px;
	background-color: transparent;
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



		<div class="row g-4 justify-content-center" id="categoryBox">
			<c:if test="${loginMember.type == 1}">
			<div class="row g-4 justify-content-center">
				<button class="col-xl-1" id="write" type="button"
					onclick="location.href='gogBoard'">게시물작성</button>
			</div>
			</c:if>
		</div>
		<input type="hidden" id="cNum" value="${c_board.c_num}">   
		<input type="hidden" id="payEmail" value="${loginMember.email }">
		<input type="hidden" id="payName" value="${loginMember.name }">
		<input type="hidden" id="payTel" value="${loginMember.tel }">
		<input type="hidden" id="payAddress" value="${loginMember.address }">

		<div class="row g-4 justify-content-center hero-header" style="margin-left: 28%; margin-right: 28%;">
			<input type="hidden" value="${loginMember.email}" id="loginEmail">
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
				<div class="boardContent" style="padding-bottom: 0; height: 60px;">
					<input type="hidden" value="${c_board.c_num}" id="cNum">
					<c:choose>
						<c:when test="${empty loginMember}">
							<button onclick="location.href='goLogin'" style="width: 10%;"
								type="button" class="btn btn-outline-success">❤ 찜</button>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${fav eq 'Yes'}">
									<button onclick="checkCFavorite()" id="cFavorite"
										style="width: 10%; display: none;" type="button"
										class="btn btn-outline-success">❤ 찜</button>
									<button onclick="delCFavorite()" id="favCancel"
										style="width: 10%;" type="button"
										class="btn btn-outline-success">❤ 찜</button>
								</c:when>
								<c:otherwise>
									<button onclick="checkCFavorite()" id="cFavorite"
										style="width: 10%;" type="button"
										class="btn btn-outline-success">❤ 찜</button>
									<button onclick="delCFavorite()" id="favCancel"
										style="width: 10%; display: none;" type="button"
										class="btn btn-outline-success">❤ 찜</button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${loginMember.email eq c_board.email}">
							<nav class="detailMenu" style="float: right;">
								<ul>
									<li><a href="#"> <strong style="float: right;">⁝</strong>
									</a>
										<ul>
											<li><a href="goCUpdate?c_num=${c_board.c_num}">게시글
													수정</a></li>
											<li><a href="deleteCBoard?c_num=${c_board.c_num}">게시글
													삭제</a></li>
										</ul></li>
								</ul>
							</nav>
						</c:when>
						<c:when test="${not empty loginMember }">
							<nav class="detailMenu" style="float: right;">
								<ul>
									<li><a href="#"> <strong style="float: right;">⁝</strong>
									</a>
										<ul>
											<li>

											<form action="sendReportInfo" method="post">
									            <input type="hidden" value="${c_board.c_num}" name="r_num">
									            <input type="hidden" value="${c_board.email}" name="email">
									            <input type="hidden" value="${c_board.c_title}" name="r_title">
									             <input type="hidden" value="${loginMember.email}" name="rp_email">
									               
									            <input type="submit" class="btn btn-primary btn-link"
									            style="background-color:white !important; color:grey !important; border-width:0px !important;"
									            value="신고하기">
            								</form>
											
											</li>
										</ul></li>
								</ul>
							</nav>
						</c:when>
						<c:when test="${ empty loginMember}">
							<nav class="detailMenu" style="float: right;">
								<ul>
									<li><a href="#"> <strong style="float: right;"></strong></a></li>
								</ul>
							</nav>
						</c:when>
					</c:choose>


				</div>
				<div class="boardContent">
					<span>가게명 :
						<h6 style="display: inline; margin-left: 10px;">${c_board.c_writer}</h6>
					</span> <input type="hidden" value="${c_board.c_writer}" id="comName">
					<c:choose>
						<c:when test="${empty loginMember}">
							<button onclick="location.href='goLogin'"
								style="width: 15%; margin-left: 20px;" type="button"
								class="btn btn-outline-success">구독하기</button>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sub eq 'Yes'}">
									<button onclick="checkSubscribe()" id="cSubscribe"
										style="width: 15%; margin-left: 20px; display: none;"
										type="button" class="btn btn-outline-success">구독하기</button>
									<button onclick="delSubscribe()" id="subCancel"
										style="width: 15%; margin-left: 20px;" type="button"
										class="btn btn-outline-success">구독중 ✓</button>
								</c:when>
								<c:otherwise>
									<button onclick="checkSubscribe()" id="cSubscribe"
										style="width: 15%; margin-left: 20px;" type="button"
										class="btn btn-outline-success">구독하기</button>
									<button onclick="delSubscribe()" id="subCancel"
										style="width: 15%; margin-left: 20px; display: none;"
										type="button" class="btn btn-outline-success">구독 취소</button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<span style="float: right;">${c_board.category} /
						${c_board.c_w_date}</span>
				</div>

				<div class="boardContent">
					<h5>${c_board.c_title}</h5>
					<h6>펀딩 종료 날짜 : ${c_board.c_f_date}</h6>
					<br>
					<div>${c_board.c_content}</div>
					<br>

					<form action="buyProduct">
						<select class="option" id="selectVal" name="opIndex" onchange="optSelect(this.value);" >
							<option>옵션을 선택해주세요.</option>
							<c:forEach items="${option}" var="op" varStatus="i">
								<option value="옵션 : ${op}, 가격 : ${price[i.index]} 원">옵션 : ${op}, 가격 : ${price[i.index]}원</option>
							</c:forEach>

						</select>
						<input type="hidden" value="${c_board.c_num }" name="c_num" id="cNum">
						<input type="hidden" value="${c_board.email }" name="cp_email" id="cEmail">
						
						
					</form>
				</div>

				<div class="boardContent" id="opDiv" style="display: none;">
					<span id="optSel" style="width: 500px; float: left; margin-top: 5px;"></span>
					<button style="width: 5%; margin-left: 20px; margin-right: 12px;" type="button" onclick="decrease()" value="-" class="btn btn-outline-success">-</button>
					<span style="width: 5%; margin-left: 5px; margin-right: 12px;"  id="num">0</span>
					<button style="width: 5%;  margin-left: 5px; " type="button" onclick="increase()" value="+" class="btn btn-outline-success">+</button>
					<button style="float: right; width: 15%; margin-left: 0px;" type="button" 
						onclick="pay()" class="btn btn-outline-success">구매하기</button><br>
				</div>
				
				<script type="text/javascript">
					const increase = () => {
			            const pTag = document.getElementById('num');
	
			            pTag.innerText = (parseInt(pTag.innerText) + 1);
			        }
	
			        const decrease = () => {
			            const pTag = document.getElementById('num');
	
			            if(parseInt(pTag.innerText) > 0){
			                pTag.innerText = (parseInt(pTag.innerText) - 1);
			            }
			        }
				</script>
				<div class="boardContent">
					<strong id="addr" style="display: none">${m_addr.address}</strong>
					<h5>픽업장소 : ${m_addr.address}</h5>
					<div id="map" style="width: 100%; height: 350px; margin-top: 30px;"
						class="row g-4 justify-content-center"></div>
				</div>
				<c:choose>
					<c:when test="${empty review_list}">
						<div class="boardContent"
							style="width: 80% !important; margin-left: 65px !important;">
							<h4>리뷰</h4>
							<br>
							<div style="margin-left: 200px;">
								<h6>아직 등록된 리뷰가 없어요.</h6>
								<br>
								<c:choose>
									<c:when test="${empty loginMember}">
										<button style="width: 35%; margin-left: 20px;" type="button"
											onclick="location.href='goLogin'"
											class="btn btn-outline-success">리뷰 작성하기</button>
									</c:when>
									<c:otherwise>
										<button style="width: 35%; margin-left: 20px;" type="button"
											onclick="location.href='writeReview?c_num=${c_board.c_num}'"
											class="btn btn-outline-success">리뷰 작성하기</button>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="boardContent" style="padding-bottom: 0px;">
							<h4>리뷰</h4>
							<br>
						</div>
						<div class="boardContent">
							<div class="boardContent"
								style="width: 80% !important; margin-left: 63px !important;">
								<div style="padding-left: 230px;">
									<h5 style="margin-left: 38px; padding-top: 20px;">평점 :
										${scoreDAvg}</h5>

									<c:forEach begin="1" end="${scoreAvg}" step="1">
										<span style="margin-right: 5px;" class="starScore">★</span>
									</c:forEach>
									<c:if test="${scoreAvg < 5}">
										<c:forEach begin="1" end="${5 - scoreAvg*100/100}" step="1">
											<span style="margin-right: 5px;" class="starScore">☆</span>
										</c:forEach>
									</c:if>
								</div>
							</div>
							<c:forEach items="${review_list}" var="r" end="2">
								<div class="boardContent"
									style="width: 80% !important; margin-left: 65px !important;">
									<div style="font-size: 13px !important;">
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
								</div>
							</c:forEach>
							<div class="boardContent"
								style="width: 80% !important; margin-left: 65px !important; padding-bottom: 10px !important; padding-top: 10px !important;">
								<button
									style="width: 30%; margin-left: 20px; margin-left: 210px;"
									type="button" class="btn btn-outline-success"
									onclick="location.href='writeReview?c_num=${c_board.c_num}'">리뷰
									더 보기</button>
								</td>
								</tr>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>


		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db0a7dd04d902c908bc5aaa345eaa55c&libraries=services"></script>
		<script>
		
		var addr =  document.getElementById("addr").innerText;
		
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
			function checkCFavorite(){
				var c_num = document.getElementById("cNum").value;
				
				document.getElementById("favCancel").style.display = "inline";
				document.getElementById("cFavorite").style.display = "none";
						$.ajax(
						{
							url : "insertFavorite",
							data : {'c_num' : c_num},
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

		<script type="text/javascript">
			function delCFavorite(){
				var c_num = document.getElementById("cNum").value;
				
				
				document.getElementById("cFavorite").style.display = "inline";
				document.getElementById("favCancel").style.display = "none";
						$.ajax(
						{
							url : "delFavorite",
							data : {'c_num' : c_num},
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

		<!-- 구독 버튼 -->
		<script type="text/javascript">
				function checkSubscribe(){
					var c_name = document.getElementById("comName").value;

				document.getElementById("subCancel").style.display = "inline";
				document.getElementById("cSubscribe").style.display = "none";
						
						$.ajax(
						{
							url : "checkSub",
							data : {'c_name' : c_name},
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

		<!-- 구독 취소 버튼 -->
		<script type="text/javascript">
				function delSubscribe(){
					var c_name = document.getElementById("comName").value;

				document.getElementById("cSubscribe").style.display = "inline";
				document.getElementById("subCancel").style.display = "none";
						
						$.ajax(
						{
							url : "delSub",
							data : {'c_name' : c_name},
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

		
		<!-- 옵션선택 비동기 -->
		<script type="text/javascript">
			function optSelect(value){
				/* var opt = document.getElementById("optSelect").value;
	 */
	 			var opt = value.replace(/\n/g, '');
				document.getElementById("opDiv").style.display = "block";
				document.getElementById("optSel").innerText = opt;
				
				
					/* $.ajax(
					{
						url : "checkOpt",
						data : {'c_name' : c_name},
						type :'get',
						success : function(){
							
						},
						error : function(){
							alert("통신실패")
						}
					}
				) */
			}
		</script>
		
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
   		<script>
	        function pay() {
	        	
	        	var optVal = document.getElementById("optSel").innerText;
	        	console.log(optVal)
	        	var word = optVal.split(',');
	        	var word1 = word[0].split(':')[1]
	        	var inputUp = word[0].split(':')[1];
	        	var price = parseInt(word[1].split(' ')[3]);
	        	
	        	var cnt = parseInt(document.getElementById("num").innerText);
	        	console.log(price, cnt)
	        	var inputPrice = price*cnt;
	        	/*var selectedGoodsName = document.querySelector(".kg_pay_btn").getAttribute("data-name");*/
	        	
	        	var inputEmail = document.getElementById("payEmail").value;
	        	var inputName = document.getElementById("payName").value;
	        	var inputTel = document.getElementById("payTel").value;
	        	var inputAddress = document.getElementById("payAddress").value;
	        	var c_num = document.getElementById("cNum").value;
	        	var cp_email = document.getElementById("cEmail").value;
	        	
	        	
	        	
	            var IMP = window.IMP;
	            IMP.init("imp14502251");
	            // 원포트 관리자 페이지 -> 내정보 -> 가맹점식별코드
	            // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
	            IMP.request_pay({
	                pg: 'html5_inicis',  // 실제 계약 후에는 실제 상점아이디로 변경
	                pay_method: 'card', // 'card'만 지원됩니다.
	                merchant_uid: 'ShareWe_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
	                name: inputUp, // 상품 이름
	                amount: inputPrice, // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다.
	                buyer_email: inputEmail,
	                buyer_name: inputName,
	                buyer_tel: inputTel,
	                buyer_addr: inputAddress,
	                buyer_postcode: '123-456',
	                m_redirect_url: 'https://www.myservice.com/payments/complete/mobile',
	                p_cnt: cnt
	                
	            }, function (rsp) {
	                if (rsp.success) {  // 결제가 성공했을 때
	                    // 결제가 완료되었을 떄 결제 정보를 뜨게 만듬
	                    var msg = '결제가 완료되었습니다.';
	                    msg += '고유ID : ' + rsp.imp_uid;
	                    msg += '상점 거래ID : ' + rsp.merchant_uid;
	                    msg += '결제 금액 : ' + rsp.paid_amount;
	                    msg += '카드 승인번호 : ' + rsp.apply_num;
	                    
	                    let f = document.createElement('form');
		                
	                    let obj1;
		        		    obj1 = document.createElement('input');
		        		    obj1.setAttribute('type', 'hidden');
		        		    obj1.setAttribute('name', 'c_num');
		        		    obj1.setAttribute('value', c_num);
		        		
		        		let obj2;
		        		    obj2 = document.createElement('input');
		        		    obj2.setAttribute('type', 'hidden');
		        		    obj2.setAttribute('name', 'email');
		        		    obj2.setAttribute('value', inputEmail);
		        		
		        		let obj3;
		        		    obj3 = document.createElement('input');
		        		    obj3.setAttribute('type', 'hidden');
		        		    obj3.setAttribute('name', 'pc_name');
		        		    obj3.setAttribute('value', inputUp);
		        		
		        		let obj4;
		        		    obj4 = document.createElement('input');
		        		    obj4.setAttribute('type', 'hidden');
		        		    obj4.setAttribute('name', 'pc_price');
		        		    obj4.setAttribute('value', inputPrice);
		        		    
		        		
		        		let obj5;
		        		    obj5 = document.createElement('input');
		        		    obj5.setAttribute('type', 'hidden');
		        		    obj5.setAttribute('name', 'apply_num');
		        		    obj5.setAttribute('value', rsp.apply_num);
		        		
		        		let obj6;
		        		    obj6 = document.createElement('input');
		        		    obj6.setAttribute('type', 'hidden');
		        		    obj6.setAttribute('name', 'pc_cnt');
		        		    obj6.setAttribute('value', cnt);
		        		
		        		let obj7;
		        		    obj2 = document.createElement('input');
		        		    obj2.setAttribute('type', 'hidden');
		        		    obj2.setAttribute('name', 'cp_email');
		        		    obj2.setAttribute('value', cp_email);
		        		
		        		
		        		    f.appendChild(obj1);
		        		    f.appendChild(obj2);
		        		    f.appendChild(obj3);
		        		    f.appendChild(obj4);
		        		    f.appendChild(obj5);
		        		    f.appendChild(obj6);
		        		    f.appendChild(obj7);
		        		    f.setAttribute('method', 'post');
		        		    f.setAttribute('action', 'payObjectSuccess');
		        		    document.body.appendChild(f);
		        		    f.submit();
	                    
	                    
	                } else {    // 결제가 실패했을 때
	                    // 결제에 실패했을떄 실패메세지와 실패사유를 출력
	                    var msg = '결제에 실패하였습니다.';
	                    msg += '실패 사유 : ' + rsp.error_msg;
	                }
	                alert(msg);
	            });
	        }

   		</script>
</body>

</html>