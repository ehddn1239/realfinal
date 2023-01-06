<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>

<script type="text/javascript">
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

<div id="regContainer">
		<form action="product.update.do" method="post"
			enctype="multipart/form-data" name="fileForm">
		파일 선택 : <input type="file" multiple="multiple" name="files"> 
			<div>
				카테고리 <select name="p_category" id="selectCate">
					<option disabled="disabled">Outer</option>
					<option value="1">padding&jacket</option>
					<option value="2">coat</option>
					<option value="3">fieldJacket</option>
					<option disabled="disabled">Top</option>
					<option value="4">knit&cardigan</option>
					<option value="5">shirt&blouse</option>
					<option value="6">Tee</option>
					<option value="7">onepiece</option>
					<option disabled="disabled">Bottom</option>
					<option value="9">pants</option>
					<option value="10">denim</option>
					<option value="11">skirt</option>
					<option value="12">shorts</option>
					<option disabled="disabled">ETC</option>
					<option value="13">accessory</option>
					<option value="14">bags</option>
					<option value="15">shoes</option>
					
				</select> 
			</div>
			
			<div>
				상품 이름 <input name="p_name" value="${p.p_name }">
			</div>
			<div>
				상품 색상<input name="p_color" value="${p.p_color }">
			</div>
 			<div>
					<input type="checkbox" class ="p_size" name="p_size" value="XL">XL
					<input type="checkbox" class ="p_size" name="p_size" value="L">L
					<input type="checkbox" class ="p_size" name="p_size" value="M">M
					<input type="checkbox" class ="p_size" name="p_size" value="S">S
			</div>
			<div>
				가격 <input name="p_price" value="${p.p_price }">
			</div>
			<div>
				상품 설명 <textarea name="p_description">${p.p_description }</textarea>
			</div>
			<div>
				<button name="p_no" value="${p.p_no }">수정</button>
				<button type="button" onclick="location.href='/fj'">메인으로</button>
				
			</div>
		</form>
	</div>

</body>
</html>