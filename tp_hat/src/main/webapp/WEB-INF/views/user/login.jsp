<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/user.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <title>LogIn</title>
</head>
<body style="height:1500px">

<jsp:include page="../web/header.jsp" />

<!-- Login container -->
<div class="container">
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">로그인</h5>
					<form class="form-signin" action="/controller/user/login-post" method="post">
						<div class="form-label-group">
			                <input type="text" id="inputId" class="form-control" placeholder="ID" required autofocus>
			                <label for="inputId">아이디</label>
			            </div>
			
			            <div class="form-label-group">
			                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
			                <label for="inputPassword">비밀번호</label>
			            </div>
			
			            <div class="custom-control custom-checkbox mb-3">
			                <input type="checkbox" class="custom-control-input" id="customCheck1">
			                <label class="custom-control-label" for="customCheck1">아이디 저장하기</label>
			            </div>
			              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
			              <hr class="my-4">
			              <input type="hidden" name="queryString" value="${param.queryString}" />
					    <div id="register-link" class="text-right">
							<a href="/controller/user/register" class="text-info">회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>