<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/css/user.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>회원가입</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />

<div class="container">
	<div class="row" style="margin: 4em 0 0 0;">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card border-info card-signin my-5">
				<div class="card-body" style="border: #78c2ad 1px">
					<h5 class="card-title text-center">이거어때 회원가입</h5>
					<form class="form-group" action="register" method="post">
						<div>
							<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디 입력" required> 
							<label class="form-control-label" id="idResult"></label> 
							
							<input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="비밀번호 입력" required /> 
							<label class="form-control-label" id="pwdResult"></label> 
							
							<input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="이메일 입력" required /> 
							<label class="form-control-label" id="emailResult"></label> 
							
							<input type="text" class="form-control" name="phone" id="phone" placeholder="전화번호 입력"> 
							<label class="form-control-label" id="phoneResult"></label>
						</div>
						<hr class="my-4">
						<button class="btn btn-lg btn-block" id="btnResult" type="submit">회원가입</button>
						<button class="btn btn-lg btn-block" onclick="location.href='login'" style="background-color: #78c2ad;">로그인</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
$(document).ready(function () {
	// 아이디 중복 검사 체크
	// 다른거 정규식 체크
	var checkId = false;
	var checkPwd = false;
	var checkPhone = false;
	var btnResult = $('#btnResult');
	
	btnResult.attr("disabled", "disabled");
	
	var id = /^[a-zA-Z0-9가-힣_]{3,12}$/
	$('#userId').blur(function() {
		var userId = $('#userId').val();
		var result = id.test(userId);
		console.log("userId = " + userId);
		console.log("id = " + result);
		if (result == false) {
			$('#idResult').html('아이디는 3~12자리 사이로 입력해주세요.');
			$('#idResult').css('color', 'red');
			checkId = false;
			btnResult.attr("disabled", "disabled");
			check(checkId, checkPwd, checkPhone);
		} else {
			$.ajax({
				type: 'post',
				url: "idcheck",
				data: {userId: userId},
				contentType: 'application/x-www-form-urlencoded',
				success: function(res) {
				if (res == 'success') {
					alert("이미 존재하는 아이디입니다. 다른 아이디를 입력해 주세요");
					checkId = false;
					btnResult.attr("disabled", "disabled");
					check(checkId, checkPwd, checkPhone);
				} else {
					alert("사용가능한 아이디 입니다.");
					checkId = true;
					check(checkId, checkPwd, checkPhone);
				}
			}
		});
		}
	});
	
	$('#userPwd').change(function() {
		var userPwd = $('#userPwd').val();
		var pw = /^[a-zA-Z0-9가-힣_]{8,24}$/
		var result = pw.test(userPwd);
		console.log("pw = " + result);
		if(result == false){
			$('#pwdResult').html('비밀번호는 8~24자리 사이로 입력해주세요.');
			$('#pwdResult').css('color', 'red');
			checkPwd = false;
			btnResult.attr("disabled", "disabled");
			check(checkId, checkPwd, checkPhone);
		} else {
			checkPwd = true;
			check(checkId, checkPwd, checkPhone);
		}
		
	});
	
	$('#phone').change(function() {
		var userPhone = $('#phone').val();
		var ph = /^010-[0-9]{4}-[0-9]{4}$/
		var result = ph.test(userPhone);
		console.log("phone = " + result);
		if(result == false) {
			$('#phoneResult').html('형식에 맞게 입력해주세요 (예) 010-1111-1111');
			$('#phoneResult').css('color', 'red');
			checkPhone = false;
			btnResult.attr("disabled", "disabled");
			check(checkId, checkPwd, checkPhone);
		} else {
			checkPhone = true;
			check(checkId, checkPwd, checkPhone);
		}
	});
	
	function check(checkId, checkPwd, checkPhone){
		console.log('id:' + checkId + ', pwd:' + checkPwd + ', phone:' + checkPhone);
		if(checkId == true && checkPwd == true && checkPhone == true) {
			console.log(checkId, checkPwd, checkPhone);
			btnResult.prop('disabled', false);
		}
	}
	check(checkId, checkPwd, checkPhone);
	
	$('#btnResult').click(function() {
		alert('인증 메일이 발송 되었습니다. 이메일을 확인해 주세요');
	});
	
})
</script>

</body>
</html>