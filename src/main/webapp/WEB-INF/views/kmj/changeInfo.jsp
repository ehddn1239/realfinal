<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
</script>
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript">
/* 패스워드에 포커스 올리면 내용 보이게 */
$(function() {
	$("#pw").on("focus", function() {
		$(this).prop('type', 'text');
	});
	$("#pw").on("blur", function() {
		$(this).prop('type','password');
	});
});
</script>

</head>
<body>
	<div class="whole-wrap-div">
		<form action="changeInfo.do" method="post" onsubmit="return changeInfoCheck()">
			<div>
				<div>
					<div>ID</div>
					<div>${loginAccount.a_id }</div>
				</div>
				<div>
					<div>Password</div>
					<div><input id="pw" type="password" name="pw" value="${loginAccount.a_pw }"></div>
				</div>
				<div>
					<div>Confirm Password</div>
					<div><input id="pw2" type="password"></div>
				</div>
				<div>
					<div>Nickname</div>
					<div><input id="nick" name="nickname" value="${loginAccount.a_nickname }"></div>
				</div>
				<div>
					<div>Address</div>
					<div><input id="addr" name="addr" value="${loginAccount.a_addr }"></div>
				</div>
				<div>
					<div>Phone</div>
					<div><input type="tel" id="phone" name="phone" value="${loginAccount.a_phone }"></div>
				</div>
				<div><button>수정하기</button></div>
				<input name="a_id" value="${loginAccount.a_id }" type="hidden">
			</div>
		</form>
	</div>


</body>
</html>