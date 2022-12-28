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
	<div class="Container">
		<c:forEach items="${padding }" var="p">
			<div class="">
				<div>
					<img class="poster" src="resources/imgs/${p.p_img }">
				</div>
				<div class="">

					${p.p_name} ${p.p_size}
					<fmt:formatNumber value="${p.p_price }" type="currency"
						currencySymbol="\\" />

					${p.p_color} ${p.p_stock}

				</div>
			</div>

		</c:forEach>

	</div>

</body>
</html>