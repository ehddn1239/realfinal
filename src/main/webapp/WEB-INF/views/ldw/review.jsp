<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/review.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
	$(function() {
		$('.DOC_TEXT').keyup(function(e) {
			var content = $(this).val();
			$('#counter').html("(" + content.length + " / 최대 200자)"); //글자수 실시간 카운팅
			if (content.length > 200) {
				alert("최대 200자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 200));
				$('#counter').html("(200 / 최대 200자)");
			}
		});
	});
</script>

</head>
<body>
	<h1>
		후기 작성<br>
	</h1>
	<div id="ReviewContainer">
		<form action="regReview.do" id="myform" method="post"
			enctype="multipart/form-data">
			후기 이미지:<input name="files" type="file"> SDMall<br> 옵션<br>
			이름:${oo.o_p_name}<br> 사이즈:${oo.o_p_size}<br>
			색상:${oo.o_p_color}<br> <input value="${oo.o_p_no }"
				name="o_p_no" type="hidden">
			<div class="star-rating space-x-4 mx-auto">

				<input type="radio" id="5-stars" name="r_grade" value="5"
					v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="r_grade" value="4"
					v-model="ratings" /> <label for="4-stars" class="star">★</label> <input
					type="radio" id="3-stars" name="r_grade" value="3"
					v-model="ratings" /> <label for="3-stars" class="star">★</label> <input
					type="radio" id="2-stars" name="r_grade" value="2"
					v-model="ratings" /> <label for="2-stars" class="star">★</label> <input
					type="radio" id="1-star" name="r_grade" value="1" v-model="ratings" />
				<label for="1-star" class="star">★</label>
			</div>
			<span class="text-bold">별점을 선택해주세요</span> <br>
			 <span>상품에
				대한 평가를 20자 이상 작성해 주세요.</span><br> <span style="color: #aaa;"
				id="counter">(0 / 최대 200자)</span>
			<textarea placeholder="내용" class="DOC_TEXT" name="r_txt"></textarea>
			<input type="checkbox">작성된 후기는 SDMall 홍보 콘텐츠로 사용될 수 있습니다.
			(필수)<br>

			<button id="regbtn">등록</button>

		</form>
	</div>
</body>
</html>
