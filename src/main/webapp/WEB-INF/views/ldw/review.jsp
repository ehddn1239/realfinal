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
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
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
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
		}
	function page_back(){

		history.go(-1)();

	}
</script>
</head>
<body>

	<div id="ReviewContainer">
		<div class="ReviewTitle">후기 작성</div>
		<form action="regReview.do" id="myform" method="post"
			enctype="multipart/form-data" onsubmit="return reviewProduct()">

			<div class="reviewImg">
				이미지 <input id="rvImg" name="files" type="file" onchange="readURL(this);" onerror="this.style.display='none'">
			</div>
				<div><img id="preview" /></div>
			<div class="reviewOption">
				<div class="reviewON">SDMall</div>
				<div class="reviewON1">${oo.o_p_name}<span style="color: #777">(${oo.o_p_color})</span>
				</div>
				<div class="reviewON2">${oo.o_p_size}</div>
			</div>
			<input value="${oo.o_p_no }" name="o_p_no" type="hidden">
			<div class="reviewRate">
				<div class="star-rating space-x-4 mx-auto">

					<input type="radio" id="5-stars" name="r_grade" value="5"
						v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="r_grade" value="4"
						v-model="ratings" /> <label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="r_grade" value="3"
						v-model="ratings" /> <label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="r_grade" value="2"
						v-model="ratings" /> <label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="r_grade" value="1"
						v-model="ratings" /> <label for="1-star" class="star">★</label>
				</div>
				<span class="text-bold">별점을 선택해주세요</span>
			</div>
			<div class="reviewTxt">

				<div>상품에 대한 평가를 20자 이상 작성해 주세요.</div> 
					<div style="color: #aaa;" id="counter">(0 / 최대 200자)</div>
				<textarea id="rvTxt" placeholder="내용" class="DOC_TEXT" name="r_txt"></textarea>
			</div>
				<div><input type="checkbox" id="marketing">작성된 후기는 SDMall 홍보 콘텐츠로 사용될 수 있습니다.(필수)</div>
<div class="reviewbtn">
			<button id="regbtn">등록</button>
			<button type="button" id="regbtn" onclick="page_back();">뒤로가기</button>
</div>

		</form>
	</div>
</body>
</html>
