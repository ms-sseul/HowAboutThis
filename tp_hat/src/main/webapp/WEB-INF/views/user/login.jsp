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
	<div class="container" style="margin-top: 5em">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<!-- <div class="card card-signin my-5">
					<div class="card-body">-->	
						<h5 class="card-title text-center">로그인</h5>  
						<form action="/controller/user/login-post" method="post">
							<div class="form-label-group">
								<input type="text" id="userId" name="userId" placeholder="ID" required autofocus>
							</div>

							<div class="form-label-group">
								<input type="password" id="userPwd" name="userPwd" placeholder="Password" required> 
							</div>

							<!-- <div class="custom-control custom-checkbox mb-3">
			                <input type="checkbox" class="custom-control-input" id="userCookie" name="userCookie">
			                <label class="custom-control-label" for="customCheck1">로그인 유지하기</label>
			            </div> -->

							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								id="btnResult" type="submit">로그인</button>
							<hr class="my-4">
							<input type="hidden" name="queryString" value="${targetUrl}" />
							<div id="register-link" class="text-right">
								<a href="/controller/user/register" class="text-info">회원가입</a>
							</div>
							<div id="find-password" class="text-left">
								<button type="button" id="findPwd">비밀번호 찾기</button>
							</div>
						</form>
					</div>
				</div>
			</div>


	<script>
		$(document).ready(function() {
			$('#findPwd').click(function() {
				var result = confirm('비밀번호 찾기를 시작하시겠습니까??');
				if (result) {
					location = "find-password";
				}
			});

			var checkId = false;
			var checkPwd = false;
			var btnResult = $('#btnResult');

			btnResult.attr("disabled", "disabled");

			$('#userId').change(function() {

				var userId = $('#userId').val();
				$.ajax({
					type : 'post',
					url : "idcheck",
					data : {
						userId : userId
					},
					contentType : 'application/x-www-form-urlencoded',
					success : function(res) {
						if (res == 'success') {
							alert('아이디 확인 완료');
							checkId = true;
							check(checkId, checkPwd);
						} else {
							alert('존재하지 않는 아이디 입니다.');
							checkId = false;
							check(checkId, checkPwd);
						}
					}
				});
			});

			$('#userPwd').change(function() {
				var userId = $('#userId').val();
				var userPwd = $('#userPwd').val();
				$.ajax({
					type : 'post',
					url : "pwdCheck",
					data : {
						'userId' : userId,
						'userPwd' : userPwd
					},
					contentType : 'application/x-www-form-urlencoded',
					success : function(res) {
						if (res == 'success') {
							alert('비밀번호 확인 완료');
							checkPwd = true;
							check(checkId, checkPwd);
						} else {
							alert('비밀번호가 다릅니다.');
							checkPwd = false;
							check(checkId, checkPwd);
						}
					}
				});
			});

			function check(checkId, checkPwd) {
				console.log('id:' + checkId + ', pwd:' + checkPwd);
				if (checkId == true && checkPwd == true) {
					console.log(checkId, checkPwd);
					btnResult.prop('disabled', false);
				} else {
					btnResult.attr("disabled", "disabled");
				}
			}
			check(checkId, checkPwd);

		});
	</script>


</body>
</html>