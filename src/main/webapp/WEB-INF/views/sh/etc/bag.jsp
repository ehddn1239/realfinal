<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header">
		<jsp:include page="../header.jsp"></jsp:include>
	</div>
<div class="MenuBarTop">
		<jsp:include page="../topMenu.jsp"></jsp:include>
	</div>
<div class="contentWrap">
		<h1>가방</h1>
		<div class="content">
			<c:forEach items="${bag}" var="b">
				<div class="item">
					<div class="itemImgDiv">
						<img class="productImg" src="resources/imgs/${b.p_img}">
					</div>
					<div class="itemspan1">
						<span>${b.p_name}</span>
					</div>
					<div class="itemspan2">
						<span>${b.p_price}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>