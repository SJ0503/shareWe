
<%@page import="kr.smhrd.entity.g_board"%>

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
	line-height: 50px;
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

.boardContent {
	border-bottom: 1px solid grey;
	padding-left: 20px;
	padding-top: 20px;
	padding-bottom: 20px;
	margin: 0 auto;
}
</style>

</head>
<body>
	<%
	member loginMember = (member) session.getAttribute("loginMember");
	g_board g_board = (g_board) session.getAttribute("g_board");
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
					<%if (loginMember == null) {%>
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

							<a href="goGeneral" class="nav-item nav-link" style="color: black; font-size: 18px;"><strong>공구함</strong></a>
							<a href="goCompany" class="nav-item nav-link" style="color: black; font-size: 18px;"><strong>동네구경</strong></a>
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
		<h1 class="text-center text-white display-6">마이페이지</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item active text-white">My Page</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- Fruits Shop Start-->


	<div class="container-fluid fruite py-5" align="center">

		<div class="card" style="width: 1000px" align="center">
			<table width="1000px">
				<tr>
					<td><img src="resources/g_Image/avatar.jpg" class="card-img-top"
						style="width: 200px; height: 200px; margin: 50px;" align="left">
					</td>
					<td width="600px" border-top="0px">
						<div class="sc-eKZiaR jfoJEs">

							<script type="text/javascript">
								 function div_show() {
									document.getElementById("ReNick").style.display = "block";
									document.getElementById("none").style.display = "none";
								}
								function div_hide() {
									document.getElementById("ReNick").style.display = "none";
									document.getElementById("none").style.display = "block";
								}
							</script>

							<div>
								 
								<h5>${loginMember.nick}</h5>

								<div id="ReNick" style="display: none">
									<form action="UpdateNick">
										<input type="hidden" value="${loginMember.email}" name="email">
										<input type="text" value="${loginMember.nick}" name="nick">
										<button type="submit" onclick="div_hide();">확인</button>
									</form>
								</div>

								<p><%=loginMember.getEmail()%></p>

							</div>
					</td>

					<td>
						<div class="card-body" style="width: 200px">
							<a href="goUpdateMember" align="left" class="btn btn-primary"
								style="color: white">회원정보 수정</a> <br> <br> <a
								href="goDeleteMember" align="left" class="btn btn-primary"
								style="color: green; background-color: white;">회원 탈퇴</a>
						</div>
					</td>

					</div>
			</table>
		</div>


		<br> <br> <br>
	</div>

	<div class="row g-4 justify-content-center" id="categoryBox"
		style="width: auto;">


	<c:choose>
		<c:when test="${loginMember.type == 2 || loginMember.type == 3}">
			<ul class="filters_menu">
				<a onclick="getCategory()" id="clickVege">
					<li class="list-group-item">찜 목록</li>
				</a>
	
				<a onclick="getBoard()" id="clickVege">
					<li class="list-group-item">My 게시글</li>
				</a>
	
				<a onclick="getReview()" id="clickVege">
					<li class="list-group-item">My 리뷰</li>
				</a>
	
				<a onclick="getSub()" id="clickVege">
					<li class="list-group-item">구독권</li>
				</a>
	
				<a onclick="getJoin()" id="clickVege">
					<li class="list-group-item">결제 내역</li>
				</a>
			</ul>
		</c:when>
		<c:otherwise>
			<ul class="filters_menu">
				<a onclick="getBoard()" id="clickVege">
					<li class="list-group-item">My 게시글</li>
				</a>
				<a onclick="getJoin()" id="clickVege">
					<li class="list-group-item">주문 내역</li>
				</a>
			</ul>
		</c:otherwise>
	</c:choose>



		<script type="text/javascript">
			function getBoard() {

				document.getElementById("myCategory").style.display = "none";
				document.getElementById("myBoard").style.display = "block";
				document.getElementById("myReview").style.display = "none";
				document.getElementById("mySub").style.display = "none";
				document.getElementById("myJoin").style.display = "none";
			}
		</script>
		<script type="text/javascript">
			function getCategory() {
				document.getElementById("myCategory").style.display = "block";
				document.getElementById("myBoard").style.display = "none";
				document.getElementById("myReview").style.display = "none";
				document.getElementById("mySub").style.display = "none";
				document.getElementById("myJoin").style.display = "none";

			}
		</script>
		<script type="text/javascript">
			function getReview() {
				document.getElementById("myCategory").style.display = "none";
				document.getElementById("myBoard").style.display = "none";
				document.getElementById("myReview").style.display = "block";
				document.getElementById("mySub").style.display = "none";
				document.getElementById("myJoin").style.display = "none";
			}
		</script>
		<script type="text/javascript">
			function getSub() {
				document.getElementById("myCategory").style.display = "none";
				document.getElementById("myBoard").style.display = "none";
				document.getElementById("myReview").style.display = "none";
				document.getElementById("mySub").style.display = "block";
				document.getElementById("myJoin").style.display = "none";
			}
		</script>
		<script type="text/javascript">
			function getJoin() {
				document.getElementById("myCategory").style.display = "none";
				document.getElementById("myBoard").style.display = "none";
				document.getElementById("myReview").style.display = "none";
				document.getElementById("mySub").style.display = "none";
				document.getElementById("myJoin").style.display = "block";
			}
		</script>




		<!-- 게시글 상세보기 -->
		<div align="center" id="myBoard" style="display: none; width: 1500px;">
			<br>

			<c:if test="${loginMember.type == 2 || loginMember.type == 3}">

				<div class="row g-4 justify-content-center">
					<div class="class=" col-md-6 col-lg-6
						col-xl-4"
					style="width: 100%;">
						<div class="rounded position-relative fruite-item"
							style="width: 1500px;">


							<c:forEach items="${gboard_list}" var="g">
								<div class="p-4 border border-secondary  rounded"
									style="width: 300px; border: solid; border-width: 1px; margin: auto; border-color: #EEEEEE !important; display: inline-block;"
									align="cenber;">
									<div>
										<a href="G_BoardContent?g_num=${g.g_num}"> <img alt=""
											src="resources/g_Image/${g.g_img1}" align="left"
											class='img-fluid w-100 rounded-top'
											style="width: 150px; height: 150px; !important;"></a> 
									</div>
										<a href="G_BoardContent?g_num=${g.g_num}">
											<h4 style="text-align: center; height: 130px;">${g.g_title}</h4></a>
									 <br><br> <strong style="color: #A4A4A4;">${g.category }</strong>
									<hr>
									<strong style="color: #A4A4A4;">${g.g_w_date }</strong>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</c:if>

			<c:if test="${loginMember.type == 1}">
				<div class="row g-4 justify-content-center">
					<div class="class=" col-md-6 col-lg-6
						col-xl-4"
					style="width: 100%;">
						<div class="rounded position-relative fruite-item"
							style="width: 1500px;">


							<c:forEach items="${cboard_list}" var="c">
								<div class="p-4 border border-secondary  rounded"
									style="width: 300px; border: solid; border-width: 1px; margin: auto; border-color: #EEEEEE !important; display: inline-block;"
									align="cenber;">

								
									<a href="C_BoardContent?c_num=${c.c_num}&c_writer=${c.c_writer}">
										<img alt="" src="resources/g_Image/${c.c_img1}" align="left"
										class='img-fluid w-100 rounded-top'
										style="width: 150px; height: 150px; !important;">
									</a> <a
										href="C_BoardContent?c_num=${c.c_num}&&c_writer=${c.c_writer}">
										<h4 style="text-align: center;">${c.c_title}</h4>
									</a> <br> <strong style="color: #A4A4A4;">${c.category }</strong>
									<hr>
									<strong style="color: #A4A4A4;">${c.c_w_date }</strong>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</c:if>
		</div>

		<!-- my 찜 및카테고리 -->
		<div align="center" id="myCategory"
			style="display: none; width: 1500px;">

			<ul class="filters_menu" style="margin: 0px;">
				<a onclick="getGen()" style="margin: 10px;">
					<li id="genText" style="border-color: white; color: green;">일반</li>
				</a>
				<a onclick="getCom()" style="margin: 10px;">
					<li id="comText" style="border-color: white;">기업</li>
				</a>
			</ul>

			<script type="text/javascript">
				function getGen() {
					document.getElementById("gen").style.display = "block";
					document.getElementById("com").style.display = "none";
					document.getElementById("comText").style.color = "black";
					document.getElementById("genText").style.color = "green";

				}
				function getCom() {
					document.getElementById("gen").style.display = "none";
					document.getElementById("com").style.display = "block";
					document.getElementById("comText").style.color = "green";
					document.getElementById("genText").style.color = "black";

				}
			</script>


			<br>

			<div class="row g-4 justify-content-center">

				<div id="com" class="col-md-6 col-lg-6 col-xl-4"
					style="width: 100%; display: none;">
					<div class="rounded position-relative fruite-item"
						style="width: 1500px;">

						<c:forEach items="${Cfv_list}" var="f">

							<div class="p-4 border border-secondary  rounded"
								style="width: 300px; border: solid; border-width: 1px; margin: auto; border-color: #EEEEEE !important; display: inline-block;"
								align="cenber;">

								<c:forEach items="${allC_list}" var="c">
									<c:if test="${f.c_num eq c.c_num}">
										<a
											href="C_BoardContent?c_num=${c.c_num}&c_writer=${c.c_writer}">
											<img alt="" src="resources/g_Image/${c.c_img1}" align="left"
											class='img-fluid w-100 rounded-top'
											style="width: 150px; height: 150px; !important;">
										</a>
										<a
											href="C_BoardContent?c_num=${c.c_num}&c_writer=${c.c_writer}">

											<h3 style="text-align: center;">${c.c_title}</h3>
										</a>

										<br>
										<strong style="color: #A4A4A4;">${c.category }</strong>
										<hr>
										<strong style="color: #A4A4A4;">${c.c_w_date }</strong>
									</c:if>
								</c:forEach>


							</div>
						</c:forEach>

					</div>
				</div>


				<div id="gen" class="col-md-6 col-lg-6 col-xl-4"
					style="width: 100%;">
					<div class="rounded position-relative fruite-item"
						style="width: 1500px;">

						<c:forEach items="${Gfv_list}" var="f">

							<div class="p-4 border border-secondary  rounded"
								style="width: 300px; border: solid; border-width: 1px; margin: auto; border-color: #EEEEEE !important; display: inline-block;"
								align="cenber;">

								<c:forEach items="${allG_list}" var="g">
									<c:if test="${f.g_num eq g.g_num}">
										<a href="G_BoardContent?g_num=${g.g_num}"> <img alt=""
											src="resources/g_Image/${g.g_img1}" align="left"
											class='img-fluid w-100 rounded-top'
											style="width: 150px; height: 150px; !important;"></a>
										<a href="G_BoardContent?g_num=${g.g_num}">

											<h3 style="text-align: center;">${g.g_title}</h3>
										</a>

										<br>
										<strong style="color: #A4A4A4;">${g.category }</strong>
										<hr>
										<strong style="color: #A4A4A4;">${g.g_w_date }</strong>
									</c:if>
								</c:forEach>


							</div>
						</c:forEach>

					</div>
				</div>

			</div>

		</div>
		<!-- 리뷰관리  -->
		<div class="col-lg-9" id="myReview" style="display: none">

			<div class="row g-4 justify-content-center">
				<div class="rounded position-relative fruite-item">
					<h3 align="center">리뷰</h3>
					<br>
					<c:choose>
						<c:when test="${empty review_list}">

							<br>
							<div class="boardContent"
								style="width: 80% !important; text-align: center;">
								<h6>등록한 리뷰가 없습니다.</h6>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${review_list}" var="r">
								<div class="boardContent"
									style="width: 80% !important; height: 180px; font-size: 13px !important; border: solid; border-color: #A4A4A4; border-width: 0.1px;">


									<c:forEach items="${allC_list}" var="c">
										<c:if test="${r.c_num == c.c_num }">

											<a
												href="C_BoardContent?c_num=${c.c_num}&c_writer=${c.c_writer}">
												<img alt="" src="resources/g_Image/${c.c_img1}" align="left"
												style="width: 140px; height: 140px; margin-right: 35px !important;">
											</a>

											<a
												href="C_BoardContent?c_num=${c.c_num}&c_writer=${c.c_writer}">
												<b style="text-align: left; font-size: x-large;">${c.c_title}</b>
											</a>

											<span><c:forEach begin="1" end="${r.r_score}" step="1">
													<span
														style="margin-right: 5px; margin-bottom: 30px; font-size: x-large;"
														class="starScore">★</span>
												</c:forEach> <c:if test="${r.r_score < 5}">
													<c:forEach begin="1" end="${5 - r.r_score}" step="1">
														<span
															style="margin-right: 5px; margin-bottom: 15px; font-size: large;"
															class="starScore">☆</span>
													</c:forEach>
												</c:if></span>
											<br>
											<br>

											<strong style="text-align: left; font-size: large;">${r.r_content}</strong>
											<br>
											<hr>
											<p style="color: #A4A4A4; margin: 0px;" align="left">작성일
												${r.r_date}</p>
										</c:if>

									</c:forEach>


								</div>
								<br>
							</c:forEach>

						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</div>
		<!-- 구독권 -->


		<div class="col-lg-9" id="mySub" style="display: none">

			<div class="row g-4 justify-content-center">
				<div class="col-md-6 col-lg-6 col-xl-4" style="width: 1200px">
					<div class="rounded position-relative fruite-item">
						<div class="boardContent" style="width: 80% !important; text-align: center; border-left: 0;">
							<h3>구독권</h3>
							<table>
							    <tr style="border-bottom: solid 2px;">
							      <th>email</th>
							      <th>POP 체험기회</th>
							      <th>보유중인 POP권</th>
							    </tr>
							    <tr style="">
							      <td style="border-right: 0; border-left: 0; border-bottom: solid 2px;">
							      	${loginMember.email}
							      </td>
							      <td style="border-right: 0; border-left: 0; border-bottom: solid 2px;">
							      	${sub_list.free_cnt } 회
							      </td>
							      <td style="border-right: 0; border-left: 0; border-bottom: solid 2px;">
							     	${sub_list.paid_cnt } 회
							      </td>
							    </tr>
							</table>
						</div>
         	


					</div>
				</div>
			</div>
		</div>



		<!-- 참여내역 -->
		<div class="col-lg-9" id="myJoin" style="display: none">

			<div class="row g-4 justify-content-center">
				<div class="col-md-6 col-lg-6 col-xl-4" style="width: 1200px">
					<div class="boardContent" style="width: 80% !important; font-size: 16px !important; text-align: center;">
						<h3 style="margin-bottom: 10px;">주문내역</h3>
						<c:choose>
							<c:when test="${loginMember.type == 2 || loginMember.type == 3}">
								<table style="width: 80% !important; text-align: center; margin-left: 70px;">
										<tr>
											<th style="background-color: #009223 !important;"><strong>번호</strong></th>
											<th style="background-color: #009223 !important;"><strong>상품명</strong></th>
											<th style="background-color: #009223 !important;"><strong>가격</strong></th>
											<th style="background-color: #009223 !important;"><strong>수량</strong></th>
											<th style="background-color: #009223 !important;"><strong>승인번호</strong></th>
											<th style="background-color: #009223 !important;"><strong>주문상태</strong></th>
										</tr>
								<c:forEach items="${purchase_list}" var="p" varStatus="i">
									<tr>
										<td style="margin-right: 20px;">${i.count}</td>
										<td style="margin-right: 20px;">${p.pc_name }</td>
										<td style="margin-right: 20px;">${p.pc_price }</td>
										<td style="margin-right: 20px;">${p.pc_cnt }</td>
										<td style="margin-right: 20px;">${p.apply_num }</td>
										<c:choose>
											<c:when test="${p.pc_state == 0}">
												<td style="margin-right: 20px;">주문대기</td>
											</c:when>
											<c:when test="${p.pc_state == 1}">
												<td style="margin-right: 20px;">상품준비중</td>
											</c:when>
											<c:when test="${p.pc_state == 2}">
												<td style="margin-right: 20px;">픽업가능</td>
											</c:when>
											<c:otherwise>
												<td style="margin-right: 20px;">픽업완료</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
								</table>
							</c:when>
							<c:otherwise>
								<table style="width: 90% !important; text-align: center; margin-left: 25px;">
										<tr>
											<th style="background-color: #009223 !important;"><strong>주문자 이메일</strong></th>
											<th style="background-color: #009223 !important;"><strong>상품명</strong></th>
											<th style="background-color: #009223 !important;"><strong>가격</strong></th>
											<th style="background-color: #009223 !important;"><strong>수량</strong></th>
											<th style="background-color: #009223 !important;"><strong>승인번호</strong></th>
											<th style="background-color: #009223 !important;"><strong>주문상태</strong></th>
											<th style="background-color: #009223 !important;"><strong>주문상태 변경</strong></th>
										</tr>
									<c:forEach items="${purchase_list}" var="p" varStatus="i">
										<tr>
											<td style="margin-right: 20px;">${p.email}</td>
											<td style="margin-right: 20px;">${p.pc_name }</td>
											<td style="margin-right: 20px;">${p.pc_price }</td>
											<td style="margin-right: 20px;">${p.pc_cnt }</td>
											<td style="margin-right: 20px;">${p.apply_num }</td>
											<c:choose>
												<c:when test="${p.pc_state == 0}">
													<td style="margin-right: 20px;">주문대기</td>
												</c:when>
												<c:when test="${p.pc_state == 1}">
													<td style="margin-right: 20px;">상품준비중</td>
												</c:when>
												<c:when test="${p.pc_state == 2}">
													<td style="margin-right: 20px;">픽업가능</td>
												</c:when>
												<c:otherwise>
													<td style="margin-right: 20px;">픽업완료</td>
												</c:otherwise>
											</c:choose>
											<td style="margin-right: 20px;">
												<form action="updatePC_State">
													<input type="hidden" value="${p.email}" name="email">
													<select id="pc_state" name="pc_state">
														<option value="0">주문대기</option>
														<option value="1">상품준비중</option>
														<option value="2">픽업가능</option>
														<option value="3">픽업완료</option>
													</select>
													<input type="submit" value="변경">
												</form>
											</td>
										</tr>
									</c:forEach>
									</table>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

		<!-- <script type="text/javascript">
			function updateState(){
				var pc_state = document.getElementById("pc_state").value;
				var pc_email = document.getElementById("pc_email").value;
	
						$.ajax(
						{
							url : "updatePC_State",
							data : {'pc_state' : pc_state,
									'email' : email},
							type :'get',
							success : function(){
								
							},
							error : function(){
								alert("통신실패")
							}
						}
					)
			}
		</script> -->





		<!-- <div class="container py-5">
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-xl-3">
						</div>
						<div class="col-6"></div>
					</div>
					<div class="row g-4">
						<div class="col-lg-3">
							
						</div>

						<div class="col-lg-9">
							<div class="row g-4 justify-content-center">
								
				
							</div>
						</div>


					</div>
				</div>
			</div>
		</div> -->

	</div>
	</div>
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