<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</script>
</head>
<body>
<table>
<tr>
<td><input type="checkbox" name="allCart" value="selectAll" onclick='selectAll(this)' ></td>
<td>이미지</td>
<td>상품명(옵션)</td>
<td>가격</td>
<td>수량</td>
<td><button onclick="deleteCartItemAll('${loginAccount.a_id}')">전체삭제</button></td>
</tr>
<c:forEach items="${cart }" var="c">
<tr>
<td><input type="checkbox" name="allCart"></td>
<td><img src="resources/imgs/${c.p_img}"></td>
<td>${c.p_name },${c.p_color },${c.p_size }</td>
<td>${c.p_price }</td>
<td>${c.cart_qty }</td>
<td><button onclick="deleteCartItem('${c.a_id}','${c.cartId}')">삭제</button></td>
</tr>
</c:forEach>

</table>
</body>
</html>