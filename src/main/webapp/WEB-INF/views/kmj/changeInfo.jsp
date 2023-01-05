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
			<table>
				<tr>
					<td>아이디 : </td>
					<td>${loginAccount.a_id }</td>
				</tr>
				<tr>
					<td>비밀번호 : </td>
					<td><input id="pw" type="password" name="pw" value="${loginAccount.a_pw }"></td>
				</tr>
				<tr>
					<td>비밀번호 확인 : </td>
					<td><input id="pw2" type="password"></td>
				</tr>
				<tr>
					<td>닉네임 : </td>
					<td><input id="nick" name="nickname" value="${loginAccount.a_nickname }"></td>
				</tr>
				<tr>
					<td>주소 : </td>
					<td> <input id="addr" name="addr" value="${loginAccount.a_addr }"></td>
				</tr>
				<tr>
					<td>연락처 : </td>
					<td> <input type="tel" id="phone" name="phone" value="${loginAccount.a_phone }"></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="2">
					<button>수정하기</button>
					</td>
				</tr>
				<input name="a_id" value="${loginAccount.a_id }" type="hidden">
			</table>
		</form>
	</div>


</body>
</html>