<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myPage.css">
<script src="https://code.jquery.com/jquery-3.6.2.js"
	integrity="sha256-pkn2CUZmheSeyssYw3vMp1+xyub4m+e+QK4sQskvuo4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	const indicator = document.querySelector('.nav-indicator');
	const items = document.querySelectorAll('.nav-item');

	function handleIndicator(el) {
	  items.forEach(item => {
	    item.classList.remove('is-active');
	    item.removeAttribute('style');
	  });
	  
	  indicator.style.width = `${el.offsetWidth}px`;
	  indicator.style.left = `${el.offsetLeft}px`;
	  indicator.style.backgroundColor = el.getAttribute('active-color');

	  el.classList.add('is-active');
	  el.style.color = el.getAttribute('active-color');
	}


	items.forEach((item, index) => {
	  item.addEventListener('click', (e) => { handleIndicator(e.target)});
	  item.classList.contains('is-active') && handleIndicator(item);
	});
})
</script>
</head>
<body>
	<div style="width: 1000px;">
		<!-- 프로필 보여줄 리스트  -->
		<div class="profile-div">
			<div class="my-info">
				<h3>${loginAccount.a_nickname }님환영합니다!</h3>
				<h4>당신의 회원 등급은 '${loginAccount.a_rank }'입니다!</h4>
				<button onclick="location.href='changeInfo.go?a_id=${loginAccount.a_id}'">정보 수정</button>
			</div>
			<div class="my-info2">
				<h4>배송 주소 : ${loginAccount.a_addr }</h4>
				<h4>이메일 : ${loginAccount.a_email }</h4>
			</div>
		</div>
		<!-- 메뉴 리스트 -->
		<nav class="nav">
			<a href="deliveryTrackingGo" class="nav-item is-active" active-color="orange">배송 조회</a> 
			<a href="#" class="nav-item" active-color="green">찜한 목록</a> 
			<a href="#" class="nav-item" active-color="red">장바구니</a> 
			<a href="#" class="nav-item" active-color="blue">판매자 등록</a> 
			<span class="nav-indicator"></span>
		</nav>
	</div>
</body>

</html>
