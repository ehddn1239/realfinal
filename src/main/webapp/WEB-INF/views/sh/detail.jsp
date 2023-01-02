<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<img src="resources/imgs/${p.p_img }">
		</div>
		<div id="details">
			<span>${p.p_name }</span> <span>${p.p_price }</span> <span>${p.p_color }</span>
			<span>${p.p_size }</span>

		</div>
	</div>
</body>







</html>