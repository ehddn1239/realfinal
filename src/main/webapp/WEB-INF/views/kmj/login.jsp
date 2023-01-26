<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<link rel="stylesheet" href="resources/css/loginPopup.css">
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
	document.getElementById("a_post").addEventListener("click", function() {
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            document.getElementById("a_post").value = data.address; //주소값
				document.querySelector("input[name=a_addr]").focus(); // 상세주소에 포커싱	            
	        }
	    }).open();	
	});
}
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
	
})
</script>
<script type="text/javascript">
$(function() {
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
	<div class="container" id="container">
				<div class="form-container sign-up-container">
					<!-- 여기는 회원가입 페이지에용 -->
					<form class="modal-form" action="account.reg.do2" method="post"
						name="joinForm" onsubmit="return joinCheck()">
						<h1 class="modal-h1">Create Account</h1>
						<span class="modal-span">회원 가입을 시작하겠습니다!</span> <input id="a_id"
							class="modal-input-id" name="a_id" type="text"
							placeholder="UserID" />
						<button type="button" class="checkId">중복검사</button>
						<input id="a_nickname" class="modal-input" name="a_nickname"
							type="text" placeholder="사용하실 닉네임" /> <input id="a_pw"
							class="modal-input" name="a_pw" type="password"
							placeholder="비밀번호 입력  5자 이상, 대문자 포함" /> <input id="a_pw2"
							class="modal-input" name="a_pw2" type="password"
							placeholder="Password Confirm" /> <span id="pw2_span"
							style="font-size: 8pt; color: red;">비밀번호가 일치하지않음</span> <input
							id="a_post" class="modal-input" name="a_post" type="text"
							placeholder="우편번호" /> <input id="a_addr" class="modal-input"
							name="a_addr" type="text" placeholder="상세주소" /> <input
							id="a_email" class="modal-input" name="a_email" type="email"
							placeholder="이메일" /> <input id="a_phone" class="modal-input"
							name="a_phone" type="tel" placeholder="전화번호" />
						<button class="modal-button">Sign Up</button>
					</form>
				</div>
				<!-- 로그인 폼 -->
				<div class="form-container sign-in-container">
					<form class="modal-form" action="account.login.do2" method="post">
						<h1 class="modal-h1">Sign in</h1>
						<!-- <div class="social-container">
							여기는 카카오 간편 로그인 기능
							<a class="modal-a" href="#" class="social"><i class="fab fa-facebook-f"></i></a> 
							<a class="modal-a" href="#" class="social"><i class="fab fa-google-plus-g"></i></a> 
							<a class="modal-a" href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
						</div> -->
						<span>or use your account</span> <input class="modal-input"
							name="a_id" type="text" placeholder="UserID" /> <input
							class="modal-input" name="a_pw" type="password"
							placeholder="Password" /> <span id="span"
							style="visibility: hidden; margin-right: auto; font-size: 9pt;">입력하지
							않은 항목이 있습니다</span>
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