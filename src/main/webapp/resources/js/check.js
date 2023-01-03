function loginCheck() {
	var idInput = document.loginForm.a_id;
	var pwInput = document.loginForm.a_pw;
	var span = document.getElementById('span');
	if (isEmpty(idInput) || isEmpty(pwInput)) {
		idInput.value = "";
		pwInput.value = "";
		span.style.visibility = "visible";
		span.style.color = "red";
		span.style.fontWeight = "bolder";
		
		idInput.focus();
		return false;
	}

	return true;
}

function joinCheck() {
	var idInput = document.joinForm.a_id;
	var pwInput = document.joinForm.a_pw;
	var pwInput2 = document.joinForm.a_pw2;
	var nameInput = document.joinForm.a_nickname;
	var addrInput = document.joinForm.a_addr;
	var emailInput = document.joinForm.a_email;
	var phoneInput = document.joinForm.a_phone;

	if (isEmpty(idInput) || containsHS(idInput)) {
		alert("아이디 잘못 입력함!! (한글이나 공백이 없어야함)");
		idInput.value = "";
		idInput.focus();
		return false;
	}else if(isEmpty(pwInput) || notEquals(pwInput, pwInput2) || lessThan(pwInput, 5)){
		if(notEquals(pwInput, pwInput2)){
			alert("비밀번호랑 비밀번호 확인이랑 일치하지 않음");
			pwInput2.value="";
			pwInput2.focus();
			return false;
		}else if(lessThan(pwInput, 5)){
			alert("5글자 이상 입력하세요")
		}
		alert("암호를 입력하지 않앗음")
		return false;
	}else if (isEmpty(nameInput)) {
		alert("닉네임 입력해주십시요");
		nameInput.value = "";
		nameInput.focus();
		return false;
	} else if (isEmpty(addrInput)) {
		alert("주소를 입력해주세요");
		addrInput.value = "";
		addrInput.focus();
		return false;
	}else if(isEmpty(emailInput)){
		alert("이메일 입력 안함");
		emailInput.value ="";
		emailInput.focus();
		return false;
	}else if (isEmpty(phoneInput)) {
		alert("전화번호 입력해주세요");
		return false;
	}
	return true;
}


$(function() {
	
	// 비밀번호 확인 비동기처리~
	$("#a_pw2").keyup(function() {
		if($("#a_pw2").val() == $("#a_pw").val()){
			$("#pw2_span").text('비밀번호가 일치함').css("color", "green");
		}else{
			$("#pw2_span").text("비밀번호가 일치하지않음");
		}
	});
	
	
	
	
	
	
})