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
<div class="MenuBarTop">
		<jsp:include page="../../sh/topMenu.jsp"></jsp:include>
	</div>
<div class="contentWrap">
	<div class="content">
	<c:forEach items="${products }" var="k">
	<div class="item">
	<div class="itemImgDiv">
	<img class="productImg" src="resources/imgs/${k.p_img}">
	</div>
	<div class="itemspan1">
	<span>${k.p_name}</span>
	</div>
	<div class="itemspan2">
	<span>${k.p_price}</span>
	</div>
	</div>
	<button>삭제</button>
	</c:forEach>
	</div>
</div>
</body>
</html>