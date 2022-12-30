<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/productPage.css">
</head>
<body>
			<button onclick="location.href='/fj'">메인</button>
	<div class="contentWrap">
		<div class="content">
			<c:forEach items="${products }" var="p">
				<div class="item">
					<div class="itemImgDiv">
						<img class="productImg" src="resources/imgs/${p.p_img}">
					</div>
					<div class="itemspan1">
						<span>${p.p_name}</span>
					</div>
					<div class="itemspan2">
						<span>${p.p_price}</span>
					</div>
				</div>
			</c:forEach>
		</div>



	</div>
</html>