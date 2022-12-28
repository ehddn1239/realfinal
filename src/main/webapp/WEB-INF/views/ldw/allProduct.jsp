<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${products }" var="p">
					<img src="resources/imgs/${p.p_img }">
						<span>${p.p_name}</span>
					<div>${p.p_size}</div>
					<div>${p.p_price}</div>
					<div>${p.p_color}</div>

		</c:forEach>
</body>
</html>