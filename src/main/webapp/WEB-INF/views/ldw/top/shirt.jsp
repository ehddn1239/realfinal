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
	<c:forEach items="${lists }" var="s">
	<div class="item">
	<div class="itemImgDiv">
	<img class="productImg" src="resources/imgs/${s.p_img}" onclick="location.href='detail.go?p_no=${s.p_no}'">
	</div>
	<div class="itemspan1">
	<span>${s.p_name}</span>
	</div>
	<div class="itemspan2">
	<fmt:formatNumber value="${s.p_price }" type="currency"	currencySymbol="\\" />
	</div>
	</div>
	</c:forEach>
	</div>
	<div class="pageNumWrapper">
			<ul class="pageUl">
			<c:forEach var="num" begin="${pageVO.startPage }"
				end="${pageVO.endPage }">
				<li id="pageLi" class="${pageVO.pageNum eq num ? 'active' : '' }"><a
					href="showByCategory?p_category=5&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
			</c:forEach>
			</ul>
		</div>
	
</div>
</body>
</html>