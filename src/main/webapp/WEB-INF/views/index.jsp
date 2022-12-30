<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.2.js"
	integrity="sha256-pkn2CUZmheSeyssYw3vMp1+xyub4m+e+QK4sQskvuo4="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/productPage.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/login.css">
<script type="text/javascript">
$(function() {
	
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
	});
	
/* 	$(".remove-modal").click(function() {
	 	
 	}); */
 	$(".modal").click(function(e) {
 		if($(e.target).parents('.container').length < 1){
 			$(".modal").fadeOut();
 		}
	});
})

</script>
</head>
<body>
	<div id="whole-wrap-div">
		<div id="menu-bar-div">
			<ul>
				<a href="allProduct.go">All</a>
			</ul>
			<ul>
				Outer
				<li class="detail">
					<a href="padding.go">패딩</a>
				</li>
				<li class="detail">
					<a href="jacket.go">자켓</a>
				</li>
				<li class="detail">
					<a href="coat.go">코트</a>
				</li>
				<li class="detail">
					<a href="fieldjJacket.go">야상</a>
				</li>
			</ul>
			<ul>
				Top
				<li class="detail">니트
				</li>
				<li class="detail">후드
				</li>
				<li class="detail">맨투맨
				</li>
				<li class="detail">셔츠
				</li>
			</ul>

			<ul>
				Bottom
				<a href="bottom.pants.go"><li class="detail">팬츠
					</li></a>
				<a href="bottom.denim.go"><li class="detail">청바지
					</li></a>
				<a href="bottom.skirt.go"><li class="detail">치마
					</li></a>
				<a href="bottom.shorts.go"><li class="detail">쇼츠
					</li></a>
			</ul>
			<ul>ETC.
				<a href="etc.accessory.go"><ul class="detail">액세서리</ul></a>
				<a href="etc.shoes.go"><ul class="detail">신발</ul></a>
				<a href="etc.bag.go"><ul class="detail">가방</ul></a>

			</ul>
		</div>
		<div id="search-bar-div">
			검색창<input id="search-bar">
			<c:choose>
				<c:when test="${loginCheck == 1 }">
					<button class="login-btn">Sign In</button>
				</c:when>
				<c:when test="${loginCheck == 0 }">
					<button class="logout-btn" onclick="location.href='logout.do'">Logout</button>
				</c:when>
			</c:choose>
			<button onclick="location.href='productReg.go'" id="login-btn">상품
				등록</button>
		</div>

	</div>
	
	<!-- 여기는 모달창 부분 -->
	<div class="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<!-- <div class="remove-modal"><h2 class="modal-h2">[쇼핑몰이름]에 오신것을 환영합니다!<button class="remove-modal">x</button></h2></div>
			 -->
			
			<div class="container" id="container">
				<div class="form-container sign-up-container">
					<!-- 여기는 회원가입 페이지에용 -->
					<form class="modal-form"action="account.reg.do" method="post">
						<h1 class="modal-h1">Create Account</h1>
						<span class="modal-span">회원 가입을 시작하겠습니다!</span> 
						<input class="modal-input" name="a_id" type="text"placeholder="UserID" /> 
						<input class="modal-input" name="a_nickname" type="text" placeholder="사용하실 닉네임" /> 
						<input class="modal-input" name="a_pw" type="password" placeholder="Password" /> 
						<input class="modal-input" name="a_addr" type="text" placeholder="주소" /> 
						<input class="modal-input" name="a_email" type="email" placeholder="이메일" /> 
						<input class="modal-input" name="a_phone" type="tel" placeholder="전화번호" />
						<button class="modal-button">Sign Up</button>
					</form>
				</div>
				<div class="form-container sign-in-container">
					<form class="modal-form" action="account.login.do" method="post">
						<h1 class="modal-h1">Sign in</h1>
						<div class="social-container">
							<!-- 여기는 카카오 간편 로그인 기능 -->
							<a class="modal-a" href="#" class="social"><i class="fab fa-facebook-f"></i></a>
							<a class="modal-a" href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
							<a class="modal-a" href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
						</div>
						<span>or use your account</span> 
						<input class="modal-input" name="a_id" type="text" placeholder="UserID" />
						<input class="modal-input" name="a_pw" type="password" placeholder="Password" />
						<!-- 비밀번호찾기 기능 -->
						<a class="modal-a" href="#">Forgot your password?</a>
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
							<p class="modal-p">[쇼핑몰 이름]의 회원이 되어보시겠나요?</p>
							<button class="ghost" id="signUp">Sign Up</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
<!-- <script type="text/javascript">
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
  container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
  container.classList.remove("right-panel-active");
});
</script> -->
</html>