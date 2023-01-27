<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.2.js"
	integrity="sha256-pkn2CUZmheSeyssYw3vMp1+xyub4m+e+QK4sQskvuo4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		alert('결제에 성공했습니다');
		var id = $('#id').val();
		location.href = "myPage.go?a_id="+id;
	})
</script>
<script type="text/javascript">
	
</script>
</head>
<body>
<input id="id" value="${loginAccount.a_id }" type="hidden">

</body>
</html>