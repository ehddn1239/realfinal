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

<script type="text/javascript">
	function deleteProduct(n, c) {
		let a = confirm('삭제하시겠습니까?')
		if (a == 1) {
			location.href = 'product.delete.do?p_no=' + n + '&p_category=' + c;
		} 
	}
	// scroll

	$(function() {
		$('#back-to-top').on('click', function(e) {
			e.preventDefault();
			$('html,body').animate({
				scrollTop : 0
			}, 300);
		});

		$(window).scroll(function() {
			if ($(document).scrollTop() > 100) {
				$('#back-to-top').addClass('show');
			} else {
				$('#back-to-top').removeClass('show');
			}
		});

		$('#back-to-bottom').click(function(e) {
			e.preventDefault();
			$('html,body').animate({
				scrollTop : $(document).height()
			}, 300);
		});

		$(window).scroll(function() {
			if ($(document).scrollTop() > 100) {
				$('#back-to-bottom').removeClass('show');
			} else {
				$('#back-to-bottom').addClass('show');
			}
		});

		$("#containBagBtn").click(function() {
			var check = confirm("상품이 장바구니에 담겼습니다. 확인하시겠습니까?");
			if (check) {
				location.href = '/cart.go?'
							
			}
		});
		
	});

</script>

<script type="text/javascript">
function checkLogin(a_id, p_no) {
	if(a_id == ''){
		alert('로그인 후 이용해주세요');
		return false;
	}else{
		location.href='favorite.do?p_no='+p_no + '&a_id=' + a_id;
		alert('찜하기 등록 하셨습니다.')
		return true;
	}
}

function cancle(a_id, p_no){
	if(confirm('이미 찜 해놓으신 품목 입니다. 취소 하시겠습니까?')){
		location.href='favoriteCancle.do?p_no='+p_no + '&a_id='+a_id; 
		alert('찜 목록에서 삭제하였습니다.')
		return true;
	}else{
		return false;
	}
}
function confirmPay(pno, aid){
	if(confirm('결제 페이지로 이동하시겠습니까?')){
		location.href='buy.go?p_no='+pno+'&a_id='+aid;
		return true;
	}else{
		return false;
	}
}
</script>

</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
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
			<form action="add.cart">
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
					<div class="productDescription">${p.p_description}</div>
					<div class="detailPrice">
						정상가
						<fmt:formatNumber value="${p.p_price }" type="currency"
							currencySymbol="\\" />
					</div>

					<div id="orderOptionDiv">
						<div class="colorSelect">
							<span>색상&nbsp;&nbsp;&nbsp;</span> <select class="selectbox"
								name="p_color">
								<option value="">&nbsp;&nbsp;&nbsp;선택해 주세요</option>
								<option value="${p.p_color }">${p.p_color }</option>
							</select>
						</div>
						<div class="sizeSelect">

							<span>사이즈 </span><select class="selectbox" name="p_size">
								<option value="">&nbsp;&nbsp;&nbsp;선택해 주세요</option>
								<c:forEach items="${sizes}" var="i">
									<option value="${i}">${i }</option>
								</c:forEach>
							</select>

							<input name="a_id" value="${loginAccount.a_id}" type="hidden">
						</div>
					
					</div>
					<div class="detailBtns">
						<div>
						<button type="button" id="buyBtn" onclick="return confirmPay('${p.p_no}','${loginAccount.a_id }')">바로 구매</button>
						</div>
						<div><button id="containBagBtn" name="p_no" value="${p.p_no }">쇼핑백 담기</button></div>
						<div>
						<!-- 로그인이 안됐을때 -->
						<c:if test="${loginCheck == 1 }">
							<button id="wantBtn">
							<!-- 로그인 안됏을떄 -->
									<span onclick="return checkLogin('${loginAccount.a_id}','${p.p_no }')" class="material-symbols-outlined"> favorite </span>
							</button>
						</c:if>
						<c:choose>
							<c:when test="${checkFavorite == 1 }">
								<!-- p_no가 이미 찜햇을때 -->
								<!-- 클릭 하면 이미 했다고 취소할거냐고 물을 것  -->
								<button id="wantBtn" onclick="return cancle('${loginAccount.a_id}','${p.p_no }')">
									<img alt="" src="resources/imgs/filled_heart.png">
								</button>
							</c:when>
							<c:when test="${checkFavorite == 0 }">
								<!-- 찜 안햇을때 -->
								<button id="wantBtn" onclick="return checkLogin('${loginAccount.a_id}','${p.p_no }')">
									<span  class="material-symbols-outlined"> favorite </span>
								</button>
							</c:when>
						</c:choose>
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
			<div id="reviewDiv">
				<div>구매후기</div>
				<c:forEach items="${reviews }" var="r">
						<img src="resources/imgs/${r.r_img}">
						평점${r.r_grade }
						회원 아이디 ${r.r_a_id } 
						등록 날짜 ${r.r_date }
						후기 내용 ${r.r_txt }
					</c:forEach> 
					

			</div>
		</div>
	</div>
	<button onclick="deleteProduct('${p.p_no}','${p.p_category}')">삭제</button>
	<button onclick="location.href='product.update.go?p_no=${p.p_no}'">수정</button>

</body>







</html>