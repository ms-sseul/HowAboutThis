<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:300" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
body {
  font-family: 'Noto Sans KR', sans-serif;
}

.btn {
  background-color: #f3969a;
  outline: 0 none;
  color: #ffffff;
}

.navbar {
  background-color: #78c2ad;
  font-family: 'Black Han Sans', sans-serif; !importent;
}
.navbar .navbar-brand {
  color: #ffffff;
  font-size: x-large;
}
.navbar .navbar-brand:hover,
.navbar .navbar-brand:focus,
.nav-item:hover,
.nav-item:focus {
  color: #ffffff;
  text-decoration: none;
}

.navbar .navbar-nav .nav-link {
  color: #ffffff;
  border-radius: .25rem;
  margin: 0 0.25em;
}

.navbar .navbar-nav .nav-link {
  color: #ffffff;
  border-radius: .25rem;
  margin: 0 0.25em;
}

a:link, a:visited,
a:hover, a:active { 
	text-decoration: none;
	color: black;  
}
</style>
</head>
<body>
<!-- 상단메뉴바(고정) -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" >
		<a class="navbar-brand" href="/controller">이거어때</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMint" 
		aria-controls="navbarMint" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span></button>
		
			<div class="collapse navbar-collapse" id="navbarMint">
        	<ul class="navbar-nav mr-auto" style="font-size: large;"> 
				<li class="nav-item">
					<a class="nav-link" href="/controller/project/main">프로젝트 둘러보기</a>
				</li>
				<li class="nav-item">
				<c:if test="${not empty loginId}">
					<a class="nav-link" href="/controller/project/create">프로젝트 만들기</a>
				</c:if>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" href="/controller/board/list">커뮤니티</a>
				</li>
			</ul>
			
			<form class="form-inline my-2 my-lg-0" style="margin-right: 0.5em" action="search" method="get">
					<input class="form-control mr-sm-2" name = "keyword" type="text" placeholder="Search">
					<button class="btn my-2 my-sm-0" name="btnSearch" type="submit">Search</button>
			</form>

			<c:if test="${empty loginId}">
					<button class="btn my-2 my-sm-0" type="button" id="btn-login">로그인</button>
			</c:if>
			<c:if test="${not empty loginId}">
				<a href="/controller/user/profile" style="text-decoration:none; color: white;">
				${loginId}</a>님, 안녕하세요!
				<button class="btn my-2 my-sm-0" id="btn-logout">로그아웃</button>
			</c:if>

		</div>
    </nav>

<script>
$(document).ready(function() {
	$('#btn-logout').click(function() {
		location = '/controller/user/logout';
	});
	
	 $('#btn-login').click(function() {
		 console.log(encodeURI(location.href));
		 console.log(encodeURIComponent(location.href));
		location = '/controller/user/login?url=' + encodeURIComponent(location.href);
	});

});
</script>

</body>
</html>