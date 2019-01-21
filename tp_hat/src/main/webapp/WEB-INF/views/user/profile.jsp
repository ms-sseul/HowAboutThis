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
<title>마이페이지</title>
</head>
<body>
	
<jsp:include page="../web/header.jsp" />

<div class="container">
	<div style="margin:6em 0 1em 0;">
	<div class="profile-background">
		<div>
			<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
			<h1>안녕하세요,</h1><h3>${userId}님</h3>
		</div>	
		<div>
			<h6>${point}포인트 보유중</h6>
			<button type="button" class="btn" data-toggle="modal" data-target="#myModal">포인트 충전</button>
		</div>
		
		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content" style="text-align: center;">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">포인트 충전</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div> 
					<!-- Modal body -->
					<div class="modal-body">
						<h5><span>충전할 금액</span></h5>
							<form action="point-charge" method="post">
							<span><input type="text" class="form-control" id="userId" name="userId" placeholder="${userId}님" readonly></span><br/>
							<span><input type="text" class="form-control" id="phone" name="phone" placeholder="${user_phone}" readonly></span><br/>
							<span><input type="number" class="form-control" id="money" name="point" placeholder="금액을 입력해주세요" required></span><br/>
							<span><button type="submit" class="btn" id="result">충전</button>
							<button type="button" class="btn" data-dismiss="modal" style="background-color: #78c2ad;">취소</button></span> <br />
						</form>
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>
</div>

<!-- 프로필 하단 탭-->

<div class="container">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link show active" data-toggle="tab" href="#home">후원한 프로젝트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link show " data-toggle="tab" href="#menu1">만든 프로젝트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link show " data-toggle="tab" href="#menu2" id="menuclick">쪽지함</a>
    </li>
    <li class="nav-item">
      <a class="nav-link show " data-toggle="tab" href="#menu3">개인정보</a>
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
     <h3 class="message-h3">쪽지함</h3>
      <a href="/controller/message/createMessage">쪽지 보내기</a>      
      <div class="message-list-ul">
      	<!-- 메시지 창 -->
      	
      </div>
		<a href="${messageUrl}">Click to enter</a>
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
			check(checkPwd);
		} else {
			checkPwd = true;
			check(checkPwd);
		}
		
	});
	
	function check(checkPwd){
		console.log('pwd:' + checkPwd);
		if(checkPwd == true) {
			console.log(checkPwd);
			btnResult.prop('disabled', false);
		}
	}
	check(checkPwd);
	
	btnResult.click(function() {
		alert("회원 정보가 수정 되었습니다.");
	});
	
})
</script>

  <input type="hidden" id="loginId" value="<%=(String)session.getAttribute("loginId")%>" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script id="message-template" type="text/x-handlebars-template">
<div class="message-item">
	<input type="text" id="mno" value="{{mno}}" />
	<input type="text" id="content" value="{{content}}" />
	<input type="text" id="sender" value="{{sender}}" />
	<input type="text" id="regDate" value="{{regDate}}" />
	<button class="btnDelete">삭제</button>
</div>
</script>


<script type="text/javascript">
$(document).ready(function(){
	console.log("EEESda");
	var source = $('#message-template').html();
	var template = Handlebars.compile(source);
	var division = $('.message-list-ul');
	var loginId = $('#loginId').val();	
	console.log('loginId: ' + loginId);
	console.log('테스트용');
	
	
	function getAllMessage(){
		$.getJSON('/controller/message/' + loginId, function(data){
			division.empty();
			
			$(data).each(function(){
			var date = new Date(this.regDate);
			var dateString = date.toLocaleDateString()+' '+date.toLocaleTimeString();
			
			var message_item = {
					mno : this.mno,
					content : this.content,
					sender : this.sender,
					regDate : dateString
			};
			var messageItem = template(message_item);
			console.log("message 값 = "+messageItem);
			division.append(messageItem);
			});
		});
	}
	
	getAllMessage();
	
	$('#menuclick').click(function() {		
		getAllMessage();		
		
	});
	
	
	
	division.on('click','.message-item .btnDelete', function(){
		var mno = $(this).prevAll('#mno').val();
		console.log(mno);
		var result = confirm(mno + '번 쪽지를 삭제 하시겠습니까?');
		if(result == true){
			$.ajax({
				type: 'delete',
				url: '/controller/message/delete/'+mno,
				headers: {
					'Content-Type': 'application/json',
					'X-HTTP-Method-Override': 'delete'
				},
				success : function(data){
					if(data == 'success'){
						alert(mno+'번 메시지 삭제 성공');
						getAllMessage();
					}
				}
			});
		} // end if
		
	});

	
});//ready end

</script>






</body>
</html>