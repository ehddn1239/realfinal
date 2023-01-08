<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/productRegPage.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>

<script type="text/javascript">
function setDetailImage(event){
	
	for(var image of event.target.files){
		$("#images_container").empty();
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			document.querySelector("div#images_container").appendChild(img);
		};
		
		console.log(image);
		reader.readAsDataURL(image);
	}
	
};


	function selectAll(selectAll)  {
		
		  const checkboxes 
		       = document.getElementsByName('p_size');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  });
		};
$(function() {
	$("#selectCate").val("${p.p_category}").attr("selected","selected");
	$(document).ready(function() {
		let sizes = "${p.p_size}";
		let size = sizes.split("!");
		
	$('.p_size').prop('checked', false);
	
	for(let s in size){
			$("input[name=p_size][value="+size[s]+"]").prop("checked", true);
	}
	})
	
});

</script>


</head>
<body>

<div class="regRealContainer">

		<div id="regtitle">쇼핑몰 이름</div>
		<div id="regContainer">
			<form action="product.update.do" method="post"
				enctype="multipart/form-data" name="fileForm">
				<div id="regImg">
					<input id="imgforLabel" type="file" multiple="multiple" name="files"
						onchange="setDetailImage(event);"><label for="imgforLabel" class="imgLabel">이미지 업로드</label>
						&nbsp;최대 5장(첫번째 선택된 사진이 메인 사진으로 사용됩니다.)
					<div id="images_container"></div>
				</div>


				<div id="regCategory">
					<span>카테고리</span> <select name="p_category" class="regSelect" id="selectCate">
						<option disabled="disabled">Outer</option>
						<option value="1">padding&jacket</option>
						<option value="2">coat</option>
						<option value="3">fieldJacket</option>
						<option disabled="disabled">Top</option>
						<option value="4">knit&cardigan</option>
						<option value="5">shirt</option>
						<option value="6">Tee</option>
						<option disabled="disabled">Bottom</option>
						<option value="9">pants</option>
						<option value="10">denim</option>
						<option value="12">shorts</option>
						<option disabled="disabled">ETC</option>
						<option value="13">accessory</option>
						<option value="14">bags</option>
						<option value="15">shoes</option>
					</select>
				</div>

				<div class="regProductName">
					<span>상품 이름</span> <input name="p_name" value="${p.p_name }" >
				</div>
				<div class="regProductColor">
					<span>상품 색상</span><input name="p_color" value="${p.p_color }">
				</div>
				<div class="regSize">
					<span>사이즈 </span>
					<div class="regSizeCheckbox">
						<input type="checkbox" name="p_size" value="selectAll"
							onclick='selectAll(this)'>All <input
							type="checkbox" class="p_size" name="p_size" value="XL">XL <input
							type="checkbox" class="p_size" name="p_size" value="L">L <input
							type="checkbox" class="p_size" name="p_size" value="M">M <input
							type="checkbox" class="p_size" name="p_size" value="S">S
					</div>
				</div>
				<div class="regProductPrice">
					<span>가격</span><input name="p_price" type="number" value="${p.p_price }">
				</div>
				<div class="regProductInfo">
					<span id="productSpan">상품 설명</span>
					<textarea name="p_description">${p.p_description }</textarea>
				</div>
				<div class="regBtn">
					<button name="p_no" value="${p.p_no }">수정</button>
					<button type="button" onclick="location.href='/fj'">메인으로</button>

				</div>
			</form>
		</div>
	</div>
</body>
</html>