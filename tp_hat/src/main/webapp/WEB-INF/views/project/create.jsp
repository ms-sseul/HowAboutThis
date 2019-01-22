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

<style>
.row {
	margin: 10px;
}

form {
	border: 1px solid;
}
</style>

</head>
<body>

<jsp:include page="../web/header.jsp" />

<h1>프로젝트 만들기</h1>

<form class="col-sm-9 col-md-7 col-lg-5 mx-auto alert alert-dismissible alert-info" id = "projectForm" action="create" method="post">

  <div class="container">
  	<div class="row">
  		<div class="col-lg-4 col-sm-6">프로젝트 제목</div> 
  		<div>
  		 <input type="text" name = "title" required="required"/>
  		</div>
  	</div>
  	<hr/>
  	
  	<div class="row">
  	<div class="col-lg-4 col-sm-6">목표 금액</div> 
  		<div>
  		 <input type="number" name = "targetAmount" required="required"/> 
  		 <span>원</span>
  		</div>
  	</div>
  	<hr/>
  	
  	<div class="row">
  	<div class="col-lg-4 col-sm-6">대표 이미지</div> 
  		<div>
	  		<input name = "uploadFiles" type="file" multiple="multiple" formenctype="multipart/form-data" />
  		</div>
  	</div>
  	<hr/>
  	
  	<div class="row">
  	<div class="col-lg-4 col-sm-6">프로젝트 스토리</div>
  		<div>
  			<textarea name ="content" rows="5" cols="50"></textarea>
  		</div>
    </div>
    <hr/>
  
    <div class="row">
  	<div class="col-lg-4 col-sm-6">카테고리</div> 
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
  	</div>
  	<hr/>
	
	<div class="row">  	
  	<div class="col-lg-4 col-sm-6">프로젝트 종료일</div> 
  		<div><input id= "targetTime" type="date" name = "targetDate" placeholder="yyyy-MM-dd"/></div>
  	</div>	
  	<hr/>
  </div>
  
  	<div class="row">
  		<button style="margin: 5px;" id = "btnPrev">이전</button>
  		<input class="save" style="margin: 5px;" type="submit" value="다음"/>
  	</div>
 
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
		$('#rew').clone().appendTo(".rewardList");
		
		$('#test').empty();
		
		var i = 1;
		while(i <= 5) {
			i++;
			$('<option value="' + i + '">' + i + '</option>').appendTo('#test');
		}
	});
});
</script>

</body>
</html>