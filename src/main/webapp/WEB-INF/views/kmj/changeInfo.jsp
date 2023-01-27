<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 페이지</title>
<link href="resources/css/changeInfo.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.js"
   integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
   crossorigin="anonymous">
</script>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
	document.getElementById("a_post").addEventListener("click", function() {
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            document.getElementById("a_post").value = data.address; //주소값
				document.querySelector("input[name=a_addr]").focus(); // 상세주소에 포커싱	            
	        }
	    }).open();	
	});
}
</script>
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript">
/* 패스워드에 포커스 올리면 내용 보이게 */
$(function() {
   $("#pw").on("focus", function() {
      $(this).prop('type', 'text');
   });
   $("#pw").on("blur", function() {
      $(this).prop('type','password');
   });
});

function page_back(){

	history.go(-1)();

}
</script>

</head>
<body>
   <div class="whole-wrap-div">
   <div class="changeInfoWrapper">
      <form action="changeInfo.do" method="post" onsubmit="return changeInfoCheck()">
         <div class="wholeInput">
         <div class="titleEdit">Edit Profile</div>
            <div>
               <div class="infos">ID</div>
               <div><input id="id" disabled="disabled" class="changeInfoInput" value="${loginAccount.a_id }"></div>
            </div>
            <div>
               <div class="infos">Password</div>
               <div><input id="pw" type="password" name="pw" class="changeInfoInput" value="${loginAccount.a_pw }"></div>
            </div>
            <div>
               <div class="infos">Confirm Password</div>
               <div><input id="pw2" type="password" class="changeInfoInput"></div>
            </div>
            <div>
               <div class="infos">Nickname</div>
               <div><input id="nick" name="nickname" value="${loginAccount.a_nickname }" class="changeInfoInput"></div>
            </div>
            <div>
               <div class="infos">Address</div>
               <div><input id="a_post" name="a_post" value="${loginAccount.a_post }" class="changeInfoInput"></div>
               <div class="infos">Detail Address</div>
               <div><input id="addr" name="a_addr" value="${loginAccount.a_addr }" class="changeInfoInput"></div>
            </div>
            <div>
               <div class="infos">Phone</div>
               <div><input type="tel" id="phone" name="phone" value="${loginAccount.a_phone }" class="changeInfoInput"></div>
            </div>
            <div class="btns">
            <div><button class="editInfoBtn1">수정하기</button></div>
            <div><button class="editInfoBtn2" onclick="page_back();'">뒤로가기</button></div>
            <input name="a_id" value="${loginAccount.a_id }" type="hidden">
            </div>
         </div>
      </form>
      </div>
   </div>



</body>
</html>