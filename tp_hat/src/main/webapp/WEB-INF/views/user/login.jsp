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
<style>
#register-link,
#findPwd {
	background-color: #78c2ad;
}
</style>

<title>로그인</title> 
</head>
<body>

<jsp:include page="../web/header.jsp" />

<div class="container">
	<div class="row" style="margin: 4em 0 0 0;">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card border-info card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">로그인</h5> 
					<form class="form-group" action="/controller/user/login-post" method="post">
					
						<div>
							<input type="text" class="form-control" id="userId" name="userId" placeholder="ID" autofocus>
							<label class="form-control-label"></label>
							<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Password" >
							<label class="form-control-label"></label>
						</div>
							<button class="btn btn-block" id="btnResult" type="submit">로그인</button>
							<hr class="my-4">
							<input type="hidden" name="queryString" value="${targetUrl}" />
						
						<div class="text-right">
						<button type="button" class="btn float-left" id="register-link" onclick="location='/controller/user/register'" >회원가입</button>
						<button type="button" class="btn" id="findPwd">비밀번호 찾기</button>
						</div>
					</form>
				</div>
			</div>
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
						// alert('아이디 확인 완료');
						checkId = true;
						check(checkId, checkPwd);
					} else {
						// alert('존재하지 않는 아이디 입니다.');
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
						// alert('비밀번호 확인 완료');
						checkPwd = true;
						check(checkId, checkPwd);
					} else {
						// alert('비밀번호가 다릅니다.');
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