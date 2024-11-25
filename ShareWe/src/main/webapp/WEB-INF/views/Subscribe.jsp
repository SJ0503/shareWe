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
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">유료결제</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item active text-white">POP 구매</li>
		</ol>
	</div>
	<!-- Single Page Header End -->




	<div>
		<img src="resources/asset/image/subscribe_top.png"
			style="margin-top: 50px; margin-left: 600px;"width: 900px; height:100%;>
	</div>

	<div class="upImage"
		style="margin-top: 30px; margin-left: 350px; margin-bottom: 50px;">
		<button type="button" onclick="pay(0)"
			style="border-color: transparent; background-color: transparent;">
			<input type="hidden" class="upName" value="POP - 5회권"> <input
				type="hidden" class="upPrice" value="3000"> <input
				type="hidden" class="upCnt" value="5"> <img
				src="resources/asset/image/up5.png"
				style="width: 300px !important; height: 500px !important;">
		</button>

		<button type="button" onclick="pay(1)"
			style="border-color: transparent; background-color: transparent;">
			<input type="hidden" class="upName" value="POP - 10회권"> <input
				type="hidden" class="upPrice" value="5000"> <input
				type="hidden" class="upCnt" value="10"> <img
				src="resources/asset/image/up10.png"
				style="width: 300px !important; height: 500px !important;">
		</button>

		<button type="button" onclick="pay(2)"
			style="border-color: transparent; background-color: transparent;">
			<input type="hidden" class="upName" value="POP - 25회권"> <input
				type="hidden" class="upPrice" value="10000"> <input
				type="hidden" class="upCnt" value="25"> <img
				src="resources/asset/image/up25.png"
				style="width: 300px !important; height: 500px !important;">
		</button>

		<button type="button" onclick="pay(3)"
			style="border-color: transparent; background-color: transparent;">
			<input type="hidden" class="upName" value="POP - 60회권"> <input
				type="hidden" class="upPrice" value="20000"> <input
				type="hidden" class="upCnt" value="60"> <img
				src="resources/asset/image/up60.png"
				style="width: 320px !important; height: 500px !important;">
		</button>
	</div>



	<input type="hidden" value="${loginMember.email}" id="payEmail">
	<input type="hidden" value="${loginMember.name}" id="payName">
	<input type="hidden" value="${loginMember.tel}" id="payTel">
	<input type="hidden" value="${loginMember.address}" id="payAddress">

	<!-- </div> -->

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		function pay(num) {

			var inputUp = document.getElementsByClassName("upName")[num].value;
			var inputPrice = document.getElementsByClassName("upPrice")[num].value;
			var inputCnt = document.getElementsByClassName("upCnt")[num].value;

			/*var selectedGoodsName = document.querySelector(".kg_pay_btn").getAttribute("data-name");*/

			var inputEmail = document.getElementById("payEmail").value;
			var inputName = document.getElementById("payName").value;
			var inputTel = document.getElementById("payTel").value;
			var inputAddress = document.getElementById("payAddress").value;

			var IMP = window.IMP;
			IMP.init("imp14502251");
			// 원포트 관리자 페이지 -> 내정보 -> 가맹점식별코드
			// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
			IMP
					.request_pay(
							{
								pg : 'html5_inicis', // 실제 계약 후에는 실제 상점아이디로 변경
								pay_method : 'card', // 'card'만 지원됩니다.
								merchant_uid : 'ShareWe_'
										+ new Date().getTime(), // 상점에서 관리하는 주문 번호
								name : inputUp, // 상품 이름
								amount : inputPrice, // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다.
								buyer_email : inputEmail,
								buyer_name : inputName,
								buyer_tel : inputTel,
								buyer_addr : inputAddress,
								buyer_postcode : '123-456',
								m_redirect_url : 'https://www.myservice.com/payments/complete/mobile',
								p_cnt : inputCnt

							}, function(rsp) {
								if (rsp.success) { // 결제가 성공했을 때
									// 결제가 완료되었을 떄 결제 정보를 뜨게 만듬
									var msg = '결제가 완료되었습니다.';
									msg += '고유ID : ' + rsp.imp_uid;
									msg += '상점 거래ID : ' + rsp.merchant_uid;
									msg += '결제 금액 : ' + rsp.paid_amount;
									msg += '카드 승인번호 : ' + rsp.apply_num;

									let f = document.createElement('form');
									/* let obj1;
									    obj1 = document.createElement('input');
									    obj1.setAttribute('type', 'hidden');
									    obj1.setAttribute('name', 'p_num');
									    obj1.setAttribute('value', p_num); */

									let obj2;
									obj2 = document.createElement('input');
									obj2.setAttribute('type', 'hidden');
									obj2.setAttribute('name', 'email');
									var inputEmail = document
											.getElementById("payEmail").value;
									obj2.setAttribute('value', inputEmail);

									let obj3;
									obj3 = document.createElement('input');
									obj3.setAttribute('type', 'hidden');
									obj3.setAttribute('name', 'p_name');
									obj3.setAttribute('value', inputUp);

									let obj4;
									obj4 = document.createElement('input');
									obj4.setAttribute('type', 'hidden');
									obj4.setAttribute('name', 'p_amount');

									obj4.setAttribute('value', inputPrice);

									let obj5;
									obj5 = document.createElement('input');
									obj5.setAttribute('type', 'hidden');
									obj5.setAttribute('name', 'apply_num');
									obj5.setAttribute('value', rsp.apply_num);

									let obj6;
									obj6 = document.createElement('input');
									obj6.setAttribute('type', 'hidden');
									obj6.setAttribute('name', 'p_cnt');

									obj6.setAttribute('value', inputCnt);

									f.appendChild(obj2);
									f.appendChild(obj3);
									f.appendChild(obj4);
									f.appendChild(obj5);
									f.appendChild(obj6);
									f.setAttribute('method', 'post');
									f.setAttribute('action', 'paySuccess');
									document.body.appendChild(f);
									f.submit();

								} else { // 결제가 실패했을 때
									// 결제에 실패했을떄 실패메세지와 실패사유를 출력
									var msg = '결제에 실패하였습니다.';
									msg += '실패 사유 : ' + rsp.error_msg;
								}
								alert(msg);
							});
		}
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