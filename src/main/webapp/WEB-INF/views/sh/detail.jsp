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
<style type="text/css">
.star-rating {
	/* width: 304px; */
	width: 100px;
	height: 20px;
}

.star-rating, .star-rating span {
	display: inline-block;
	/* height: 55px; */
	height: 18px;
	overflow: hidden;
	background: url(resources/imgs/star.png) no-repeat;
	background-size: 100px;
}

.starDiv {
	
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
	background-size: 100px;
}
</style>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="resources/css/detail.css">

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>

<script type="text/javascript">

	// scroll

	$(function() {
		//수량 옵션
		$('._count :button').on({
			'click' : function(e) {
				e.preventDefault();
				var $count = $(this).parent('._count').find('.inp');
				var now = parseInt($count.val());
				var min = 1;
				var max = 999;
				var num = now;
				if ($(this).hasClass('minus')) {
					var type = 'm';
				} else {
					var type = 'p';
				}
				if (type == 'm') {
					if (now > min) {
						num = now - 1;
					}
				} else {
					if (now < max) {
						num = now + 1;
					}
				}
				if (num != now) {
					$count.val(num);
				}
			}
		});
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
		if (a_id == '') {
			alert('로그인 후 이용해주세요');
			return false;
		} else {
			location.href = 'favorite.do?p_no=' + p_no + '&a_id=' + a_id;
			alert('찜하기 등록 하셨습니다.')
			return true;
		}
	}

	function cancle(a_id, p_no) {
		if (confirm('이미 찜 해놓으신 품목 입니다. 취소 하시겠습니까?')) {
			location.href = 'favoriteCancle.do?p_no=' + p_no + '&a_id=' + a_id;
			alert('찜 목록에서 삭제하였습니다.')
			return true;
		} else {
			return false;
		}
	}
	function confirmPay(pno, aid) {
		if (confirm('결제 페이지로 이동하시겠습니까?')) {
			location.href = 'buy.go?p_no=' + pno + '&a_id=' + aid;
			return true;
		} else {
			return false;
		}
	}
	function deleteReview(p, n, a) {
		let aa = confirm('삭제하시겠습니까?');
		if (aa == 1) {
			location.href = 'review.delete.do?r_no=' + n + '&r_a_id=' + a + '&p_no=' + p;
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
							<c:choose>
								<c:when test="${loginAccount.a_rank eq 'Bronze'}">
                           정상가
                           <del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
                              <fmt:formatNumber
										value="${p.p_price * 0.95}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Silver'}">
                        정상가
                           <del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
                              <fmt:formatNumber
										value="${p.p_price * 0.90}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Gold'}">
                        정상가
                           <del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
                              <fmt:formatNumber
										value="${p.p_price * 0.85}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Platinum'}">
                        정상가
                           <del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
                              <fmt:formatNumber
										value="${p.p_price * 0.80}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:when test="${loginAccount.a_rank eq 'Diamond'}">
                        정상가
                           <del>
										<fmt:formatNumber value="${p.p_price }" type="currency"
											currencySymbol="\\" />
									</del>
									<br> 할인가
                              <fmt:formatNumber
										value="${p.p_price * 0.75}" type="currency"
										currencySymbol="\\" />
								</c:when>
								<c:otherwise>
                           가격 
                              <fmt:formatNumber value="${p.p_price}"
										type="currency" currencySymbol="\\" />
								</c:otherwise>
							</c:choose>
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
							</div>
							<div class="SelectQty _count">
								<span>수량 &nbsp;&nbsp;</span> <input type="text" name="cart_qty"
									id="qtyBox" class="inp" value="1" />
								<button type="button" class="plus">+</button>
								<button type="button" class="minus">-</button>
							</div>
							<input name="a_id" value="${loginAccount.a_id}" type="hidden">
						</div>
						<div class="detailBtns">
							<div>
								<button type="button" id="buyBtn"
									onclick="return confirmPay('${p.p_no}','${loginAccount.a_id }')">바로
									구매</button>
							</div>
							<div>
								<button id="containBagBtn" name="p_no" value="${p.p_no }">쇼핑백
									담기</button>
							</div>
							<div>
								<!-- 로그인이 안됐을때 -->
								<c:if test="${loginCheck == 1 }">

									<button type="button" id="wantBtn">
										<!-- 로그인 안됏을떄 -->
										<span
											onclick="return checkLogin('${loginAccount.a_id}','${p.p_no }')"
											class="material-symbols-outlined"> favorite </span>
									</button>
								</c:if>
								<c:choose>
									<c:when test="${checkFavorite == 1 }">
										<!-- p_no가 이미 찜햇을때 -->
										<!-- 클릭 하면 이미 했다고 취소할거냐고 물을 것  -->
										<button type="button" id="wantBtn"
											onclick="return cancle('${loginAccount.a_id}','${p.p_no }')">
											<img alt="" src="resources/imgs/filled_heart.png">
										</button>
									</c:when>
									<c:when test="${checkFavorite == 0 }">
										<!-- 찜 안햇을때 -->

										<button id="wantBtn" type="button"
											onclick="return checkLogin('${loginAccount.a_id}','${p.p_no }')">
											<span class="material-symbols-outlined"> favorite </span>
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

				<div id="reviewTitle">Review (${reviewCount })</div>
				<c:forEach items="${reviews }" var="r">
					<div class="reveiws">
						<div class="reviewDate">
							<fmt:formatDate pattern="yyyy.MM.dd" value="${r.r_date }" />
						</div>
						<div class="reviewId">${r.r_a_id }</div>
						<c:forEach items="${imgs[0]}" var="i">
							<img id="reviewMainImg" src="resources/imgs/${i}">
							<div class="reviewName">
								<span>${p.p_name }(${p.p_color })</span> <span
									style="color: #777;">(구매확정)</span>
							</div>
						</c:forEach>
						<c:choose>
							<c:when test="${r.r_grade  eq 1}">
								<div class="rating">
									<span class="star-rating"> <span style="width: 20%"></span>
									</span>
								</div>
							</c:when>
							<c:when test="${r.r_grade  eq 2}">
								<div class="rating">
									<span class="star-rating"> <span style="width: 40%"></span>
									</span>
								</div>
							</c:when>
							<c:when test="${r.r_grade  eq 3}">
								<div class="rating">
									<span class="star-rating"> <span style="width: 60%"></span>
									</span>
								</div>

							</c:when>
							<c:when test="${r.r_grade  eq 4}">
								<div class="rating">
									<span class="star-rating"> <span style="width: 80%"></span>
									</span>
								</div>
							</c:when>
							<c:when test="${r.r_grade  eq 5}">
								<div class="rating">
									<span class="star-rating"> <span style="width: 100%"></span>
									</span>
								</div>
							</c:when>
						</c:choose>
						<div class="r_txt">${r.r_txt }</div>
							
						
						<div id="myModal" class="modal">
							<span class="close">&times;</span> 
							<img class="modal-content" id="img01">
							<div id="caption"></div>
						</div>
							<img src="resources/imgs/${r.r_img}" id="reviewImg">





						<c:if test="${loginAccount.a_id eq r.r_a_id}">
						<div id="reviewDel">
							<button onclick="deleteReview('${p.p_no}','${r.r_no}','${r.r_a_id}')">삭제</button>
						</div>
						</c:if>
					</div>
				</c:forEach>


			</div>

		</div>
	</div>
	
	
	
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("reviewImg");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
  modal.style.display = "none";
}
</script>
</body>
</html>