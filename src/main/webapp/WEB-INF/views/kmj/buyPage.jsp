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
<link rel="stylesheet" href="resources/css/buyPage.css">
<!-- 우편번호 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

function page_back(){

	history.go(-1)();

}
</script>
<script type="text/javascript">
$(function() {
	if($('input[name=chk_info]').val() == my){
		$('#o_post').val() = 
	}
	
	
})
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

	<div id="detailWrapper">

		<div id="detailWrap">
			<div class="order_">주문하기</div>
			<form action="buy.do" method="post"
				onsubmit="return checkMoney('${loginAccount.a_cash}', ${p.p_price })">
				<div class="Wrapper3">
					<div class="div_div2">

						<div class="div1">
							<div class="Maintxt1">배송 정보</div>
							<!-- name으로 p_color, p_size, cart_qty, p_price, p_no 넘겨줌 -->

							<div class="dd">
								<div class="title_">이름</div>${loginAccount.a_id}</div>
							<div class="dd">
								<div class="title_">연락처</div>${loginAccount.a_phone}</div>
							<div class="title_" style="font-size: 11pt;">주소</div>
							<div class="select-addr">

								<input class="addrInput" name="o_post" id="o_post"
									placeholder="도로명주소" value="${loginAccount.a_post }">
								<button type="button" id="postBtn">배송지 변경</button>
								<br> <input class="addrInput" name="o_addr" id="o_addr"
									placeholder="상세 주소" value="${loginAccount.a_addr }">
							</div>
						</div>

						<div class="div2">
							<div class="Maintxt2">상품 정보</div>

							<div id="mainImg">
								<c:forEach items="${imgs[0]}" var="i">
									<img src="resources/imgs/${i}">
									<input name="p_img" value="${i }" type="hidden">
								</c:forEach>
							</div>


							<div class="infos">
								<div class="dd">
									<div class="title_">상품 이름</div>${p.p_name }</div>
								<div class="dd">
									<div class="title_">상품 색상</div>${p.p_color }<input
										name="p_color" value="${p.p_color }" type="hidden">
								</div>
								<div class="dd">
									<div class="title_">사이즈</div>
									<input name="p_size" value="${param.p_size }"
										readonly="readonly">
								</div>
								<div class="dd">
									<div class="title_">수량</div>
									<input type="number" id="qty" name="cart_qty"
										value="${param.cart_qty}" readonly="readonly">
								</div>
							</div>

						</div>
					</div>


					<div class="div3">
						<div class="myCash">나의 보유 캐시 : ${loginAccount.a_cash }원</div>

						<div class="price_order">주문금액</div>
						<div class="price_">
							<c:choose>
								<c:when test="${loginAccount.a_rank eq 'Bronze'}">
									정상가
									<del>
										<fmt:formatNumber value="${p.p_price * param.cart_qty }"
											type="currency" currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.95 * param.cart_qty}"
										type="currency" currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Silver'}">
								정상가
									<del>
										<fmt:formatNumber value="${p.p_price * param.cart_qty}"
											type="currency" currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.90 * param.cart_qty}"
										type="currency" currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Gold'}">
								정상가
									<del>
										<fmt:formatNumber value="${p.p_price * param.cart_qty}"
											type="currency" currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.85 * param.cart_qty}"
										type="currency" currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Platinum'}">
								정상가
									<del>
										<fmt:formatNumber value="${p.p_price * param.cart_qty}"
											type="currency" currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.80 *param.cart_qty}"
										type="currency" currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Diamond'}">
								정상가
									<del>
										<fmt:formatNumber value="${p.p_price * param.cart_qty }"
											type="currency" currencySymbol="\\" />
									</del>
									<br> 할인가
										<fmt:formatNumber value="${p.p_price * 0.75 * param.cart_qty}"
										type="currency" currencySymbol="\\" />
								</c:when>
								<c:otherwise>
									가격 
										<fmt:formatNumber value="${p.p_price * param.cart_qty}"
										type="currency" currencySymbol="\\" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="detailBtns">
							<div>
								<button id="buyBtn">구매하기</button>
							</div>
							<div>
								<button type="button" onclick="page_back();" class="buyCancle">취소</button>
							</div>
						</div>
					</div>
				</div>


				<input name="p_no" value="${p.p_no}" type="hidden"> <input
					name="a_id" value="${loginAccount.a_id}" type="hidden"> <input
					name="p_price" value="${p.p_price }" type="hidden"> <input
					name="cartId" value="${param.cartId }" type="hidden">





			</form>
		</div>
	</div>


</body>
</html>