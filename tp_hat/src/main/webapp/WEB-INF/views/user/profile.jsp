<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>

.clearfix {
  overflow: auto;
}
.img {
  float: left;
}
</style>

<title>마이페이지</title>
</head>
<body>
	
<jsp:include page="../web/header.jsp" />

<div class="container">
	<div style="margin:6em 0 1em 0;">
	<div class="clearfix">
		<div>
			<img class="d-flex mr-3 rounded-circle img" src="../resources/images/category/all.jpg" style="width:150px;">
			<h1>안녕하세요,</h1><h3>${user.userId}님!</h3>
			<h6><fmt:formatNumber value="${user.point}" groupingUsed="true" /> 포인트 보유중</h6>
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
							<span><input type="text" class="form-control" id="userId" name="userId" placeholder="${user.userId}님" readonly></span><br/>
							<span><input type="text" class="form-control" id="phone" name="phone" placeholder="${user.phone}" readonly></span><br/>
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
      <a class="nav-link show active" data-toggle="tab" href="#home">후원프로젝트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link show " data-toggle="tab" href="#menu1">내프로젝트</a>
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
      <c:forEach items="${myProjects}" var="myProject">
      <p><a href = "/controller/project/description?pno=${myProject.pno}">${myProject.title}</a></p>
      </c:forEach>
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
     <h3 class="message-h3">받은쪽지함</h3>
      <div class="message-list-ul">
      	<!-- 메시지 창 -->
      	
      </div>
      <a href="/controller/message/createMessage">쪽지 보내기</a>    
    </div>
    
	<div id="menu3" class="container tab-pane fade"><br>
		<h3>기본 정보 설정</h3>
		<div class="container">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<form class="form-signin" action="profile" method="post">
				
			      	<label class="form-control-label" id="idResult">아이디</label>
			      	<input type="text" class="form-control" id="userId" name="userId" value="${loginId}" readonly>
			      	
					<label class="form-control-label" id="pwdResult">비밀번호</label> 
			      	<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호" required />
					
					<label class="form-control-label" id="emailResult">이메일 </label> 
					<input type="email" class="form-control" id="userEmail" name="userEmail" value="${user.userEmail}" placeholder="이메일" required/>
	
					<label class="form-control-label" id="phoneResult">전화번호</label>
					<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" placeholder="전화번호"required/>
					
					<label></label>
					<button class="btn btn-lg btn-block" type="submit" name="btnResult" id="btnResult">수정</button>
				</form>
		</div>
</div>
</div>
</div>


<script>
$(document).ready(function () {
	
	$('#money').change(function() {
		var templet = /^[0-9]+$/
		var money = $('#money').val();
		if(!templet.test(money)) {	
			alert('양수만 입력해 주세요');
			$(this).val(0);
		}
	});
	
	var checkPwd = false;
	var btnResult = $('#btnResult');
	
	btnResult.attr("disabled", "disabled");
	
	$('#userPwd').change(function() {
		var userPwd = $('#userPwd').val();
		var pw = /^[a-zA-Z0-9가-힣_]{8,24}$/
		var result = pw.test(userPwd);
		console.log("pw = " + result);
		if(result == false){
			$('#emailResult').html('비밀번호는 8자리~24자리 이하로 입력');
			$('#emailResult').css('color', 'red');
			checkPwd = false;
			btnResult.attr("disabled", "disabled");
			check(checkPwd);
		} else {
			$('#emailResult').html('이메일');
			$('#emailResult').css('color', 'black');
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
	<input type="hidden" id="mno" value="{{mno}}" />
	<input type="text" id="title" value="{{title}}" readonly />
	<input type="text" id="content" value="{{content}}" readonly />
	<input type="text" id="sender" value="{{sender}}" readonly />
	<input type="text" id="regDate" value="{{regDate}}" readonly />
	<button class="btnDelete">삭제</button>
	<button class="btnsender">쪽지보내기</button>
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
					title : this.title,
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
	
	division.on('click','.message-item .btnsender', function(){
		var mno = $(this).prevAll('#mno').val();
		var sender = $(this).prevAll('#sender').val();
		var reciever = $('#loginId').val();
		self.location = '/controller/message/createMessage?reciever='+sender;
				
		
		
	});

	
	
	
});//ready end

</script>
</body>
</html>