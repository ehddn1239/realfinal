<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index1.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>

<script type="text/javascript">
	$(function() {
		$(".left_sub_menu").hide();
		$(".has_sub").click(function() {
			$(".left_sub_menu").fadeToggle(300);
		});
		$(".sub_menu ul.small_menu").hide();
		$(".sub_menu ul.big_menu").click(function() {
			$("ul", this).slideToggle(300);
		});
		
		$(".over").on('click', function() {
			$('.left_sub_menu').fadeOut();
			$('.hide_sidemenu').fadeIn();
		});
	});
</script>
</head>
<body>
	<div id="whole-wrap-div">
		<!-- 왼쪽 메뉴 -->
		<div class="left side-menu">
			<div class="sidebar-inner">
				<div id="sidebar-menu">
					<ul>
						<li class="has_sub"><a href="javascript:void(0);"
							class="waves-effect"> <i class="fas fa-bars"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 왼쪽 서브 메뉴 -->
		<div id="over">
			<div class="left_sub_menu">
				<div class="sub_menu">
					<input type="search" name="SEARCH" placeholder="SEARCH">
					<h2>쇼핑몰 제목</h2>
					<ul class="big_menu">
						<a href="allProduct.go"><li>ALL</li></a>
					</ul>
					<ul class="big_menu">

						<li>Outer<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<a href="padding.go"><li>Padding & Jacekt</li></a>
							<a href="coat.go"><li>Coat</li></a>
							<a href="fieldjJacket.go"><li>Field Jacket</li></a>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>Top<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<a href="knitwear.go"><li>Kniet & Cardigan</li></a>
							<a href="shirt.go"><li>Shirt & Blouse</li></a>
							<a href="tShirt.go"><li>T-shirt</li></a>
							<a href="dress.go"><li>Onepiece</li></a>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>Bottom<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<a href="bottom.pants.go"><li>팬츠</li></a>
							<a href="bottom.denim.go"><li>청바지</li></a>
							<a href="bottom.skirt.go"><li>치마</li></a>
							<a href="bottom.shorts.go"><li>쇼츠</li></a>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>ETC.<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<a href="etc.accessory.go"><li>액세서리</li></a>
							<a href="etc.shoes.go"><li>가방</li></a>
							<a href="etc.bag.go"><li>신발</li></a>
						</ul>
					</ul>
				</div>
			</div>
		</div>
		  <div class="over"></div>
		</div>
</body>
</html>