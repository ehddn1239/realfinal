<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 페이지</title>
</head>
<body>

	<div class="whole-wrap-div">
		<form action="changeInfo.do" method="post">
			비밀번호 : <input name="pw" value="${loginAccount.a_pw }">
			닉네임 : <input name="nickname" value="${loginAccount.a_nickname }">
			주소 : <input name="addr" value="${loginAccount.a_addr }">
			<input name="a_id" value="${loginAccount.a_id }" type="hidden">
			<button>수정하기</button>
		</form>
	</div>


</body>
</html>