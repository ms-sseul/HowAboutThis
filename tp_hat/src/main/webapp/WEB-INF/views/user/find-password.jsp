<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 <title>find-password</title>
</head>
<body style="height:1500px">

<jsp:include page="../web/header.jsp" />

<!-- Login container -->
<div class="container" style="margin-top: 2em">
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">비밀번호 찾기</h5>
					<form class="form-signin" action="/controller/user/find-password" method="post">
						<div class="form-label-group">
			                <input type="text" id="userId" name="userId" class="form-control" placeholder="ID" required autofocus>
			                <label for="inputId">아이디</label>
			            </div>
						<div class="form-label-group">
			                <input type="email" id="userEmail" name="userEmail" class="form-control" placeholder="Email" required>
			                <label for="inputPassword">이메일</label>
			            </div>
			            <button class="btn btn-lg btn-primary btn-block text-uppercase" id="btnResult" type="submit">이메일 인증하기</button>
			              <hr class="my-4">
					</form>
</div></div></div></div>
</div>

<script>
$(document).ready(function() {
	
	var checkId = false;
	var checkEmail = false;
	var btnResult = $('#btnResult');
	
	btnResult.attr("disabled", "disabled");
	
	$('#userId').change(function() {
		
	var userId = $('#userId').val();
		$.ajax({
			type: 'post',
			url: "idcheck",
			data: {userId: userId},
			contentType: 'application/x-www-form-urlencoded',
			success: function(res) {
				if(res == 'success') {
					alert('아이디 확인 완료');
					checkId = true;
					check(checkId, checkEmail);
				} else {
					alert('존재하지 않는 아이디 입니다.');
					checkId = false;
					check(checkId, checkEmail);
				}
			}
		});
	});
	
	$('#userEmail').change(function() {
		var userId = $('#userId').val();
		var userEmail = $('#userEmail').val();
		$.ajax({
			type: 'post',
			url: "emailcheck",
			data: {'userId': userId, 'userEmail': userEmail},
			contentType: 'application/x-www-form-urlencoded',
			success: function (res) {
				if(res == 'success') {
					alert('이메일 확인 완료');
					checkEmail = true;
					check(checkId, checkEmail);
				} else {
					alert('존재하지 않는 이메일 입니다.');
					checkEmail = false;
					check(checkId, checkEmail);
				}
			}
		});
	});
	
	function check(checkId, checkEmail){
		console.log('id:' + checkId + ', pwd:' + checkEmail);
		if(checkId == true && checkEmail == true) {
			console.log(checkId, checkEmail);
			btnResult.prop('disabled', false);
		} else {
			btnResult.attr("disabled", "disabled");
		}
	}
	check(checkId, checkEmail);
	
	$('#btnResult').click(function() {
		alert('임시 비밀번호가 이메일로 발송 되었습니다. 이메일을 확인해 주세요');
	});
	
})
</script>



</body>
</html>