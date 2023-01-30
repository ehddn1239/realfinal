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
<script type="text/javascript" src="resources/js/deleteProduct.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
$(function () {
	
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

	});

</script>
</head>
<body>
<div class="header">
		<jsp:include page="../../sh/header.jsp"></jsp:include>
	</div>
	<div class="scrollMenu">
				<div class="scrollMyPage">
					<a href="myPage.go?a_id=${loginAccount.a_id }"><span
						class="header_mypage"></span></a>
				</div>
				<div class="scrollMyCart">
					<a href="go.cart?a_id=${loginAccount.a_id }"><span
						class="header_bag"></span></a>
				</div>
				<div class="scrolltop">
					<a id="back-to-top"><span>🡅</span></a>
				</div>
				<div class="scrollbottom">
					<a id="back-to-bottom"><span>🡇</span></a>
				</div>
			</div>
<div class="lookup">

			<ul class="lookupList">
			
			<li class="newProduct"><a href="allNewProduct.select?p_category=0">신상품순</a></li>
				<li class="lowPrice"><a href="allLowProduct.select?p_category=0">낮은가격</a></li>
				<li class="highPrice"><a href="allHighProduct.select?p_category=0">높은가격</a></li>
			</ul>

		</div>
<div class="contentWrap">
<div class="cate_"><span>Shirt</span></div>
	<div class="content">
	<c:forEach items="${products }" var="s">
	<div class="item">
	<div class="itemImgDiv">
	<img class="productImg" src="resources/imgs/${s.p_img}" onclick="location.href='detail.go?p_no=${s.p_no}'">
	</div>
	<div class="itemspan1">
	<span>${s.p_name}</span>
	</div>
	<div class="itemspan2">
	<fmt:formatNumber value="${s.p_price }" type="currency"	currencySymbol="\\" />
	</div>
	<div class="sellerbtn">
						<c:if test="${loginAccount.a_userType == 2}">
							<button onclick="deleteProduct('${s.p_no}','${s.p_category}')">삭제 /</button>
							<button
								onclick="location.href='product.update.go?p_no=${s.p_no}'">수정</button>
						</c:if>
					</div>
	</div>
	</c:forEach>
	</div>
	<div class="pageNumWrapper">
			<ul class="pageUl">
			<c:forEach var="num" begin="${pageVO.startPage }"
				end="${pageVO.endPage }">
				<c:choose>
				<c:when test="${pageVO.sort eq 'allHighProdu'}">
				<li id="pageLi" class="${pageVO.pageNum eq num ? 'active' : '' }">
				<a href="allHighProduct.select?p_category=5&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
				 </c:when>
				 <c:when test="${pageVO.sort eq 'allNewProduc'}">
				<li id="pageLi" class="${pageVO.pageNum eq num ? 'active' : '' }">
				<a href="allNewProduct.select?p_category=5&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
				 </c:when>
				 <c:when test="${pageVO.sort eq 'allLowProduc'}">
				<li id="pageLi" class="${pageVO.pageNum eq num ? 'active' : '' }">
				<a href="allLowProduct.select?p_category=5&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
				 </c:when>
				 <c:otherwise>
				<li id="pageLi" class="${pageVO.pageNum eq num ? 'active' : '' }"><a
					href="showByCategory?p_category=5&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
				 </c:otherwise>
				</c:choose>
			</c:forEach>
			</ul>
		</div>
		
</div>
</body>
</html>