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
				<a href="goMain" class="navbar-brand">
					<h1 class="text-primary display-6"
						style="color: #009223 !important;">ShareWe?</h1>
				</a>
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
							style="border-color: #009223 !important" data-bs-toggle="modal"
							data-bs-target="#searchModal">
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
		<h1 class="text-center text-white display-6">우리 동네</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item active text-white">${m_address}</li>
		</ol>
	</div>
	<!-- Single Page Header End -->

	<!-- 검색 상품 Start-->
	<div class="container-fluid fruite py-5"
		style="width: 60% !important; justify-content: center; align-items: center;">
		<div class="container py-5">
			<div class="tab-class text-center">
				<div class="row g-4">
					<div class="col-lg-4 text-start">
						<h1>Share 게시글</h1>
					</div>
					<div class="col-lg-8 text-end">
						<ul class="nav nav-pills d-inline-flex text-center mb-5">
							<li class="nav-item"><a
								class="d-flex m-2 py-2 bg-light rounded-pill" href="gHood">
									<span class="text-dark" style="width: 140px;">➕ 상품 더보기</span>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="tab-content" style="margin-top: 50px;">
					<div id="tab-1" class="tab-pane fade show p-0 active">
						<div class="row g-4">
							<div class="col-lg-12">
								<div class="row g-4">
									<c:choose>
										<c:when test="${not empty gboard_list}">
											<c:forEach items="${gboard_list }" var="g" end="7">
												<c:forEach items="${add_email}" var="e">
													<c:if test="${e.email eq g.email}">
														<div class="col-md-6 col-lg-4 col-xl-3"
															style="margin: 10px; width: 23%; height: 10%; margin-bottom: 20px;">
															<div class="rounded position-relative fruite-item">
																<div class="fruite-img">
																	<a href="G_BoardContent?g_num=${g.g_num}"> <img
																		src="resources/g_Image/${g.g_img1}"
																		class="img-fluid w-100 rounded-top" alt="">
																	</a>
																</div>
																<div
																	class="text-white bg-secondary px-3 py-1 rounded position-absolute"
																	style="top: 10px; left: 10px;">${g.category}</div>
																<div
																	class="p-4 border border-secondary border-top-0 rounded-bottom"
																	style="text-align: left;">
																	<br> <a href="G_BoardContent?g_num=${g.g_num}">
																		<h5>${g.g_title }</h5>
																	</a>
																	<h6 style="display: inline;">${g.g_writer }</h6>

																	<c:choose>
																		<c:when test="${empty loginMember}">
																			<a onclick="location.href='goLogin'"
																				style="float: right;" type="button"
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

																				<a onclick="checkGFavorite(${g.g_num})"
																					id="${g.g_num}"
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
																				<a onclick="checkGFavorite(${g.g_num})"
																					id="${g.g_num}" style="float: right;" type="button"
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

													</c:if>

												</c:forEach>

											</c:forEach>
										</c:when>
										<c:otherwise>
											<div class="container-fluid fruite py-5">
												<div class="container py-5">
													<div class="tab-class text-center">
														<div class="row g-4 justify-content-center">
															<h4>"검색 결과가 없습니다."</h4>
														</div>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid fruite py-5"
		style="width: 60% !important; justify-content: center; align-items: center;">
		<div class="container py-5">
			<div class="tab-class text-center">
				<div class="row g-4">
					<div class="col-lg-4 text-start">
						<h1>Shop 게시글</h1>
					</div>
					<div class="col-lg-8 text-end">
						<ul class="nav nav-pills d-inline-flex text-center mb-5">
							<li class="nav-item"><a
								class="d-flex m-2 py-2 bg-light rounded-pill" href="cHood">
									<span class="text-dark" style="width: 140px;">➕ 상품 더보기</span>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="tab-content" style="margin-top: 50px;">
					<div id="tab-1" class="tab-pane fade show p-0 active">
						<div class="row g-4">
							<div class="col-lg-12">
								<div class="row g-4">
									<c:choose>
										<c:when test="${not empty cboard_list }">

											<c:forEach items="${cboard_list }" var="c" end="7">
												<c:forEach items="${add_email}" var="e">
													<c:if test="${e.email eq c.email}">
														<div class="col-md-6 col-lg-4 col-xl-3"
															style="margin: auto; width: 23%; height: 10%; margin-bottom: 20px;">
															<div class="rounded position-relative fruite-item">
																<div class="fruite-img">
																	<a
																		href="C_BoardContent?c_num=${c.c_num}&c_writer=${c.c_writer}">
																		<img src="resources/g_Image/${c.c_img1}"
																		class="img-fluid w-100 rounded-top" alt="">
																	</a>
																</div>
																<div
																	class="text-white bg-secondary px-3 py-1 rounded position-absolute"
																	style="top: 10px; left: 10px;">${c.category}</div>
																<div
																	class="p-4 border border-secondary border-top-0 rounded-bottom"
																	style="text-align: left;">
																	<br> <a
																		href="C_BoardContent?c_num=${c.c_num}&c_writer=${c.c_writer}"><h5>${c.c_title}</h5></a>
																	<h6 style="display: inline;">${c.c_writer }</h6>
																	<c:choose>
																		<c:when test="${empty loginMember}">
																			<a onclick="location.href='goLogin'"
																				style="float: right;" type="button"
																				class="btn border border-secondary rounded-pill px-3 text-primary">❤
																				찜</a>
																		</c:when>
																		<c:otherwise>

																			<c:set var="num" value="0" />
																			<c:forEach items="${cfavorite_list}" var="f">
																				<c:if test="${f.c_num eq c.c_num}">
																					<c:set var="num" value="1" />
																				</c:if>


																			</c:forEach>
																			<c:if test="${num eq '1'}">

																				<a onclick="checkCFavorite(${c.c_num})"
																					id="${c.c_num}"
																					style="float: right; display: none;" type="button"
																					class="btn border border-secondary rounded-pill px-3 text-primary">❤
																					찜</a>
																				<a onclick="delCFavorite(${c.c_num})"
																					id="favCancel${c.c_num}"
																					style="float: right; background-color: green; color: white !important;"
																					type="button"
																					class="btn border border-secondary rounded-pill px-3 text-primary">❤
																					찜</a>
																			</c:if>
																			<c:if test="${num eq '0'}">
																				<a onclick="checkCFavorite(${c.c_num})"
																					id="${c.c_num}" style="float: right;" type="button"
																					class="btn border border-secondary rounded-pill px-3 text-primary">❤
																					찜</a>
																				<a onclick="delCFavorite(${c.c_num})"
																					id="favCancel${c.c_num}"
																					style="float: right; display: none; background-color: green; color: white !important;"
																					type="button"
																					class="btn border border-secondary rounded-pill px-3 text-primary">❤
																					찜</a>
																			</c:if>



																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
														</div>
													</c:if>

												</c:forEach>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<div class="container-fluid fruite py-5">
												<div class="container py-5">
													<div class="tab-class text-center">
														<div class="row g-4 justify-content-center">
															<h4>"검색 결과가 없습니다."</h4>
														</div>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 판매 상품 End-->


	<!-- 메인 페이지 하단 -->
	<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					<div class="footer-item">
						<h4 class="text-light mb-3">Contact</h4>
						<p>Address: 1429 Netus Rd, NY 48247</p>
						<p>Email: Example@gmail.com</p>
						<p>Phone: +0123 4567 8910</p>
						<p>Payment Accepted</p>
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



	<script type="text/javascript">

				function checkCFavorite(c_num){
					 var id = "favCancel" + c_num;
				
					console.log(c_num)
					console.log(id)
					document.getElementById(id).style.display = "inline";
					document.getElementById(c_num).style.display = "none";
					
				$.ajax(
				{
					url : "insertFavorite",
					data : {'c_num' : c_num},
					type :'get',
					success : function(){
						
					},
					error : function(){
						alert("로그인이 필요합니다")
					}
				}
			)
		}
				</script>
	<script type="text/javascript">
			function delCFavorite(c_num){
				var id = "favCancel" + c_num;
				console.log(c_num)
				console.log(id)
				document.getElementById(c_num).style.display = "inline";
				document.getElementById(id).style.display = "none";
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

</body>

</html>