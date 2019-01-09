<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>

<h1>로그인 페이지</h1>

<form action="login-post" method="post">
	<input type="text" name="userId" placeholder="아이디 입력"/>
	<br/>
	<input type="password" name="userPwd" placeholder="비밀번호 입력">
	<br/>
	<input type="submit" value="로그인">
	<input type="hidden" name="queryString" value="${targetUrl}"/>
	<br/>
</form>

</body>
</html>