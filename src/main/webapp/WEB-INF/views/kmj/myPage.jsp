<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myPage.css">
<script type="text/javascript" src="resources/js/myPage.js"></script>

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
<script type="text/javascript">

//jQuery로 favors a태그 눌럿을때 아래에 div가 보이도록 하자
$(function() {
	$("#favors").click(function() {
		let a_id = $("#a-id").val();
		$.ajax({
			url:'showAllFavors.do',
			data: {
				"a_id" : a_id
			},
			success: function(data) {
				console.log(data);
				if(data == "N"){
					alert('사용할 수 있는 아이디');
				}else{
					alert('불가능한 아이디입니다');
				}
			}
		});
	});
});
</script>
</head>
<body>
	<div style="width: 1000px;">
		<!-- 프로필 보여줄 리스트  -->
		<div class="profile-div">
			<div class="my-info">
				<h3>${loginAccount.a_nickname }님 환영합니다!</h3>
				<h4>당신의 회원 등급은 '${loginAccount.a_rank }'입니다!</h4>
				<button onclick="location.href='changeInfo.go?a_id=${loginAccount.a_id}'">정보 수정</button>
				<button onclick="return deleteInfo('${loginAccount.a_id}')">계정 삭제</button>
			</div>
			<div class="my-info2">
				<h4>배송 주소 : ${loginAccount.a_addr }</h4>
				<h4>이메일 : ${loginAccount.a_email }</h4>
			</div>
		</div>
		<!-- 메뉴 리스트 -->
		<nav class="nav">
			<a href="deliveryTrackingGo" class="nav-item is-active" active-color="orange">배송 조회</a> 
			<a onclick="showAllFavors('${loginAccount.a_id}')" class="nav-item" active-color="green"">찜한 목록</a> 
			<a href="go.cart?a_id=${loginAccount.a_id }" class="nav-item" active-color="red">장바구니</a> 
			<a onclick="return checkReq('${loginAccount.a_reqStatus}','${loginAccount.a_id }')" class="nav-item" active-color="blue">판매자 등록</a> 
			<a href="#" class="nav-item" active-color="violet">구매이력</a> 
			<span class="nav-indicator"></span>
		</nav>
		<div class="favorites-div" style="display: flex;">
		<!-- 찜목록 보여주기 -->
			<c:forEach items="${favorsPNO }" var="f">
				<div>
					 <h3>${f.p_no }</h3>				
					 <h3>${f.p_name }</h3>				
					 <h3>${f.p_price }</h3>	
					 <c:forEach items="${imgs[0]}" var="i">
						<img src="resources/imgs/${i}">
					</c:forEach>			
				</div>
			</c:forEach>
		</div>
	</div>
</body>

</html>
