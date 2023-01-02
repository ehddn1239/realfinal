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