<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
function goDetail(no) {
	location.href='detail.go?p_no=' + no;
}
// ????????? ?????? ????????? ?????????
$(function() {
	$('#previousbtn').attr('disabled', true);
	$('#nextbtn').click(function() {
		
		console.log('click!!');
		let curPageNo = $('#curPageNo').val();
		let a_id = $('#a_id').val();
		
		console.log("curPageNo : " + curPageNo);
		console.log("a_id : " + a_id);
		
		curPageNo++;
			$.ajax({ 
				url: "favorsPaging2", 
				type: "GET", 
				data:{
					"a_id" : a_id,
					"curPageNo" : curPageNo
				},
			}).done(function(res) {
				console.log(res);
				console.log(res.favors.length)
				let f = res.favors
				let len = res.favors.length - 1;
				// ???????????? ??????
				$('.favorSec').each(function(index, element) {
					console.log(index);
					console.log(element);
					$(element).remove();
					if(index == len) return false;
				})
				
				for(let i = 0; i < f.length; i++) {
					$('.favorites-div').append( 
							'<section id="favorSec" class="favorSec favorSec-'+ f[i].p_no + '" onclick="goDetail(' + f[i].p_no + ')">' +	
							'<img id="favorSecImg" src="resources/imgs/' + f[i].p_img + '">'		 +
							'<h3>' + f[i].p_name + '</h3>' + 
							'<h3>' + f[i].p_price + '</h3>' + 
							'</section>'		
							); 
				}
				$('#curPageNo').val(parseInt($('#curPageNo').val()) + 1);
				console.log("curPageNo after : " + curPageNo);
				if(parseInt(curPageNo) != 1) {
					console.log('??????!!');
					$('#previousbtn').attr('disabled', false);
				} else {
					console.log('?????????');
				}
				
				if(curPageNo == $('#pageCount').val()) {
					$('#nextbtn').attr('disabled', true);
				} 
			});
	});
	
	 $('#previousbtn').click(function() {
		 console.log('click!!');
		 
		let curPageNo = $('#curPageNo').val();
		let a_id = $('#a_id').val();
		
		curPageNo--;

		$.ajax({ 
				url: "favorsPaging2", 
				type: "GET", 
				data:{
					"a_id" : a_id,
					"curPageNo" : curPageNo
				},
			}).done(function(res) {
				console.log(res);
				console.log(res.favors.length)
				let f = res.favors
				
				// ???????????? ??????
				$('.favorSec').each(function(index, element) {
					$(element).remove();
				})
				
				for(let i = 0; i < f.length; i++) {
					$('.favorites-div').append( 
							'<section id="favorSec" class="favorSec favorSec-'+ f[i].p_no + '" onclick="goDetail(' + f[i].p_no + ')">' +	
							'<img id="favorSecImg" src="resources/imgs/' + f[i].p_img + '">'		 +
							'<h3>' + f[i].p_name + '</h3>' + 
							'<h3>' + f[i].p_price + '</h3>' + 
							'</section>'		
							); 
				}
				
				$('#curPageNo').val(parseInt($('#curPageNo').val()) - 1); 
				
				if(curPageNo == 1) {
					$('#previousbtn').attr('disabled', true);
				}
				if(curPageNo != $('#pageCount').val()) {
					$('#nextbtn').attr('disabled', false);
				} 
			}); 
	 });
	 
	 $('.wrapper').css('display','none');
	 $('#olbtn').click(function() {
		 if($('.wrapper').css('display') == 'flex'){
			$('.wrapper').css('display','none');
			$("#olbtn").html('???????????? ?????????');
		 }else{
			$('.wrapper').css('display','flex');
			$("#olbtn").html('???????????? ??????');
		 }
		});
});
</script>
<script type="text/javascript">
function goChargeCash(id) {
	if(confirm('????????? ???????????? ???????????????????')){
		window.open('kakaoPopup.go?a_id='+id, "?????? ??????", "width=400, height=300, top=50, left=50");
		return true;
	}
	return false;
}

