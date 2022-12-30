<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.2.js"
	integrity="sha256-pkn2CUZmheSeyssYw3vMp1+xyub4m+e+QK4sQskvuo4="
	crossorigin="anonymous"></script>
</head>
<body>
	<h2>[쇼핑몰이름]에 오신것을 환영합니다!</h2>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<!-- 여기는 회원가입 페이지에용 -->
			<form action="account.reg.do" method="post">
				<h1>Create Account</h1>
				<span>회원 가입을 시작하겠습니다!</span> <input name="a_id" type="text"
					placeholder="UserID" /> <input name="a_nickname" type="text"
					placeholder="사용하실 닉네임" /> <input name="a_pw" type="password"
					placeholder="Password" /> <input name="a_addr" type="text"
					placeholder="주소" /> <input name="a_email" type="email"
					placeholder="이메일" /> <input name="a_phone" type="tel"
					placeholder="전화번호" />
				<button>Sign Up</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="account.login.do" method="post">
				<h1>Sign in</h1>
				<div class="social-container">
					<!-- 여기는 카카오 간편 로그인 기능 -->
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your account</span> <input name="a_id" type="text"
					placeholder="UserID" /> <input name="a_pw" type="password"
					placeholder="Password" />
				<!-- 비밀번호찾기 기능 -->
				<a href="#">Forgot your password?</a>
				<button>Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome!</h1>
					<p>이미 가입한 아이디가 있으신가요?</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>어서오세요!</h1>
					<h1>처음이신가요?</h1>
					<p>[쇼핑몰 이름]의 회원이 되어보시겠나요?</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
  container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
  container.classList.remove("right-panel-active");
});
</script>
</html>
