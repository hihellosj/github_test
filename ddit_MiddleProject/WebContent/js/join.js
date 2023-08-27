function sendit() {
    let frm = document.getElementById('jo_form');
    let userid = $("#user_id").val();       // 아이디
    let userpw = $("#user_pass").val();     // 비밀번호
    let userpw_re = $("#user_pass2").val(); // 비밀번호 확인
    let userbirth = $("#user_birthday").val(); // 생년월일
    let usergender = $("input[name='user_gender']:checked").val(); // 성별
    let username = $("#user_name").val();   // 이름
    let userphone = $("#user_phone").val(); // 핸드폰
    let usermail = $("#user_mail").val();   // 이메일
	let userBirthdate = $("#user_birthday").val();

    var idchk = $("#idChkResult").html();

    if (idchk != "사용가능한 ID" || idchk == "") {
        alert("ID 중복되거나 중복체크를 하지 않았습니다!");
        $("#user_id").focus();
        return false;  // 전송 중단.
    }

    if (userpw == "") {
        alert("비밀번호를 입력하세요!");
        $("#user_pass").focus();
        return false;
    }

    if ($("#user_pass").val().length < 6 || $("#user_pass").val().length >= 12) {
        alert("패스워드는 6자 이상, 12자 미만으로 입력하세요!");
        $("#user_pass").focus();
        return false;
    }

    if (userpw != userpw_re) {
        alert("비밀번호가 일치하지 않습니다. 다시 확인하세요!");
        $("#user_pass2").focus();
        return false;
    }

    if (userbirth == "") {
        alert("생년월일을 입력하세요!");
        $("#user_birthday").focus();
        return false;
    }

	 if (checkBirthdate(userBirthdate)) {
        console.log("유효한 생년월일입니다.");
    } else {
        console.log("숫자 이외의 문자가 포함되었습니다.");
        alert("생년월일의 형식이 다릅니다. 다시확인하세요!");
		return false;
    }

    if (username == "") {
        alert("이름을 입력하세요");
        $("#user_name").focus();
        return false;
    }

    if (!userphone) {
        alert("핸드폰 번호를 입력하세요");
        $("#user_phone").focus();
        return false;
    }

    if (!usermail) {
        alert("이메일을 입력하세요");
        $("#user_mail").focus();
        return false;
    }
	

	if (isEmail(usermail)) {
        console.log("유효한 이메일입니다.");
    } else {
        console.log("메일주소형식이 다릅니다.");
        alert("이메일 형식이 다릅니다. 다시확인하세요!");
        return false;
    }
		


 	frm.submit();
}

