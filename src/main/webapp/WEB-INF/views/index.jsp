<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index1.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<script type="text/javascript" src="resources/js/login.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
</script>
<script type="text/javascript">
$(function() {
	
	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');
	const span = document.getElementById('span');

	signUpButton.addEventListener('click', () => {
	  container.classList.add("right-panel-active");
	  span.style.visibility = "hidden";
	});

	signInButton.addEventListener('click', () => {
	  container.classList.remove("right-panel-active");
	});
	
	
	$(".login-btn").click(function() {
		$(".modal").fadeIn();
		$('.left_sub_menu').fadeOut();
		$('.hide_sidemenu').fadeIn();
	});
	
 	$(".modal").click(function(e) {
 		if($(e.target).parents('.container').length < 1){
 			$(".modal").fadeOut();
 			console.log(11)
 		}
	});
})
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
					<c:choose>
						<c:when test="${loginCheck == 1 }">
							<button class="login-btn">Sign In</button>
						</c:when>
						<c:when test="${loginCheck == 0 }">
							<button class="logout-btn" onclick="location.href='logout.do'">Logout</button>
						</c:when>
					</c:choose>
				</div>

			</div>
		</div>

		<div class="over"></div>
	</div>
	<!-- 여기는 모달창 부분 -->
	<div class="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<!-- <div class="remove-modal"><h2 class="modal-h2">[쇼핑몰이름]에 오신것을 환영합니다!<button class="remove-modal">x</button></h2></div>
			 -->

			<div class="container" id="container">
				<div class="form-container sign-up-container">
					<!-- 여기는 회원가입 페이지에용 -->
					<form class="modal-form" action="account.reg.do" method="post">
						<h1 class="modal-h1">Create Account</h1>
						<span class="modal-span">회원 가입을 시작하겠습니다!</span> <input
							class="modal-input" name="a_id" type="text" placeholder="UserID" />
						<input class="modal-input" name="a_nickname" type="text"
							placeholder="사용하실 닉네임" /> <input class="modal-input" name="a_pw"
							type="password" placeholder="Password" /> <input
							class="modal-input" name="a_addr" type="text" placeholder="주소" />
						<input class="modal-input" name="a_email" type="email"
							placeholder="이메일" /> <input class="modal-input" name="a_phone"
							type="tel" placeholder="전화번호" />
						<button class="modal-button">Sign Up</button>
					</form>
				</div>
				<div class="form-container sign-in-container">
					<form class="modal-form" action="account.login.do" method="post"  onsubmit="return loginCheck()"
						name="loginForm">
						<h1 class="modal-h1">Sign in</h1>
						<div class="social-container">
							<!-- 여기는 카카오 간편 로그인 기능 -->
							<a class="modal-a" href="#" class="social"><i
								class="fab fa-facebook-f"></i></a> <a class="modal-a" href="#"
								class="social"><i class="fab fa-google-plus-g"></i></a> <a
								class="modal-a" href="#" class="social"><i
								class="fab fa-linkedin-in"></i></a>
						</div>
						<span>or use your account</span> 
						<input class="modal-input" name="a_id" type="text" placeholder="UserID" />
						<input class="modal-input" name="a_pw" type="password" placeholder="Password" />
						<span id="span" style="visibility: hidden; margin-right: auto; font-size: 9pt;">입력하지 않은 항목이 있습니다</span>
						<!-- 비밀번호찾기 기능 -->
						<a class="modal-a" href="#">Forgot your password?</a>
						<button class="modal-button" >Sign In</button>
					</form>
				</div>
				<div class="overlay-container">
					<div class="overlay">
						<div class="overlay-panel overlay-left">
							<h1 class="modal-h1">Welcome!</h1>
							<p class="modal-p">이미 가입한 아이디가 있으신가요?</p>
							<button class="ghost" id="signIn">Sign In</button>
						</div>
						<div class="overlay-panel overlay-right">
							<h1 class="modal-h1">어서오세요!</h1>
							<h1 class="modal-h1">처음이신가요?</h1>
							<p class="modal-p">[쇼핑몰 이름]의 회원이 되어보시겠나요?</p>
							<button class="ghost" id="signUp">Sign Up</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>