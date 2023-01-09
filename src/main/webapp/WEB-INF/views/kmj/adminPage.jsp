<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[관리자용 페이지]</title>
<script type="text/javascript">
function accept(id, nick, market) {
	if(confirm('판매자로 변경 하시겠습니까?')){
		location.href='accept.do?r_id='+id + "&r_nickname="+nick + "&r_marketname="+market;
		return true;
	}
	return false;
}
</script>
</head>
<body>
<h2>가입된 회원 조회</h2>
 <table border="1" style="width: 1000px; height: 100%; text-align: center;">
	<tr>
		<td>회원 닉네임</td>
		<td>회원 아이디</td>
		<td>회원 이메일</td>
		<td>회원 등급</td>
		<td>구매자/판매자</td>
		<td>판매자 신청 이력</td>  <!-- 0은 신청안함 1은 신청중 2는 신청완료 -->
	</tr>
 	<c:forEach items="${showAllClients }" var="a">
		<tr>
			<td>${a.a_nickname }</td>	
			<td>${a.a_id }</td>
			<td>${a.a_email }</td>
			<td>${a.a_rank }</td>
			<c:if test="${a.a_userType == 1 }">
			<td>구매자</td>
			</c:if>
			<c:if test="${a.a_userType == 2 }">
			<td>판매자</td>
			</c:if>
			<c:if test="${a.a_reqStatus == 0 }">
			<td>미신청</td>
			</c:if>
			<c:if test="${a.a_reqStatus == 1 }">
			<td>신청중</td>
			</c:if>
			<c:if test="${a.a_reqStatus == 2 }">
			<td>신청 수락 완료</td>
			</c:if>
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
 			<td>${r.r_id }</td>
 			<td>${r.r_marketname }</td>
 			<td>${r.r_email }</td>
 			<td>${r.r_rank }</td>
 			<td>${r.r_description }</td>
 			<td><fmt:formatDate value="${r.r_date }" pattern="yyyy-MM-dd HH:ss"/></td>
 			<td><button onclick="return accept('${r.r_id}', '${r.r_nickname }' , '${r.r_marketname }')">요청 수락</button> </td>
 	</tr>	
 		
 </c:forEach>
 </table>
 
 
</body>
</html>