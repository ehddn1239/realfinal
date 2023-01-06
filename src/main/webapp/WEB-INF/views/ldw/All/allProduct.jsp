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
<div class="header">
		<jsp:include page="../../sh/header.jsp"></jsp:include>
	</div>

	<div class="contentWrap">
		<div class="content">
			<c:forEach items="${products }" var="p">
				<div class="item">
					<div class="itemImgDiv">
						<img class="productImg" src="resources/imgs/${p.p_img}" onclick="location.href='detail.go?p_no=${p.p_no}'">
					</div>
					<div class="itemspan1">
						<span>${p.p_name}</span>
					</div>
					<div class="itemspan2">
						<fmt:formatNumber value="${p.p_price}" type="currency"
							currencySymbol="\\" />
					</div>
				
				</div>
			</c:forEach>
		</div>



	</div>
</html>