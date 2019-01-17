<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>Project Create</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />

<h1>프로젝트 만들기</h1>

<form class="container" id = "projectForm" action="create" method="post">

  <div>
  	<div>
  		<div>프로젝트 제목</div> 
  		<div><input type="text" name = "title" required="required"/></div>
  	<div>목표 금액</div> 
  		<div><input type="number" name = "targetAmount" required="required"/>원</div>
  	<div>대표 이미지</div> 
  		<div>
	  		<input name = "uploadFiles" type="file" multiple="multiple" formenctype="multipart/form-data" />
  		</div>
  	<div>프로젝트 스토리</div>
  		<div>
  			<textarea name ="content" rows="5" cols="50"></textarea>
  		</div>
  </div>
  
  	<div>카테고리</div> 
  		<div>
  			<select id = "stepSelect" name = "category" required="required">
  				<option>프로젝트 카테고리</option>
  				<option value="1">테크 & 가전</option>
  				<option value="2">패션</option>
  				<option value="3">디자인</option>
  				<option value="4">반려동물</option>
  				<option value="5">취미</option>
  				<option value="6">소셜</option>
  			</select>
  		</div>
  		
  	<div>
  		<div>리워드 </div>
  		<div id = "reward">
  			<span>금액</span>
  			<input type="number" name="amount"/> 원
  			<span>단계</span>
  			<select name = "step" required="required">
  				<option value="1">1</option>
  				<option value="2">2</option>
  				<option value="3">3</option>
  				<option value="4">4</option>
  				<option value="5">5</option>
  			</select>
  			<br>
  			<span>상세설명</span>
  			<input type="text" name = "component" >
  		</div>
  	</div>	
  	<div id = "newReward"></div>
  		<div>
	  		<button id = "btnCreateNewReward">새 리워드 만들기</button>
	  	</div>
	  	
  	<div>프로젝트 종료일</div> 
  		<div><input id= "targetTime" type="date" name = "targetDate" placeholder="yyyy-MM-dd"/></div>
  	</div>
  	
  		<button id = "btnPrev">이전</button>
  		<input type="submit" value="만들기"/>
 
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script id="reply-template" type="text/x-handlebars-template">
<div id = "reward">
  			<span>금액</span>
  			<input type="number" name="amount"/> 원
  			<span>단계</span>
  			<select name = "step" required="required">
  				<option value="1">1</option>
  				<option value="2">2</option>
  				<option value="3">3</option>
  				<option value="4">4</option>
  				<option value="5">5</option>
  			</select>
  			<br>
  			<span>상세설명</span>
  			<input type="text" name = "component" >
  		</div>
  	</div>	
</script>
<script>
$(document).ready(function() {
	$('#btnPrev').click(function() {
		self.location = "/controller/web/main";
	});
	$('#btnCreateNewReward').click(function() {
		$('#newReward').append();
	});
});
</script>
</body>
</html>