<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:include page="../header.jsp"></jsp:include>
	</div>
<ul>
				<li><a href="allNewProduct.select?p_category=10">최신순</a></li>
				<li><a href="allLowProduct.select?p_category=10">낮은가격</a></li>
				<li><a href="allHighProduct.select?p_category=10">높은가격</a></li>
			</ul>
	<div class="contentWrap">
		<h1>데님</h1>
		<div class="content">
			<c:forEach items="${lists}" var="d">
				<div class="item">
					<div class="itemImgDiv">
						<img class="productImg" src="resources/imgs/${d.p_img}"
							onclick="location.href='detail.go?p_no=${d.p_no}'">

					</div>
					<div class="itemspan1">
						<span>${d.p_name}</span>
					</div>
					<div class="itemspan2">
						<fmt:formatNumber value="${d.p_price }" type="currency"
							currencySymbol="\\" />
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="pageNumWrapper">
			<ul class="pageUl">
			<c:forEach var="num" begin="${pageVO.startPage }"
				end="${pageVO.endPage }">
				<li id="pageLi" class="${pageVO.pageNum eq num ? 'active' : '' }"><a
					href="showByCategory?p_category=10&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
			</c:forEach>
			</ul>
		</div>
		
	</div>
</body>
</html>