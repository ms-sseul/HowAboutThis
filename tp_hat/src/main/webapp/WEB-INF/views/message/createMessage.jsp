<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="profile">마이페이지로 돌아가기</a>

	<input type="hidden" id="loginId"
		value="<%=(String) session.getAttribute("loginId")%>" />


	<form action="createMessage" method="post">
		<input type="text" id="title" name="title" placeholder="제목입력" required />
		<br /> 
		<textarea rows="5" cols="80" id="content" name="content" required></textarea>
		<br />
		<input type="text" id="sender"
			name="sender" value="${loginId}" placeholder="${loginId}" readonly />
		<br /> 
		<input name="reciever" id="reciever" type="text"
			placeholder="보내는 사람 입력" required /> 
			<br />
		
		<input type="submit" value="보내기" class="btn" />		

	</form>

<script>
$(document).ready(function(){
	if('${createMessage}' == 'success'){
		alert('쪽지 보내기 성공');
	}
});


</script>



</body>
</html>