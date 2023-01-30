<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/cart.css">
<script type="text/javascript">
function selectAll(selectAll)  {
	
	  const checkboxes 
	       = document.getElementsByName('allCart');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  });
	};
	
	function deleteCartItem(a,n){
		let c = confirm('정말로 삭제하시겠습니까?');
		if(c){
			location.href='delete.cart.do?a_id=' + a + '&cartId=' + n;
		}
		
	}
	function deleteCartItemAll(a){
		let c = confirm('정말로 전체 삭제하시겠습니까?');
		if(c){
			location.href='delete.cart.allDo?a_id=' + a;
		}
	}
	
	
	function confirmPay(pno, aid, cid, opsize,color,qty){
		if(confirm('결제 하시겠습니까?')){
			location.href='cart.buy.go?p_no='+pno+'&a_id='+aid+'&cartId='+cid+"&p_size="+opsize+"&p_color="+color+"&cart_qty=" + qty;
			return true;
		}else{
			return false;
		}
	}
	
</script>
</head>
<body>
	<%-- <table border="1">
		<tr>
			<td><input type="checkbox" name="allCart" value="selectAll"
				onclick='selectAll(this)'></td>
			<td>이미지</td>
			<td>상품명(옵션)</td>
			<td>가격</td>
			<td>수량</td>
			<td>구매</td>
			<td><button onclick="deleteCartItemAll('${loginAccount.a_id}')">전체삭제</button></td>
		</tr>
		<c:forEach items="${cart }" var="c">
			<tr>
				<td><input type="checkbox" name="allCart"></td>
				<td><img id="cart-preview" src="resources/imgs/${c.p_img}"></td>
				<td>
					<p>상품명 : ${c.p_name }</p>
					<p>상품 색상 : ${c.p_color }</p>
					<p>상품 사이즈 : ${c.p_size  }</p>
				</td>
				<td>${c.p_price }</td>
				<td>${c.cart_qty }</td>
				<td><button onclick="deleteCartItem('${c.a_id}','${c.cartId}')">구매</button></td>
				<td><button onclick="deleteCartItem('${c.a_id}','${c.cartId}')">삭제</button></td>
			</tr>
		</c:forEach>
	</table> --%>
	
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	
	<div class="support-grid"></div>

	<div class="band">
		<c:forEach items="${cart }" var="c">
		<div class="item">
			<div class="card">
				<div class="thumb"
					style="background-image: url(resources/imgs/${c.p_img});"></div>
				<article>
					<h1>${c.p_name }</h1>
					<span>상품 색상 : ${c.p_color }</span>
					<c:choose>
					<c:when test="${c.p_size eq null }">
					<span>상품 사이즈 : 선택하지 않았습니다.</span>
					</c:when>
					<c:otherwise>
					<span>상품 사이즈 : ${c.p_size  }</span>
					</c:otherwise>
					</c:choose>
					<span>상품 가격 : ${c.p_price }</span>
					<span>상품 구매 수량 : ${c.cart_qty }</span>
					<span style="text-align: center;">
						<button class="btn" onclick="return confirmPay('${c.p_no}','${loginAccount.a_id }','${c.cartId }','${c.p_size }','${c.p_color }','${c.cart_qty }')">구매</button>
						<button class="btn" onclick="deleteCartItem('${c.a_id}','${c.cartId}')">삭제</button>
					</span>
				</article>
			</div>
		</div>
		</c:forEach>
	</div>


</body>
</html>