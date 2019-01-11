<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

<h1>회원 가입 페이지</h1>

<form action="register" method="post">
	<input type="text" name="userId" id="userId" placeholder="아이디 입력" required/>
	<br/>
	<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호 입력" required/>
	<br/>
	<input type="email" name="userEmail" id="userEmail" placeholder="이메일 입력" required/>
	<br/>
	<input type="text" name="phone" id="phone" placeholder="전화번호 입력">
	<br/>
	<input type="submit" id="btnResult" value="가입하기"/>
	<br/>
</form>

<script>
$(document).ready(function () {
	
	// 아이디 중복 검사 체크
	// 다른거 정규식 체크 
	$('#userId').blur(function() {
		$.ajax({
			type: 'post',
			url: "idcheck",
			data: {userId: $('#userId').val()},
			contentType: 'application/x-www-form-urlencoded',
			success: function(res) {
				if (res == 'success') {
					alert("아이디가 존재합니다. 다른 아이디를 입력해 주세요");
				} else {
					alert("사용가능한 아이디 입니다.");
				}
			}
		});
		
	});
	
	
	
})
</script>

</body>
</html>