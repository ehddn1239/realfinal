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
<div class="header">
		<jsp:include page="../../sh/header.jsp"></jsp:include>
	</div>
<div class="MenuBarTop">
		<jsp:include page="../../sh/topMenu.jsp"></jsp:include>
	</div>
<body><div class="contentWrap">
	<div class="content">
	<c:forEach items="${products }" var="t">
	<div class="item">
	<div class="itemImgDiv">
	<img class="productImg" src="resources/imgs/${t.p_img}" onclick="location.href='detail.go?p_no=${t.p_no}'">
	</div>
	<div class="itemspan1">
	<span>${t.p_name}</span>
	</div>
	<div class="itemspan2">
	<fmt:formatNumber value="${t.p_price }" type="currency"
							currencySymbol="\\" />
	</div>
	<fmt:formatDate var="resultRegDt" value="${p.p_date}" pattern="yyyy-MM-dd"/>
	<span>${resultRegDt}</span>
	</div>
	</c:forEach>
	</div>
</div>

</body>
</html>