<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					</div>
					<div class="detailPrice">정상가 ${p.p_price }</div>

					<div id="orderOptionDiv">
						<div class="colorSelect">
							<span>색상&nbsp;&nbsp;&nbsp;</span> <select class="selectbox"
								name="color">
								<option value="">&nbsp;&nbsp;&nbsp;선택해 주세요</option>
								<option>화이트</option>
							</select>
						</div>
						<div class="sizeSelect">
							<span>사이즈 </span><select class="selectbox" name="size">
								<option value="">&nbsp;&nbsp;&nbsp;선택해 주세요</option>
								<c:forEach items="${sizes}" var="i">
									<option>${i }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="detailBtns">
						<button>바로 구매</button>
						<button>쇼핑백 담기</button>
						<button>찜하기</button>
					</div>
				</div>
			</div>
			<div class="productDescription">${p.p_description }</div>
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
	<button>삭제</button>
	<button onclick="location.href='product.update.go?p_no=${p.p_no}'">수정</button>
</body>







</html>