<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<h1>emailConfirm 페이지</h1>
<% 
	request.getSession().removeAttribute("certyResult");
%>
<script>
	var userId = '${user_Id}';
	
	alert(userId + '님 회원가입을 축하합니다. 이제 로그인이 가능 합니다.');
	
	window.open('', '_self', '');
	self.location = '/controller/';
	
</script>

</body>
</html>