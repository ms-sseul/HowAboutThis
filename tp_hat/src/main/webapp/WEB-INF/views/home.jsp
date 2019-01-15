<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  
<title>HOME</title>
</head>
<body>

<jsp:include page="web/header.jsp" />

<h1>
	메인 페이지 
</h1>
<P>  현재 시간 : ${serverTime}. </P>

<ul>
	<li><a href="user/register">회원가입</a></li>
	<li><a href="web/main">홈페이지</a></li>
</ul>

<!-- content : 들어가기 → 변경예정 -->
<div class="container" style="margin:10em;">
	<h1><a href="web/main"> 들어가기 </a></h1>
</div>

<c:if test="${empty loginId}">
<form action="user/login-post" method="post">
	<input type="text" name="userId" placeholder="아이디" required />
	<input type="password" name="userPwd" placeholder="비밀번호 입력" required />
	<input type="submit" value="로그인" />
	<input type="hidden" name="queryString" value="https://localhost:8443/controller/"/>
</form>
</c:if>
<c:if test="${not empty loginId}">
	${loginId}님, 안녕하세요!
	<button id="btn-logout">로그아웃</button>
</c:if>
<c:if test="${not empty certyResult}">
	<script >
		alert("메일인증이 완료되지 않았습니다. 메일 인증 후 다시 로그인 해주세요");
	</script>
</c:if>

<hr/>

<script>
$(document).ready(function() {
	$('#btn-logout').click(function() {
		location = 'user/logout';
	});
});
</script>



</body>
</html>
