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
<ul>
				<li><a href="allNewProduct.select?p_category=6">최신순</a></li>
				<li><a href="allLowProduct.select?p_category=6">낮은가격</a></li>
				<li><a href="allHighProduct.select?p_category=6">높은가격</a></li>
			</ul>
<div class="contentWrap">
	<div class="content">
	<c:forEach items="${products }" var="t">
	<div class="item">
	<div class="itemImgDiv">
	<img class="productImg" src="resources/imgs/${t.p_img}" onclick="location.href='detail.go?p_no=${t.p_no}'">
	</div>
	<div class="itemspan1">
	<span>${t.p_name}</span>
	</div>
	<div class="itemspan2">
	<fmt:formatNumber value="${t.p_price }" type="currency"
							currencySymbol="\\" />
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
				<a href="allHighProduct.select?p_category=6&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
				 </c:when>
				 <c:when test="${pageVO.sort eq 'allNewProduc'}">
				<li id="pageLi" class="${pageVO.pageNum eq num ? 'active' : '' }">
				<a href="allNewProduct.select?p_category=6&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
				 </c:when>
				 <c:when test="${pageVO.sort eq 'allLowProduc'}">
				<li id="pageLi" class="${pageVO.pageNum eq num ? 'active' : '' }">
				<a href="allLowProduct.select?p_category=6&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
				 </c:when>
				 <c:otherwise>
				<li id="pageLi" class="${pageVO.pageNum eq num ? 'active' : '' }"><a
					href="showByCategory?p_category=6&pageNum=${num }&amount=${pageVO.amount }">${num }</a>
				</li>
				 </c:otherwise>
				</c:choose>
			</c:forEach>
			</ul>
		</div>
		
</div>

</body>
</html>