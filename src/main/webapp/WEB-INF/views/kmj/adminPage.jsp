<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[관리자용 페이지]</title>
</head>
<body>
<h2>가입된 회원 조회</h2>
 <table border="1" style="width: 1000px; height: 100%; text-align: center;">
	<tr>
		<td>회원 닉네임</td>
		<td>회원 아이디</td>
		<td>회원 이메일</td>
		<td>회원 등급</td>
	</tr>
 	<c:forEach items="${showAllClients }" var="a">
		<tr>
			<td>${a.a_nickname }</td>		
			<td>${a.a_id }</td>		
			<td>${a.a_email }</td>		
			<td>${a.a_rank }</td>		
		</tr> 	
 	</c:forEach>
 </table>
 <h2>요청서 들어온 내용</h2>
 <table border="1" style="width: 1000px; height: 100%; text-align: center;">
 	<tr>
 			<td>신청하신 아이디</td>
 			<td>신청하신 매장 이름</td>
 			<td>이메일</td>
 			<td>회원 등급</td>
 			<td>신청 사유</td>
 			<td>신청 날짜</td>
 	</tr>		
 <c:forEach items="${requests }" var="r">
	 	<tr>
 			<td>${r.r_nickname }</td>
 			<td>${r.r_marketname }</td>
 			<td>${r.r_email }</td>
 			<td>${r.r_rank }</td>
 			<td>${r.r_description }</td>
 			<td><fmt:formatDate value="${r.r_date }" pattern="yyyy-MM-dd HH:ss"/></td>
 			
 			<td><button>요청 수락</button> </td>
 	</tr>	
 		
 </c:forEach>
 </table>
 
 
</body>
</html>