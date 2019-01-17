<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title></title>
</head>
<body>


<!-- 상단메뉴바(고정) -->
<div class="topnav" id="myTopnav" style="margin-bottom: 2em">
  <nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top">
    <div class="container">
    <a class="navbar-brand" href="/controller">여기어때</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
		  	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 둘러보기</a>
				<div class="dropdown-menu">	
					<a class="dropdown-item" href="/controller/project/create">프로젝트 만들기</a> 
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
          <c:if test="${empty loginId}">
            <a class="nav-link" href="/controller/user/login">로그인</a>
          </c:if>
          <c:if test="${not empty loginId}">
          	<a href="/controller/user/profile">${loginId}</a>님, 안녕하세요!
			<button class="btn btn-sm btn-primary" id="btn-logout">로그아웃</button>
          </c:if>
          </li>
        </ul>
    </div>
  </div>
</nav>
</div>

<script>
$(document).ready(function() {
	$('#btn-logout').click(function() {
		location = '/controller/user/logout';
	});
	
	 $('#btn-login').click(function() {
		location = encodeURI('/controller/user/login?url=' + location.href);
	});

});
</script>

</body>
</html>