<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 신청 페이지</title>
<link rel="stylesheet" href="resources/css/requestSeller.css">
<script type="text/javascript">

function page_back(){

	history.go(-1)();

}
</script>
</head>
<body>

	<div class="whole-wrap-div">
		<div class="changeInfoWrapper">
			<form action="sendReq.do" method="get">
				<div class="wholeInput">
					<div class="titleEdit">판매자 신청</div>
					<div>
						<div class="infos">회원 닉네임</div>
						<input name="r_nickname" value="${loginAccount.a_nickname }" type="hidden"> 
						<div class="changeInfoInput">${loginAccount.a_nickname }</div>
					</div>
					<div>
						<div class="infos">매장 이름</div>
						<div class="changeInfoInput"><input name="r_marketname" value="SDMall" type="hidden">
							<span>SDMall</span>
						</div>
					</div>
					<div>
						<div class="infos">회원 아이디</div>
						<div class="changeInfoInput">${loginAccount.a_id }
							<input type="hidden" name="r_id" value="${loginAccount.a_id }">
							<input type="hidden" name="a_id" value="${loginAccount.a_id }">
						</div>
					</div>
					<div>
						<div class="infos">회원 이메일</div>
						<div class="changeInfoInput">${loginAccount.a_email }
							<input type="hidden" name="r_email"
								value="${loginAccount.a_email }">
						</div>
					</div>
					<div>
						<div class="infos">회원 등급</div>

						<div class="changeInfoInput">${loginAccount.a_rank }
							<input type="hidden" name="r_rank"
								value="${loginAccount.a_rank }">
						</div>
					</div>
					<div>
						<div class="infos">판매자 권한 요청 사유</div>
						<div class="changeInfoInput">
							<textarea name="r_description" rows="7" cols="80"></textarea>
						</div>
					</div>
					<div class="btns">
						<div >
							<button class="editInfoBtn1">신청하기</button>
						</div>
						<div>
							<button type="button" class="editInfoBtn2" onclick="page_back();">뒤로가기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>