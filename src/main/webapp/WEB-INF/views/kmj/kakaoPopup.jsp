<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 금액 선택</title>
<link rel="stylesheet" href="resources/css/popup.css">
<script src="https://code.jquery.com/jquery-3.6.2.js"
	integrity="sha256-pkn2CUZmheSeyssYw3vMp1+xyub4m+e+QK4sQskvuo4="
	crossorigin="anonymous"></script>


<script type="text/javascript">
	$(function() {
		//카카오페이 ajax 통신 세팅
		$('#chargeMoney').click(function() {
			var id = $("#id").val();
			var money = $('input[name=rad]:checked').val();
			console.log('id = ' + id);
			console.log('money = ' + money);
			$.ajax({
				url : 'kakaoPay2',
				dataType : 'json',
				data : {
					"a_id" : id,
					"money" : money,
				},
				success : function(data) {
					opener.location.href=data.next_redirect_pc_url;
					/* location.href = data.next_redirect_pc_url; */
					self.close();
				},
				error : function(error) {
					alert(error);
				}
			});

		});
	});
</script>

</head>
<body>

	<!-- <select name="money" id="money">
		<option value="10000">10,000원</option>
		<option value="50000">50,000원</option>
		<option value="100000">100,000원</option>
		<option value="1000000">1,000,000원</option>
	</select> -->
	
	

	<div>
		<label class="rad-label"> <input type="radio"
			class="rad-input" name="rad" value="10000" id="money">
			<div class="rad-design"></div>
			<div class="rad-text">10,000원</div>
		</label> <label class="rad-label"> <input type="radio"
			class="rad-input" name="rad" value="50000" id="money">
			<div class="rad-design"></div>
			<div class="rad-text">50,000원</div>
		</label> <label class="rad-label"> <input type="radio"
			class="rad-input" name="rad" value="100000" id="money">
			<div class="rad-design"></div>
			<div class="rad-text">100,000원</div>
		</label> <label class="rad-label"> <input type="radio"
			class="rad-input" name="rad" value="1000000" id="money">
			<div class="rad-design"></div>
			<div class="rad-text">1,000,000원</div>
		</label>
	</div>
	<input type="hidden" name="a_id" id="id" value="${loginAccount.a_id }">
	<button id="chargeMoney">충전하기</button>

</body>
</html>