function godelivery() {
	if(confirm('?????? ?????? ?????? ???????????????????')){
		var new_window_width = 900;
	    var new_window_height = 650;
		var positionX = ( window.screen.width / 2 ) - ( new_window_width / 2 );
	    var positionY = ( window.screen.height / 2 ) - ( new_window_height / 2 );
			window.open('deliveryTrackingGo', "?????? ??????", "width=880, height=620,"+ "top="+positionY+", left="+positionX);
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
		<!-- ????????? ????????? ?????????  -->
		<div class="profile-div">
			<div class="my-info">
				<h3>${loginAccount.a_nickname }??????????????????!</h3>
				<h4>????????? ?????? ????????? ${rank} ?????????!</h4>
				<h5>?????? ????????? ${loginAccount.a_exp }???</h5>
				<h5>?????? ?????? ${loginAccount.a_cash }???</h5>
				<button class="btn"
					onclick="location.href='changeInfo.go?a_id=${loginAccount.a_id}'">??????
					??????</button>
				<button class="btn"
					onclick="return deleteInfo('${loginAccount.a_id}')">?????? ??????</button>
				<button class="btn"
					onclick="return goChargeCash('${loginAccount.a_id}')">??????
					??????</button>
			</div>
			<div class="my-info2">
				<h4>????????? ?????? : ${loginAccount.a_post }</h4>
				<h4>?????? ?????? : ${loginAccount.a_addr }</h4>
				<h4>????????? : ${loginAccount.a_email }</h4>
			</div>
		</div>

		<!-- ?????? ?????? -->
		<div class="tabs">
			<div class="tab-header">
				<div class="active">
					<i class="fa fa-delivery"></i> ????????????
				</div>
				<div>
					<i class="fa fa-favorites"></i> ????????????
				</div>
				<div>
					<i class="fa fa-cart"></i> ????????????
				</div>
				<div>
					<i class="fa fa-productor"></i> ????????? ??????
				</div>
				<div>
					<i class="fa fa-orderlist"></i> ????????????
				</div>
			</div>
			<div class="tab-indicator"></div>
			<div class="tab-content">

				<div class="active">
					<section class="box" style="background: #BDBDBD;">
						<img class="profile" src="resources/imgs/deliveryCar.png">
					</section>
					<h2>?????? ??????</h2>
					<p>
						<a onclick="return godelivery()" class="nav-item is-active"
							active-color="orange">?????? ?????? ?????? ??????!</a>
					</p>
				</div>
				<div>
					<section>
						<c:choose>
							<c:when test="${pageCount eq null }">
								<section class="box" style="background: #BDBDBD;">
									<img class="profile" src="resources/imgs/noresult.png">
								</section>
								<h2>??? ????????? ????????????!</h2>
							</c:when>
							<c:when test="${pageCount eq 0 }">
								<section class="box" style="background: #BDBDBD;">
									<img class="profile" src="resources/imgs/noresult.png">
								</section>
								<h2>??? ????????? ????????????!</h2>
							</c:when>
							<c:otherwise>
								<section class="favorites-div">
									<!-- ????????? ???????????? -->
									<c:forEach items="${favorsPNO }" var="f">

										<section id="favorSec" class="favorSec favorSec-${f.p_no }"
											onclick="location.href='detail.go?p_no=${f.p_no}'">
											<img id="favorSecImg" src="resources/imgs/${f.p_img}">
											<h3>${f.p_name }</h3>
											<h3>${f.p_price }</h3>
										</section>
									</c:forEach>
									<br>
									
								</section>
								<input id="a_id" value="${loginAccount.a_id }" type="hidden">
                                <input id="curPageNo" value="${curPageNo }" type="hidden">
                                <input id="pageCount" value="${pageCount }" type="hidden">
								<button class="favorbtn" id="previousbtn">Previous</button>
                                <button class="favorbtn" id="nextbtn">Next</button>
							</c:otherwise>
						</c:choose>
						
					</section>
				</div>

				<div>
					<section class="box" style="background: #BDBDBD;">
						<img class="profile" src="resources/imgs/cart.png">
					</section>
					<h2>????????????</h2>
					<p>??????????????? ?????????????????????????</p>
					<button class="favorbtn"
						onclick="location.href='go.cart?a_id=${loginAccount.a_id }'">??????</button>
				</div>

				<div>
					<section class="box" style="background: #BDBDBD;">
						<img class="profile" src="resources/imgs/productor.png">
					</section>
					<h2>????????? ?????? ??????</h2>
					<p>????????? ?????? ???????????? ??????</p>
					<button
						onclick="return checkReq('${loginAccount.a_reqStatus}','${loginAccount.a_id }')"
						class="favorbtn" active-color="blue">????????? ??????</button>
				</div>
				<div>
					<c:if test="${orderList22 != null }">
						<section class="orderlist-div">
							<i class="fa fa-cart"></i>
							<h2>?????? ??????</h2>
							<p>?????? ????????? ?????? ???????????????????</p>
							<button id="olbtn">???????????? ?????????</button>
						</section>
					</c:if>
				</div>

			</div>
		</div>
		<div class="wrapper">
			<c:forEach items="${orderList22 }" var="o">
				<div class="item">
					<div class="polaroid">
						<img  onclick="location.href='detail.go?p_no=${o.o_p_no}'" class="order-img" src="resources/imgs/${o.o_p_img}">
						<div class="caption">
							<h1 class="older-h1">${o.o_p_name }</h1>
							<span>?????? ?????? : <fmt:formatDate value="${o.o_date }"
									pattern="yyyy??? MM???  dd???" /></span> <br> <span>?????? ????????? :
								${o.o_p_size }</span> <br> <span>?????? ?????? : ${o.o_qty }</span> <br>
							<span><button id="orderBtn" 
									onclick="location.href='review.go?o_no=${o.o_no}&p_no=${o.o_p_no}'">??????
									???????????? ??????</button></span>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
		<div style="height: 200px;">
		
		</div>
</body>
<script type="text/javascript" src="resources/js/myPage.js"></script>
<script type="text/javascript">
</script>
</html>
