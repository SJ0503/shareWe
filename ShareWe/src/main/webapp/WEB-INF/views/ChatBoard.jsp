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
	<!-- 게시글 상세 -->

	<div class="row g-4 justify-content-center hero-header"
		style="margin-left: 5%; margin-right: 5%;">
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>


		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel" style="width: 40%; position: relative"
			align="left">
			<div class="carousel-inner" style="position: absoulte;">
				<div class="carousel-item active">
					<img class="d-block w-100"
						style="object-fit: cover !important; height: 450px;"
						src="resources/g_Image/${g_board.g_img1}" alt="..." />
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						style="object-fit: cover !important; height: 450px;"
						src="resources/g_Image/${g_board.g_img2}" alt="..." />
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						style="object-fit: cover !important; height: 450px;"
						src="resources/g_Image/${g_board.g_img3}" alt="..." />
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>

		</div>


		<div class="boardContent">참여인원 : ${g_board.g_p_count}</div>
		<div class="boardContent">
			<span><h6 style="display: inline;">작성자 :
					${g_board.g_writer}</h6></span> <span style="float: right;">카테고리 :
				${g_board.category} / ${g_board.g_w_date}</span>
		</div>
		<div class="boardContent">
			<h5>${g_board.g_title}</h5>
			<h6>종료 날짜 : ${g_board.g_b_date}</h6>
			<br>
			<div>${g_board.g_content}</div>
		</div>
	</div>


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
		function checkGFavorite() {
			var g_num = document.getElementById("gNum").value;

			document.getElementById("favCancel").style.display = "inline";
			document.getElementById("gFavorite").style.display = "none";
			$.ajax({
				url : "insertgFavorite",
				data : {
					'g_num' : g_num
				},
				type : 'get',
				success : function() {

				},
				error : function() {
					alert("통신실패")
				}
			})
		}
	</script>

	<script type="text/javascript">
		function delGFavorite() {
			var g_num = document.getElementById("gNum").value;

			document.getElementById("gFavorite").style.display = "inline";
			document.getElementById("favCancel").style.display = "none";
			$.ajax({
				url : "delgFavorite",
				data : {
					'g_num' : g_num
				},
				type : 'get',
				success : function() {

				},
				error : function() {
					alert("통신실패")
				}
			})
		}
	</script>



</body>

</html>