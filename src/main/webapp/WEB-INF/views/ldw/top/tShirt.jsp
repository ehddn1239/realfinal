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
<body><div class="contentWrap">
	<div class="content">
	<c:forEach items="${Tshirt }" var="t">
	<div class="item">
	<div class="itemImgDiv">
	<img class="productImg" src="resources/imgs/${t.p_img}">
	</div>
	<div class="itemspan1">
	<span>${t.p_name}</span>
	</div>
	<div class="itemspan2">
	<span>${t.p_price}</span>
	</div>
	</div>
	</c:forEach>
	</div>
</div>

</body>
</html>