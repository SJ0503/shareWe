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

<link rel='stylesheet' href='/stylesheets/style.css' />
<!-- jquery -->
<script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
<script src="/javascript/popup_2.js"></script>

</head>
<body>

<%
		member loginMember = (member)session.getAttribute("loginMember");
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
							<a href="goLogin" class="text-white"><small class="text-white mx-2">로그인</small>/</a>
							<a href="goMemberType" class="text-white"><small class="text-white mx-2">회원가입</small></a>
						<%}else {%>
							<span><small class="text-white mx-2"><%=loginMember.getNick() %>님 환영합니다.</small></span>
							<%if(loginMember.getEmail().equals("admin")) {%>
								<a href="#" class="text-white"><small class="text-white ms-2">회원관리</small></a>
							<%} %>
							<a href="memberLogout" class="text-white"><small class="text-white mx-2">로그아웃</small></a>
						<%} %>
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
							style="height: 800px; padding-bottom: 100px; width:50% !important;  justify-content: center; align-items: center;">
							<input type="text" class="form-control p-3" name="searchText" style="height: 58px;"
								placeholder="검색어를 입력해주세요." aria-describedby="search-icon-1">
							<input type="submit" value="검색" id="search-icon-1" style="border-top-right-radius: 10px; border-bottom-right-radius: 10px; height: 58px;"
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
		<h1 class="text-center text-white display-6">회원정보 수정</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item active text-white">Update User Information</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- 회원정보 수정 시작-->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<form action="memberUpdate" method="post">
				<div class="row g-5 justify-content-center">
					<div class="col-md-12 col-lg-6 col-xl-7">
						
							<input type="hidden" value="${loginMember.type}" name="type">
							<div class="form-item">
								<div class="form-item">
									<label class="form-label my-3">이메일</label>
									<input type="text" class="form-control" value="${loginMember.email }" name="email" readonly >
								</div>
							</div>
						 												
											
						<c:if test="${loginMember.type != 3 }">
						<div class="form-item">
							<label class="form-label my-3">비밀번호</label>
							<input type="password" class="form-control" name="pw" value="${loginMember.pw}">
						</div>
						<div class="form-item">
							<label class="form-label my-3">비밀번호 확인</label> 
							<input type="password" class="form-control">
						</div>
						</c:if>
						
						<div class="form-item">
							<label class="form-label my-3">이름</label>
							<input type="text" class="form-control" name="name" value="${loginMember.name}">
						</div>
						
						
						<c:if test="${loginMember.type == 1}">
							<div class="form-item">
								<label class="form-label my-3">기업이름</label>
								<input	type="text" class="form-control" name="nick" value="${loginMember.nick}">
							</div>
						</c:if>

						<c:if test="${loginMember.type == 2 || loginMember.type == 3}">
							<div class="form-item">
								<label class="form-label my-3">닉네임</label>
								<input type="text" class="form-control" name="nick" value="${loginMember.nick}">
							</div>
						</c:if>	
						
					
						<div class="form-item">
							<label class="form-label my-3">도로명 주소</label>
							<br>
							<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control" style="width: 300px; display: inline !important;"">
							<input type="button" onclick="sample6_execDaumPostcode()" 
								value="우편번호 찾기"  class="btn border-secondary py-2 px-2  text-primary"
								style="width: 150px !important; height: 36px !important; display: inline !important; padding: 4px !important;">
							<br> <br> <input type="text" name="address"  
								id="sample6_address" placeholder="주소" class="form-control" value="${loginMember.address}"><br> <input
								type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> <br>
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
							
							
							<script type="text/javascript">
							function sample6_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												
												var addr = ''; 
												var extraAddr = ''; 

											
												if (data.userSelectedType === 'R') { 
													addr = data.roadAddress;
												} else { 
													addr = data.jibunAddress;
												}

												
												if (data.userSelectedType === 'R') {
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraAddr += data.bname;
													}
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													if (extraAddr !== '') {
														extraAddr = ' ('
																+ extraAddr
																+ ')';
													}
													document
															.getElementById("sample6_extraAddress").value = extraAddr;

												} else {
													document
															.getElementById("sample6_extraAddress").value = '';
												}

												document
														.getElementById('sample6_postcode').value = data.zonecode;
												document
														.getElementById("sample6_address").value = addr;
												document
														.getElementById(
																"sample6_detailAddress")
														.focus();
											}
										}).open();
							}
						</script>
							
									
						</div>
						<div class="form-item">
							<label class="form-label my-3">전화번호</label>
							<input type="tel" class="form-control" name="tel" value="${loginMember.tel}">
						</div>


						<div
							class="row g-4 text-center align-items-center justify-content-center pt-4">
							<input type="submit" value="회원정보 수정" class="btn border-secondary py-3 px-4 text-uppercase w-50 text-primary" >
						</div>
						
						
					</div>
				</div>
			</form>
		</div>
	</div>
	
<!-- 회원정보 끗-->


	



		


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
		function checkEmail(){
			var inputEmail = $('#inputEmail').val();
			console.log(inputEmail);
			
			$.ajax(
			{
				url : 'emailCheck',
				// 요청 데이터 형태 -> JSON
				data : {'inputEmail' : inputEmail},
				// 요청방식 
				type : 'get',
				
				success : function(data){
					if(data == 1) {
						$('#resultCheck').text('*사용가능한 이메일입니다.')
					}else {
						$('#resultCheck').text('*사용 불가능한 이메일입니다.')
					}
				},
				error : function() {
					alert("에러")
				}
			}
			
			)
			
			
		}
	</script>
	
	
	
</body>

				<script
							src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
							</script>
							<style>
							.wrong_text {
								font-size: 1rem;
								color: #f44e38;
								letter-spacing: -.2px;
								font-weight: 300;
								margin: 8px 0 2px;
								line-height: 1em;
								display: none
							}
							</style>


</html>