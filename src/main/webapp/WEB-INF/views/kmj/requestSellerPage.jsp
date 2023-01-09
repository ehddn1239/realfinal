<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 신청 페이지</title>
</head>
<body>
	<table>
		<tr>
			<td colspan="2" style="text-align: center;"><h2>판매자 신청서</h2></td>
		</tr>
		<form action="sendReq.do" method="get">
		<tr>
			<td>회원 닉네임</td>
			<td><span>${loginAccount.a_nickname }</span>
				<input type="hidden" name="r_nickname" value="${loginAccount.a_nickname }">
			  </td>
		</tr>
		
		<tr>
			<td>매장 이름</td>
			<td><input id="market_name" name="r_marketname" value="${loginAccount.a_nickname }"></td>
		</tr>
		<tr>
			<td>회원 아이디 </td>
			<td><span>${loginAccount.a_id } </span>
				<input type="hidden" name="r_id" value="${loginAccount.a_id }">
				<input type="hidden" name="a_id" value="${loginAccount.a_id }">
			</td>
		</tr>
		<tr>
			<td>회원 이메일</td>
			<td><span>${loginAccount.a_email } </span>
			<input type="hidden" name="r_email" value="${loginAccount.a_email }">
			</td>
		</tr>
		<tr>
			<td>회원 등급</td>
			<td><span>${loginAccount.a_rank }</span> 
			<input type="hidden" name="r_rank" value="${loginAccount.a_rank }">
			</td>
		</tr>
		<tr>
			<td>판매자 권한 요청 사유</td>
			<td><textarea name="r_description" rows="" cols=""></textarea> </td>
		</tr>
		<tr>
			<td colspan="2"><button>신청하기</button></td>
		</tr>
		</form>
	</table>
</body>
</html>