<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteProduct(n,c) {
		let a = confirm('삭제하시겠습니까?')
		if (a) {
		location.href='product.delete.do?p_no=' +n +'&p_category=' + c; 
		}
	}
</script>

</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="MenuBarTop">
		<jsp:include page="topMenu.jsp"></jsp:include>
	</div>

	<div id="detailWrapper">
		<div id="detailImgs">
		<c:forEach items="${imgs }" var="i">
			<img src="resources/imgs/${i}">
		</c:forEach>
		
		</div>
		<div id="details">
			<span>${p.p_name }</span> <span>${p.p_price }</span> <span>${p.p_color }</span>
			<c:forEach items="${sizes }" var="i">		
			<li>${i}</li>
		</c:forEach>
				
		</div>
		<button>수정</button>
		<button onclick="deleteProduct('${p.p_no}', '${p.p_category}')">삭제</button>
	</div> 
</body>







</html>