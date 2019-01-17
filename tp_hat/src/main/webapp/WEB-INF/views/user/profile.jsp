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
<title>PROFILE</title>
</head>
<body>
	<jsp:include page="../web/header.jsp" />
<!-- 프로필 상단 -->

<div class="profile" style="margin:10em;">
	<div class="profile-background">
		<div>프로필 배경 이미지 </div>
		<div>프로필 이미지 </div>
		<div><h6>${userId}님</h6></div>	
		<div><h6>${point}포인트 보유중</h6></div>
		<a href="/controller/user/point-charge">포인트 충전</a>
	</div>

</div>

<!-- 프로필 하단 탭-->

<div class="container">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">후원한 프로젝트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">만든 프로젝트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">쪽지함</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu3">개인정보</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <h3>후원한 프로젝트</h3>
      <p>후원한 프로젝트 1</p>
      <p>후원한 프로젝트 2</p>
      <p>후원한 프로젝트 3</p>
      <p>후원한 프로젝트 4</p>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
      <h3>만든 프로젝트</h3>
      <p>만든 프로젝트 </p>
      <p>만든 프로젝트 </p>
      <p>만든 프로젝트 </p>
      <p>만든 프로젝트 </p>
      <p>만든 프로젝트 </p>
      <p>만든 프로젝트 </p>
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <h3>쪽지함</h3>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
      <p>받은 쪽지함</p>
    </div>
    <div id="menu3" class="container tab-pane fade"><br>
      <h3>개인정보 수정 페이지</h3>
      	<form action="profile" method="post">
      	아이디 <input type="text" id="userId" name="userId" value="${loginId}" readonly>
      	<br/>
      	비밀번호 <input type="password" id="userPwd" name="userPwd" placeholder="Password" required />
		<br/>
		<div id="pwdResult"></div>
		<br/>
		이메일 <input type="email" id="userEmail" name="userEmail" value="${user_email}" placeholder="Email" required/>
		<br/>
		<div id="emailResult"></div>
		<br/>
		전화번호 <input type="text" id="phone" name="phone" value="${user_phone}" placeholder="Phone Number"required/>
		<br/>
		<div id="phoneResult"></div>
		<br/>
		<!-- 개인정보 수정 (=DB 업데이트) 추가해주세요 -->
		<input type="submit" name="btnResult" id="btnResult" value="수정완료" />
      	</form>
    </div>
  </div>
</div>

<script>
$(document).ready(function () {
	
	
	
	var checkPwd = false;
	var checkPhone = false;
	var btnResult = $('#btnResult');
	
	btnResult.attr("disabled", "disabled");
	
	$('#userPwd').change(function() {
		var userPwd = $('#userPwd').val();
		var pw = /^[a-zA-Z0-9가-힣_]{8,24}$/
		var result = pw.test(userPwd);
		console.log("pw = " + result);
		if(result == false){
			$('#pwdResult').html('아이디는 8자리~24자리 이하로 입력');
			$('#pwdResult').css('color', 'red');
			checkPwd = false;
			btnResult.attr("disabled", "disabled");
			check(checkPwd, checkPhone);
		} else {
			checkPwd = true;
			check(checkPwd, checkPhone);
		}
		
	});
	
	$('#phone').change(function() {
		var userPhone = $('#phone').val();
		var ph = /^010-[0-9]{4}-[0-9]{4}$/
		var result = ph.test(userPhone);
		console.log("phone = " + result);
		if(result == false) {
			$('#phoneResult').html('ex : 010-1111-1111 (-입력해주세요)');
			$('#phoneResult').css('color', 'red');
			checkPhone = false;
			btnResult.attr("disabled", "disabled");
			check(checkPwd, checkPhone);
		} else {
			checkPhone = true;
			check(checkPwd, checkPhone);
		}
	});

	function check(checkPwd, checkPhone){
		console.log('pwd:' + checkPwd + ', phone:' + checkPhone);
		if(checkPwd == true && checkPhone == true) {
			console.log(checkPwd, checkPhone);
			btnResult.prop('disabled', false);
			//btnResult.disabled = false;
		}
	}
	check(checkPwd, checkPhone);
	
	btnResult.click(function() {
		alert("회원 정보가 수정 되었습니다.");
	});
	
})
</script>




</body>
</html>