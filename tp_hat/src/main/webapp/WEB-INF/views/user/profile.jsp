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

<!-- 프로필 상단 -->

<div class="profile" style="margin:10em;">
	<div class="profile-background">
		<div>프로필 배경 이미지 </div>
		<div>프로필 이미지 </div>
		<div>"userId" 님 </div>
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
      	<form>
      	아이디 <input type="text" id="userId" placeholder="ID" disabled>
      	<br/>
      	비밀번호 <input type="password" id="userPwd" placeholder="Password" required />
		<br/>
		이메일 <input type="email" id="userEmail" placeholder="Email" required/>
		<br/>
		전화번호 <input type="number" id="phone" placeholder="Phone Number"required/>
		<br/>
		<input type="submit" value="수정완료" />
      	</form>
    </div>
  </div>
</div>

</body>
</html>