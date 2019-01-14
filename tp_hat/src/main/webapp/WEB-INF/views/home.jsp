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

<!-- 상단메뉴바(고정) -->
<div class="topnav" id="myTopnav">
    <nav class="navbar navbar-expand-sm navbar-dark bg-info sticky-top">
      <a class="navbar-brand" href="#">여기어때</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" 
      	aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav mr-auto">
		  <!-- navbar 메뉴 추가시 주석 해제 
		  <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Features</a>
          </li>
          -->
          <li class="nav-item dropdown">
		  	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 둘러보기</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">카테고리1</a> 
					<a class="dropdown-item" href="#">카테고리2</a> 
					<a class="dropdown-item" href="#">카테고리3</a>
				</div>
		  </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#">검색</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">로그인</a>
          </li>
        </ul>
      </div>
    </nav>
</div>

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
	<!-- url 추가 -->
	<h1><a href=""> 들어가기 </a></h1>
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
