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
	alert('결제에 실패 했습니다');
	location.href='kakaoPopup.go';
</script>
</head>
<body>
<h1>실패 페이지 입니다!</h1>
<button onclick="location.href='gohome.go'">메인으로 이동</button>
</body>
</html>