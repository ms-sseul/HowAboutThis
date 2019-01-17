<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>LogIn</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />

<h1>로그인 페이지</h1>
<!-- Login container -->
<div class="logincontainer">
	<form action="/controller/user/login-post" method="post">
		<div class="form-label-group">
			<label for="inputId">아이디</label>
				<input type="text" name="userId" placeholder="아이디 입력" class="form-control" required autofocus>
		</div>
		<div class="form-label-group">
			<label for="inputPassword">비밀번호</label>
				<input type="password" name="userPwd" placeholder="비밀번호 입력" class="form-control" placeholder="Password" required>
		</div>
		<div class="custom-control custom-checkbox mb-3">
			<input type="checkbox" class="custom-control-input" id="userCookie" name="userCookie">
                <label class="custom-control-label" for="customCheck1">로그인 유지하기</label>
		</div>
		<input type="submit" value="로그인">
		<hr class="my-4">
		<input type="hidden" name="queryString" value="${targetUrl}"/>
		<div id="register-link" class="text-right">
			  <a href="/controller/user/register" class="text-info">회원가입</a>
			  
		</div>
	</form>   

</div>
</body>
</html>