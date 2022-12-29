<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/productPage.css">
<link rel="stylesheet" href="resources/css/index.css">

</head>
<body>
	<div id="whole-wrap-div">
		<div id="menu-bar-div">
			<ul>
				<a href="allProduct.go">All</a>
			</ul>
			<ul>
				Outer
				<ul class="detail">
					<a href="padding.go">패딩</a>
				</ul>
				<ul class="detail">
					<a href="jacket.go">자켓</a>
				</ul>
				<ul class="detail">
					<a href="coat.go">코트</a>
				</ul>
				<ul class="detail">
					<a href="fieldjJacket.go">야상</a>
				</ul>
			</ul>
			<ul>
				Top
				<ul class="detail">니트
				</ul>
				<ul class="detail">후드
				</ul>
				<ul class="detail">맨투맨
				</ul>
				<ul class="detail">셔츠
				</ul>
			</ul>
			<ul>
				Bottom
				<a href="bottom.pants.go"><ul class="detail">팬츠
					</ul></a>
				<a href="bottom.denim.go"><ul class="detail">청바지
					</ul></a>
				<a href="bottom.skirt.go"><ul class="detail">치마
					</ul></a>
				<a href="bottom.shorts.go"><ul class="detail">쇼츠
					</ul></a>
			</ul>
			<ul>
				ETC.
				<ul class="detail">액세서리
				</ul>
				<ul class="detail">신발
				</ul>
				<ul class="detail">시계
				</ul>
			</ul>
		</div>
		<div id="search-bar-div">
			검색창<input id="search-bar">
			<c:choose>
				<c:when test="${loginCheck == 1 }">
					<button id="login-btn" onclick="location.href='loginPage.go'">Sign
						In</button>
				</c:when>
				<c:when test="${loginCheck == 0 }">
					<button id="login-btn" onclick="location.href='logout.do'">Logout</button>
				</c:when>
			</c:choose>
			<button onclick="location.href='productReg.go'" id="login-btn">상품
				등록</button>
		</div>

	</div>

</body>
</html>