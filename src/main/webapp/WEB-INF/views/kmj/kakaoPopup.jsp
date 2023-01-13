<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 금액 선택</title>
<script src="https://code.jquery.com/jquery-3.6.2.js"
	integrity="sha256-pkn2CUZmheSeyssYw3vMp1+xyub4m+e+QK4sQskvuo4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	//카카오페이 ajax 통신 세팅
	$('#chargeMoney').click(function() {
		var id = $("#id").val();
		var money = $("#money").val();
		
		$.ajax({
			url:'kakaoPay',
			dataType:'json',
			data:{
				"a_id" : id,
				"money" : money,
			},
			success:function(data){
				var link = data.next_redirect_pc_url;
				window.open(link);
			},
			error:function(error){
				alert(error);
			}
		});

	});
});
</script>

</head>
<body>

	<select name="money" id="money">
		<option value="10000">10,000원</option>
		<option value="50000">50,000원</option>
		<option value="100000">100,000원</option>
		<option value="1000000">1,000,000원</option>
	</select>
	<input name ="a_id" id="id" value="${loginAccount.a_id }">
	<button id="chargeMoney">충전하기</button>


</body>
</html>