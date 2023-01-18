<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/review.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
</script>
<script type="text/javascript">
	$(function() {
		$('.DOC_TEXT').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅

		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $('#counter').html("(200 / 최대 200자)");
		    }
	});
	});
</script>

</head>
<body>
<h1>후기 작성<br></h1>
<div id="ReviewContainer">
<form class="mb-3" name="myform" id="myform" method="post" enctype="multipart/form-data" action="regReview.do">
후기 이미지:<input name="r_img" type="file">
SDMall<br>
${orderList22.o_p_name}<br>
옵션 ${orderList22.o_p_size}${orderList22.o_p_color}<br>
<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="r_grade" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="r_grade" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="r_grade" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="r_grade" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="r_grade" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<br>
	<span>상품에 대한 평가를 20자 이상 작성해 주세요.</span><br>
	<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
	<textarea placeholder="내용" class="DOC_TEXT" name="DOC_TEXT"></textarea>
<input type="checkbox">작성된 후기는 SDMall 홍보 콘텐츠로 사용될 수 있습니다. (필수)<br>

<button id="regbtn" value="${reviews.p_no }" >등록</button>

</form>
</div>
</body>
</html>