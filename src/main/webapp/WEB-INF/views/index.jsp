<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index1.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/css/productPage.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
</script>

<script type="text/javascript">
$(function() {
	/* 로그인화면 패널 움직이는 효과 처리 */
	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');
	signUpButton.addEventListener('click', () => {
	  container.classList.add("right-panel-active");
	});
	signInButton.addEventListener('click', () => {
	  container.classList.remove("right-panel-active");
	});
	
	
	$(".login-btn").click(function() {
		$(".modal").fadeIn();
		$('.left_sub_menu').fadeOut();
		$('.hide_sidemenu').fadeIn();
	});
	
/* 	$(".remove-modal").click(function() {
	 	
 	}); */
 	$(".modal").click(function(e) {
 		if($(e.target).parents('.container').length < 1){
 			$(".modal").fadeOut();
 			
 		}
	});
	
	/* 사이드 메뉴 처리 */
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
$(function() {
	
	$("#regBtn").on('click', function() {
		if (${loginCheck == 1}) {
			alert('판매자로 로그인 하세요');
		}
	});
	
	// 비밀번호 확인 비동기처리~
	$("#a_pw2").keyup(function() {
		if($("#a_pw2").val() == $("#a_pw").val()){
			$("#pw2_span").text('비밀번호가 일치함').css("color", "green").css("font-weight","bold");
		}else{
			$("#pw2_span").text("비밀번호가 일치하지않음").css("color","red").css("font-weight","bold");
		}
	});
	
	/* 아이디 중복체크 */

		$(".checkId").click(function() {
			let a_id = $("#a_id").val();
			$.ajax({
				url:'checkId.go',
				data: {
					"a_id" : a_id
				},
				success: function(data) {
					console.log(data);
					if(data == "N"){
						alert('사용할 수 있는 아이디');
					}else{
						alert('불가능한 아이디입니다');
					}
				}
				
			});
	
	});
	
});
</script>
</head>
<body>
	<iframe id="vimeo_player_82"
		src="https://player.vimeo.com/video/733500685?autoplay=1&amp;loop=1&amp;title=0&amp;byline=0&amp;portrait=0&amp;muted=1&amp;background=1"
		frameborder="0" webkitallowfullscreen="" mozallowfullscreen=""
		allowfullscreen="1" allow="autoplay; fullscreen" data-ready="true" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:100%;width:100%;position:absolute;top:0px;left:0px;right:0px;bottom:0px"
		></iframe>
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
					<form action="product.search">
					<input type="search" name="p_name" placeholder="SEARCH">
					</form>
					<h2>SDMALL</h2>
					<ul class="big_menu">
						<a href="allProduct.go"><li>ALL</li></a>
					</ul>
					<ul class="big_menu">

						<li>Outer<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<li onclick="location.href='showByCategory?p_category=1'">Padding
								& Jacekt</li>
							<li onclick="location.href='showByCategory?p_category=2'">Coat</li>
							<li onclick="location.href='showByCategory?p_category=3'">Field
								Jacket</li>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>Top<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<li onclick="location.href='showByCategory?p_category=4'">Kniet
								& Cardigan</li>
							<li onclick="location.href='showByCategory?p_category=5'">Shirt</li>
							<li onclick="location.href='showByCategory?p_category=6'">Tee</li>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>Bottom<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<li onclick="location.href='showByCategory?p_category=9'">팬츠</li>
							<li onclick="location.href='showByCategory?p_category=10'">청바지</li>
							<li onclick="location.href='showByCategory?p_category=12'">반바지</li>
						</ul>
					</ul>
					<ul class="big_menu">
						<li>ETC.<i class="arrow fas fa-angle-right"></i></li>
						<ul class="small_menu">
							<li onclick="location.href='showByCategory?p_category=13'">액세서리</li>
							<li onclick="location.href='showByCategory?p_category=14'">가방</li>
							<li onclick="location.href='showByCategory?p_category=15'">신발</li>
						</ul>
					</ul>

						<c:choose>
				<c:when test="${loginCheck == 1 }">
					<button class="login-btn">Login</button>
					
				</c:when>	
				<c:when test="${loginCheck == 0 }">
					<form action="myPage.go" method="get">
					<button type="button" class="logout-btn" onclick="location.href='logout.do'">Logout</button>
					<input type="hidden" value="${loginAccount.a_id }">
					
					<c:if test="${loginAccount.a_userType == 3 }">
						<button type="button" onclick="location.href ='adminPage.go'" class="myPage-btn">고객 관리</button>
					</c:if>
						<button name="a_id" value="${loginAccount.a_id }" class="myPage-btn">${loginAccount.a_nickname }님의 정보</button>
					</form>

					<c:if test="${loginAccount.a_userType == 2 }">
						<button id="regBtn" onclick="location.href='productReg.go'">상품 등록</button>
					</c:if>	

				</c:when>
			</c:choose>
			

				</div>

			</div>
		</div>

		<div class="over"></div>
	</div>
	<!-- 여기는 모달창 부분 -->
	<div class="modal">
		<div class="modal_content">
			<!-- <div class="remove-modal"><h2 class="modal-h2">[쇼핑몰이름]에 오신것을 환영합니다!<button class="remove-modal">x</button></h2></div>
			 -->

			<div class="container" id="container">
				<div class="form-container sign-up-container">
					<!-- 여기는 회원가입 페이지에용 -->
					<form class="modal-form" action="account.reg.do" method="post"
						name="joinForm" onsubmit="return joinCheck()">
						<h1 class="modal-h1">Create Account</h1>
						<span class="modal-span">회원 가입을 시작하겠습니다!</span> 
						<input id="a_id" class="modal-input-id" name="a_id" type="text" placeholder="UserID" />
						<button type="button" class="checkId">중복검사</button>
						<input id="a_nickname" class="modal-input" name="a_nickname"type="text" placeholder="사용하실 닉네임" />
						<input id="a_pw" class="modal-input" name="a_pw" type="password" placeholder="5자 이상, 대문자 포함" /> 
						<input id="a_pw2" class="modal-input" name="a_pw2" type="password" placeholder="Password Confirm" /> 
						<span id="pw2_span" style="font-size: 8pt; color: red;">비밀번호가 일치하지않음</span> 
						<input id="a_addr" class="modal-input" name="a_addr" type="text"placeholder="주소" /> 
						<input id="a_email" class="modal-input" name="a_email" type="email" placeholder="이메일" /> 
						<input id="a_phone" class="modal-input" name="a_phone" type="tel" placeholder="전화번호" />
						<button class="modal-button">Sign Up</button>
					</form>
				</div>
				<!-- 로그인 폼 -->
				<div class="form-container sign-in-container">
					<form class="modal-form" action="account.login.do" method="post">
						<h1 class="modal-h1">Sign in</h1>
						<!-- <div class="social-container">
							여기는 카카오 간편 로그인 기능
							<a class="modal-a" href="#" class="social"><i class="fab fa-facebook-f"></i></a> 
							<a class="modal-a" href="#" class="social"><i class="fab fa-google-plus-g"></i></a> 
							<a class="modal-a" href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
						</div> -->
						<span>or use your account</span> 
						<input class="modal-input" name="a_id" type="text" placeholder="UserID" /> 
						<input class="modal-input" name="a_pw" type="password" placeholder="Password" /> 
						<span id="span" style="visibility: hidden; margin-right: auto; font-size: 9pt;">입력하지 않은 항목이 있습니다</span>
						<!-- 비밀번호찾기 기능 -->
						<a class="modal-a" href="findpw.go">Forgot your password?</a>
						<button class="modal-button">Sign In</button>

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
							<p class="modal-p">[SDMALL]의 회원이 되어보시겠나요?</p>
							<button class="ghost" id="signUp">Sign Up</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>