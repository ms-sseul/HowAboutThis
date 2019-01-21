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

<h1>password-emailConfirm 페이지</h1>
<% 
	request.getSession().removeAttribute("certyResult");
%>
<script>
	var userId = '${user_Id}';
	var userEmail = '${user_email}';
	alert(userId + '님 이제 비밀번호 변경이 가능 합니다. 개인정보 클릭 후 변경할 비밀번호 입력해주세요!');
	
	window.open('', '_self', '');
	self.location = '/controller/';
	
</script>

</body>
</html>