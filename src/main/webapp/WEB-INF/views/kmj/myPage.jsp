<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myPage.css">
<!-- <script type="text/javascript" src="resources/js/myPage.js"></script> -->
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
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
	
	$(".favors").click(function() {
		if($(".orderlist-tbl").css('display') == 'flex'){
			$(".orderlist-tbl").hide();
		}
		if($(".favorites-div").css('display') == 'flex'){
			$(".favorites-div").hide();
		}else{
			$(".favorites-div").css('display','flex');
		}
	});
	$("#orderlist").click(function() {
		if($(".favorites-div").css('display') == 'flex'){
			$(".favorites-div").hide();
		}
		
		if($(".orderlist-tbl").css('display') == 'flex'){
			$(".orderlist-tbl").hide();
		}else{
			$(".orderlist-tbl").css('display','block');
		}
	});
	
	
})
</script>


<script type="text/javascript">
function goChargeCash(id) {
	if(confirm('캐시를 충전하러 가시겠습니까?')){
		location.href="kakaoPopup.go?a_id="+id;
		return true;
	}
	return false;
}
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="../sh/header.jsp"></jsp:include>
	</div>
	<div class="whole-div" style="width: 1000px;">
		<!-- 프로필 보여줄 리스트  -->
		<div class="profile-div">
			<div class="my-info">
				<h3>${loginAccount.a_nickname }님환영합니다!</h3>
				<h4>당신의 회원 등급은 ${rank} 입니다!</h4>
				<h5>누적 포인트 ${loginAccount.a_exp }점</h5>
				<h5>보유 캐시 ${loginAccount.a_cash }원</h5>
				<button
					onclick="location.href='changeInfo.go?a_id=${loginAccount.a_id}'">정보
					수정</button>
				<button onclick="return deleteInfo('${loginAccount.a_id}')">계정
					삭제</button>
				<button onclick="return goChargeCash('${loginAccount.a_id}')">캐시
					충전</button>
			</div>
			<div class="my-info2">
				<h4>배송 주소 : ${loginAccount.a_addr }</h4>
				<h4>이메일 : ${loginAccount.a_email }</h4>
			</div>
		</div>

		<!-- 새로 도전 -->
		<div class="tabs">
			<div class="tab-header">
				<div class="active">
					<i class="fa fa-delivery"></i> 배송조회
				</div>
				<div>
					<i class="fa fa-favorites"></i> 찜한목록
				</div>
				<div>
					<i class="fa fa-cart"></i> 장바구니
				</div>
				<div>
					<i class="fa fa-productor"></i> 판매자 등록
				</div>
				<div>
					<i class="fa fa-orderlist"></i> 구매이력
				</div>
			</div>
			<div class="tab-indicator"></div>
			<div class="tab-content">

				<div class="active">
					<section class="box" style="background: #BDBDBD;">
						<img class="profile" src="resources/imgs/deliveryCar.png">
					</section>
					<h2>배송 조회</h2>
					<p>
						<a href="deliveryTrackingGo" class="nav-item is-active"
							active-color="orange">배송 조회 하러 가기!</a>
					</p>
				</div>
				<div>
					<section class="favorites-div">
						<!-- 찜목록 보여주기 -->
						<c:forEach items="${favorsPNO }" var="f">

						 <section id="favorSec" onclick="location.href='detail.go?p_no=${f.p_no}'">
								<img id="favorSecImg" src="resources/imgs/${f.p_img}" >
								<h3>${f.p_no }</h3>
								<h3>${f.p_name }</h3>
								<h3>${f.p_price }</h3>
						</section>
						 </c:forEach> 
					</section>
				</div>

				<div>
					<i class="fa fa-cart"></i>
					<h2>장바구니</h2>
					<p>장바구니로 이동하시겠습니까?</p>
					<button onclick="location.href='go.cart?a_id=${loginAccount.a_id }'">이동</button>
				</div>

				<div>
					<section class="box" style="background: #BDBDBD;">
						<img class="profile" src="resources/imgs/productor.png">
					</section>
					<h2>판매자 전환 요청</h2>
					<p>판매자 전환 요청하러 가기</p>
					<button onclick="return checkReq('${loginAccount.a_reqStatus}','${loginAccount.a_id }')" 
					class="nav-item" active-color="blue">판매자 등록</button>
				</div>
				<div>
					<c:if test="${orderList22 != null }">
						<section class="orderlist-div">
						<!-- 구매목록 보여주기 -->
							<table border="1" class="orderlist-tbl">
								<tr>
									<td>사진</td>
									<td>이름</td>
									<td>수량</td>
									<td>구매 날짜</td>
									<td>사이즈</td>
									<td>색상</td>
									<td>작성 여부</td>
								</tr>
							<c:forEach items="${orderList22 }" var="o">
								<tr>
									<td><img id="favorimg" src="resources/imgs/${o.o_p_img}"></td>
									<td>${o.o_p_name }</td>
									<td>${o.o_qty }</td>
									<td>${o.o_date}</td>
									<td>${o.o_p_size}</td>
									<td>${o.o_p_color}</td>
									<td><button onclick="location.href='review.go?o_no=${o.o_no}'">작성하러
									가기</button></td>
								</tr>
							</c:forEach>
							</table>
						</section>
					</c:if>
				</div>

			</div>
		</div>
		<div style="height: 300px;">
		
		
		</div>


		<%-- <!-- 메뉴 리스트 -->
		<nav class="nav">
			<a href="deliveryTrackingGo" class="nav-item is-active" active-color="orange">배송 조회</a> 
			<a class="favors" class="nav-item" active-color="green">찜한 목록</a> 
			<input id="aid"value="${loginAccount.a_id }" type="hidden"> 
			<a href="go.cart?a_id=${loginAccount.a_id }" class="nav-item" active-color="red">장바구니</a> 
			<a onclick="return checkReq('${loginAccount.a_reqStatus}','${loginAccount.a_id }')" class="nav-item" active-color="blue">판매자 등록</a> 
			<a id="orderlist" class="nav-item" active-color="violet" >구매이력</a>
			<span class="nav-indicator"></span>
		</nav>
		<div class="favorites-div" >
			<!-- 찜목록 보여주기 -->
			<c:forEach items="${favorsPNO }" var="f">
				<div>
					<h3>${f.p_no }</h3>
					<h3>${f.p_name }</h3>
					<h3>${f.p_price }</h3>
					<img src="resources/imgs/${f.p_img}">
				</div>
			</c:forEach>
		</div>
		<c:if test="${orderList22 != null }">
			<div class="orderlist-div">
				<!-- 구매목록 보여주기 -->
				<table border="1" class="orderlist-tbl">
					<tr class="orderlist-header">
						<c:forEach items="${orderList22 }" var="o">
							<tr>
								<td>사진</td>
								<td>이름</td>
								<td>구매 날짜</td>
								<td>작성 여부</td>
							</tr>

							<div>
								<h3>${o.o_p_name }</h3>
								<h3>${o.o_qty }</h3>
								<h3>${o.o_date}</h3>
								<h3>${o.o_p_size}</h3>
								<h3>${o.o_p_color}</h3>
								<button onclick="location.href='review.go?o_no=${o.o_no}'">작성하러
									가기</button>
							</div>
						</c:forEach>
				</table>
			</div>
		</c:if> --%>
	</div>
</body>
<script type="text/javascript" src="resources/js/myPage.js"></script>
<script type="text/javascript">
</script>
</html>
