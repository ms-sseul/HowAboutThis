<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 상단메뉴바(고정) -->
<div class="topnav" id="myTopnav">
    <nav class="navbar navbar-expand-sm navbar-dark bg-info fixed-top">
      <a class="navbar-brand" href="/controller">여기어때</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" 
      	aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav mr-auto"> 
		  <li class="nav-item active">
            <a class="nav-link" href="/controller/project/main">프로젝트 <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/controller/project/create">프로젝트 만들기</a>
          </li>
          <li class="nav-item dropdown">
			<a class="nav-link" href="/controller/board/list">커뮤니티</a>
		  </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#">검색</a>
          </li>
          <li class="nav-item">
          <c:if test="${empty loginId}">
            <!-- <a class="nav-link" href="/controller/user/login">로그인</a> -->
            <button type="button" id="btn-login">로그인</button>
          </c:if>
          <c:if test="${not empty loginId}">
          	<a href="/controller/user/profile">${loginId}</a>님, 안녕하세요!
			<button id="btn-logout">로그아웃</button>
          </c:if>
          </li>
        </ul>
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