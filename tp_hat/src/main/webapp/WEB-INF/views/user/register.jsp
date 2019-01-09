<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>

<h1>회원 가입 페이지</h1>

<form action="register" method="post">
	<input type="text" name="userId" placeholder="아이디 입력" required/>
	<br/>
	<input type="password" name="userPwd" placeholder="비밀번호 입력" required/>
	<br/>
	<input type="email" name="userEmail" placeholder="이메일 입력" required/>
	<br/>
	<input type="text" name="phone" placeholder="전화번호 입력">
	<br/>
	<input type="submit" value="가입하기"/>
	<br/>
</form>


</body>
</html>