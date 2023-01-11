<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function goPost(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'myPage.go');
    document.body.appendChild(f);
    f.submit();
}
</script>
<link rel="stylesheet" href="resources/css/header.css">
</head>
<body>

	<div id="headerContainer">
		<div id="headerWrapper">
			<div id="headerLeft">
				<a href="\fj"><span class="hTitleSpan">SDMALL</span></a>
			</div>
			<div id="headerTitle">
				<form action="product.search">
					<input type="search" class="headerSearch" name="p_name"
						placeholder="원하시는 상품을 검색하세요.">
				</form>
			</div>

			<div id="headerRight">
				<ul class="use_info">
				<c:choose>
				<c:when test="${loginAccount == null}">
						<li><a href="#"><span class="header_login"></span><strong>login</strong></a></li>
					</c:when>
					<c:when test="${loginAccount != null }">
						<li><a href="logout.do"><span class="header_logout"></span><strong>logout</strong></a></li>
						</c:when>
				</c:choose>
					<li><a href="javascript:void(0)" onClick="javascript:goPost()"><span class="header_mypage"></span><strong>my</strong></a></li>
					<li><a href="go.cart?a_id=${loginAccount.a_id }"><span class="header_bag"></span><strong>cart</strong></a></li>
				</ul>
			</div>

		</div>
		<div id="menuWrapper">
			<ul class="menu">
				<li><a href="allProduct.go">All</a> <!--  <ul class="submenu">
          <li><a href="#">submenu01</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul> --></li>
				<li><a href="#">Outer</a>
					<ul class="submenu">
						<li><a href="showByCategory?p_category=1">Padding/Jacket</a></li>
						<li><a href="showByCategory?p_category=2">Coat</a></li>
						<li><a href="showByCategory?p_category=3">FieldJacket</a></li>
					</ul></li>
				<li><a href="#">Top</a>
					<ul class="submenu">
						<li><a href="showByCategory?p_category=4">KnitWear</a></li>
						<li><a href="showByCategory?p_category=5">Shirt</a></li>
						<li><a href="showByCategory?p_category=6">Tee</a></li>
					</ul></li>
				<li><a href="#">Bottom</a>
					<ul class="submenu">
						<li><a href="showByCategory?p_category=9">Pants</a></li>
						<li><a href="showByCategory?p_category=10">Denim</a></li>
						<li><a href="showByCategory?p_category=12">Shorts</a></li>
					</ul></li>
				<li><a href="#">Etc</a>
					<ul class="submenu">
						<li><a href="showByCategory?p_category=13">Acc</a></li>
						<li><a href="showByCategory?p_category=14">Bag</a></li>
						<li><a href="showByCategory?p_category=15">Shoes</a></li>
					</ul></li>
			</ul>
		</div>

	</div>

</body>
</html>