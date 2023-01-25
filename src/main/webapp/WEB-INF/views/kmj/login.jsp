<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
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
						<input id="a_post" class="modal-input" name="a_post" type="text"placeholder="우편번호" /> 
						<input id="a_addr" class="modal-input" name="a_addr" type="text"placeholder="상세주소" /> 
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
</body>
</html>