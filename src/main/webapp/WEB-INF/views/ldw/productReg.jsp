<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
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
</script>



</head>
<body>
	<div class="regRealContainer">

		<div id="regtitle">SDMALL</div>
		<div id="regContainer">
			<form action="reg.products.do" method="post"
				enctype="multipart/form-data" name="fileForm" onsubmit="return regProduct()">
				<div id="regImg">
					<input id="imgforLabel" type="file" multiple="multiple" name="files"
						onchange="setDetailImage(event);"><label for="imgforLabel" class="imgLabel">이미지 업로드</label>
						&nbsp;최대 5장(첫번째 선택된 사진이 메인 사진으로 사용됩니다.)
					<div id="images_container"></div>
				</div>


				<div id="regCategory">
					<span class="regSpan">카테고리</span> <select id="regCatego" name="p_category" class="regSelect">
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
					<span class="regSpan">상품 이름</span> <input id="regName" class="regInput" name="p_name">
				</div>
				<div class="regProductColor">
					<span class="regSpan">상품 색상</span><input id="regColor" class="regInput" name="p_color">
				</div>
				<div class="regSize">
					<span class="regSpan">사이즈 </span>
					<div class="regSizeCheckbox">
						<input type="checkbox" name="p_size" value="selectAll"
							onclick='selectAll(this)' id="regSize">All <input
							type="checkbox" name="p_size" value="XL">XL <input
							type="checkbox" name="p_size" value="L">L <input
							type="checkbox" name="p_size" value="M">M <input
							type="checkbox" name="p_size" value="S">S
					</div>
				</div>
				<div class="regProductPrice">
					<span class="regSpan">가격</span><input id="regPrice" class="regInput" name="p_price" type="number">
				</div>
				<div class="regProductInfo">
					<span id="productSpan" class="regSpan">상품 설명</span>
					<textarea name="p_description"></textarea>
				</div>
				<div class="regBtn">
					<button onclick='check()'>등록</button>
					<button type="button" onclick="location.href='/fj'">메인으로</button>

				</div>
			</form>
		</div>
	</div>
	
</body>
</html>