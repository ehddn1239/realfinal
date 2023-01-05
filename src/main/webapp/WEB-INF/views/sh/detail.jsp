<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script type="text/javascript">
	function deleteProduct(n, c) {
		let a = confirm('삭제하시겠습니까?')
		if (a) {
			location.href = 'product.delete.do?p_no=' + n + '&p_category=' + c;
		}
	}
</script>
<link rel="stylesheet" href="resources/css/detail.css">
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="MenuBarTop">
		<jsp:include page="topMenu.jsp"></jsp:include>
	</div>

	<div id="detailWrapper">
		<div id="detailWrap">
			<div id="orderDiv">

				<div id="mainImg">
					<c:forEach items="${imgs[0]}" var="i">
						<img src="resources/imgs/${i}">
					</c:forEach>
				</div>

				<div id="orderDetail">


					<div class="detailTitle">
						<span>${p.p_name }</span>
						<div>정상가 ${p.p_price }</div>
					</div>

					<div id="orderOptionDiv">
						<div class="colorSelect">
							컬러 <select name="color">
								<option>검정</option>
								<option>화이트</option>
							</select>
						</div>
						<div class="sizeSelect">
							사이즈<select>
								<c:forEach items="${sizes}" var="s">
									<option>${s}</option>
								</c:forEach>
							</select>

						</div>
					</div>
					<div class="detailBtns">
						<div>
						<button id="buyBtn">바로 구매</button></div>
						<div><button id="containBagBtn">쇼핑백 담기</button></div>
						<div><button id="wantBtn">
							<span class="material-symbols-outlined"> favorite </span>
						</button></div>
					</div>
				</div>
			</div>
			<div class="productDescription">${p.p_description}</div>
			<div id="detailImgs">
				<div class="productImg">
					<c:forEach items="${imgs }" var="i">
						<img src="resources/imgs/${i}">
					</c:forEach>
				</div>

			</div>
			<div id="reviewDiv">
				<div>리뷰목록1</div>

			</div>
			<div id="qnaDiv">
				<div>큐앤에이목록1</div>
				<div>큐앤에이목록2</div>
				<div>큐앤에이목록3</div>
			</div>
		</div>
	</div>
	<button onclick="deleteProduct('${p.p_no}','${p.p_category}')">삭제</button>
</body>







</html>