<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

</body>
</html>