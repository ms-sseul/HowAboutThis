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
  
<title>REGISTER</title>
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

<h1>회원 가입 페이지</h1>

<form action="register" method="post">
	<input type="text" name="userId" id="userId" placeholder="아이디 입력" required/>
	<br/>
	<div id="idResult"></div>
	<br/>
	<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호 입력" required/>
	<br/>
	<div id="pwdResult"></div>
	<br/>
	<input type="email" name="userEmail" id="userEmail" placeholder="이메일 입력" required/>
	<br/>
	<div id="emailResult"></div>
	<br/>
	<input type="text" name="phone" id="phone" placeholder="전화번호 입력">
	<br/>
	<div id="phoneResult"></div>
	<br/>
	<input type="submit" name="btnResult" id="btnResult" value="가입하기"/>
	<br/>
</form>


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
			$('#idResult').html('아이디는 3자리~12자리 이하로 입력');
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
					alert("아이디가 존재합니다. 다른 아이디를 입력해 주세요");
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
			$('#pwdResult').html('아이디는 8자리~24자리 이하로 입력');
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
			$('#phoneResult').html('ex : 010-1111-1111 (-입력해주세요)');
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
			//btnResult.disabled = false;
		}
	}
	check(checkId, checkPwd, checkPhone);
	
})
</script>

</body>
</html>