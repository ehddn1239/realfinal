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
         <div class="titleEdit">프로필 수정</div>
            <div>
               <div class="infos">아이디</div>
               <div><input id="id" disabled="disabled" class="changeInfoInput" value="${loginAccount.a_id }"></div>
            </div>
            <div>
               <div class="infos">비밀번호</div>
               <div><input id="pw" type="password" name="pw" class="changeInfoInput" value="${loginAccount.a_pw }"></div>
            </div>
            <div>
               <div class="infos">비밀번호 재확인</div>
               <div><input id="pw2" type="password" class="changeInfoInput"></div>
            </div>
            <div>
               <div class="infos">닉네임</div>
               <div><input id="nick" name="nickname" value="${loginAccount.a_nickname }" class="changeInfoInput"></div>
            </div>
            <div>
               <div class="infos">주소</div>
               
               <div><input id="addr" name="addr" value="${loginAccount.a_addr }" class="changeInfoInput"></div>
            </div>
            <div>
               <div class="infos">핸드폰 번호</div>
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