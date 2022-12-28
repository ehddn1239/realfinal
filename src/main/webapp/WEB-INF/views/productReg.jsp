<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="regContainer" style="border: solid 1px white; width: 500px;">
		<form action="reg.products.do" method="post"
			enctype="multipart/form-data">
			<div>
				카테고리<select>
					<option disabled="disabled">Outer</option>
					<option value="1">padding</option>
					<option value="2">coat</option>
					<option value="3">fieldJacket</option>
					<option value="4">jacket</option>
					<option disabled="disabled">Top</option>
				</select> 
			</div>
			<div>
				이미지: <input name="p_img" type="file">
			</div>
			<div>
				상품 이름: <input name="p_name">
			</div>
			<div>
				색상: <input name="p_color">
			</div>
			<div>
				사이즈<select>
					<option value="p_size">S</option>
					<option value="p_size">M</option>
					<option value="p_size">L</option>
					<option value="p_size">XL</option>
					<option value="p_size">XXL</option>
					</select>
			</div>
			<div>
				가격 <input name="p_price">
			</div>
			<div>
				재고 <input name="p_stock">
			</div>
			<div>
				<button>등록</button>
				<button onclick="location.href='/fj'">메인으로</button>
			</div>
		</form>
	</div>
</body>
</html>