<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/detail.css">
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="MenuBarTop">
		<jsp:include page="topMenu.jsp"></jsp:include>
	</div>

	<div id="detailWrapper">
		<div id="detailWrap">
			<div id="orderDiv">

				<div id="mainImg">
					<img src="resources/imgs/${p.p_img }">
				</div>

				<div id="orderDetail"> 


					<div class="detailTitle">
						<span>${p.p_name }</span>
					<div>정상가 ${p.p_price }</div>
					</div>
			
					<div id="orderOptionDiv">
						<div class="colorSelect">
							컬러 <select name="color">
								<option>검정</option>
								<option>화이트</option>
							</select>
						</div>
						<div class="sizeSelect">
							사이즈 <select name="color">
								<option>s</option>
								<option>m</option>
							</select>
						</div>
					</div>
						<div class="detailBtns">
							<button>바로 구매</button>
							<button>쇼핑백 담기</button>
							<button>찜하기</button>
						</div>
				</div> 
			</div>
			<div class="productDescription">상품설명 좌르륵~~~~~</div>
			<div id="detailImgs">
				<div class="productImg">
					<img src="resources/imgs/${p.p_img }">
				</div>
				
			</div>
			<div id="reviewDiv">
				<div>리뷰목록1</div>
				
			</div>
			<div id="qnaDiv">
				<div>큐앤에이목록1</div>
				<div>큐앤에이목록2</div>
				<div>큐앤에이목록3</div>
			</div>
		</div>
	</div>
</body>







</html>