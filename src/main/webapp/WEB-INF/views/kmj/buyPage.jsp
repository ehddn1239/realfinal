<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
</script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="resources/css/detail.css">
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload= function() {
	document.getElementById("postBtn").addEventListener("click", function() {
		new daum.Postcode({
	        oncomplete: function(data) {
				document.getElementById("o_post").value = data.address;
				document.querySelector("input[name=o_addr]").focus();
	        
	        }
	    }).open();
	});
}
</script>

<script type="text/javascript">
function checkMoney(cash, price) {
	const qty = document.getElementById('qty').value;
	console.log(qty);
	if(qty <= 0){
		alert('수량을 확인 해 주십시요.');
		return false;
	}
	if(cash < price*qty){
		alert('금액이 부족합니다.');
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="../sh/header.jsp"></jsp:include>
	</div>
	<div id="scrollBar">
		<div class="scrolltop">
			<a id="back-to-top"><span>🡅</span></a>
		</div>
		<div class="scrollbottom">
			<a id="back-to-bottom"><span>🡇</span></a>
		</div>
	</div>

	<div id="detailWrapper">
		<div id="detailWrap">
			<form action="buy.do" method="post" onsubmit="return checkMoney('${loginAccount.a_cash}', ${p.p_price })">
			<!-- name으로 p_color, p_size, cart_qty, p_price, p_no 넘겨줌 -->
			<div id="orderDiv">
			이름: ${loginAccount.a_id}
				<div id="mainImg">
					<c:forEach items="${imgs[0]}" var="i">
						<img src="resources/imgs/${i}">
						<input name="p_img" value="${i }" type="hidden">			
					</c:forEach>
				</div>

				<div id="orderDetail">

					
					<div class="detailTitle">
						<span>${p.p_name }</span>
					</div>
					<div class="detailPrice">
						<h4>보유 캐시 : ${loginAccount.a_cash }원</h4>
						
						<c:choose>
								<c:when test="${loginAccount.a_rank eq 'Bronze'}">
									정상가
									<del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.95}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Silver'}">
								정상가
									<del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.90}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Gold'}">
								정상가
									<del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.85}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Platinum'}">
								정상가
									<del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.80}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Diamond'}">
								정상가
									<del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.75}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:otherwise>
									가격 
										<fmt:formatNumber value="${p.p_price}" type="currency"
										currencySymbol="\\" />
								</c:otherwise>
							</c:choose>
					</div>

					<div id="orderOptionDiv">
						<div class="colorSelect">
							<span>색상</span> 
								<input name="p_color" value="${p.p_color }" type="hidden"> 
								${p.p_color }
						</div>
						<div class="sizeSelect">

							<span>사이즈 </span><select class="selectbox" name="p_size">
								<option value="">&nbsp;&nbsp;&nbsp;선택해 주세요</option>
								<c:forEach items="${sizes}" var="i">
									<option value="${i}">${i }</option>
								</c:forEach>
							</select>

							<input name="p_no" value="${p.p_no}" type="hidden">
							<input name="a_id" value="${loginAccount.a_id}" type="hidden">
						</div>
						<div class="select-number">
							<span>수량</span><input type="number" id="qty" name="cart_qty">
							<input name="p_price" value="${p.p_price }" type="hidden">
							<br>
							<br>
							<br>
						</div>
						<div class="select-addr">
								배송주소 입력 <br>
								<input name="o_post" id="o_post" placeholder="도로명주소"> <button type="button" id="postBtn">우편번호 검색</button> <br>
								<input name="o_addr" id="o_addr" placeholder="상세 주소">

						</div>
					</div>
					<div class="detailBtns">
						<div>
							<button id="buyBtn">구매 확정</button>
						</div>
					</div>
				</div>
			</div>
				</form>



			<div id="detailImgs">
				<div class="productImg">
					<c:forEach items="${imgs }" var="i">
						<img src="resources/imgs/${i}">
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<button onclick="deleteProduct('${p.p_no}','${p.p_category}')">뒤로가기</button>
	<button onclick="location.href='product.update.go?p_no=${p.p_no}'">취소</button>

</body>
</html>