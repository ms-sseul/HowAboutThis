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
  
<title>리워드</title>

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

<h1>리워드</h1>

<form class="col-sm-9 col-md-7 col-lg-5 mx-auto alert alert-dismissible alert-info" id = "projectForm" action="createReward" method="post">
  	<input type="hidden" name = "pno" value="${pno}"/>
  	<div id="rew1" class="row">
  		<div class="col-lg-4 col-sm-6">리워드 </div>  		
  		<div id = "reward">
  			<span class="col-lg-4 col-sm-6">금액</span>
  			<input type="number" name="amount"/> 원
  			<input style="width: 30px; text-align: center;" type="text" name="step" value="1" readonly/>단계
  			<br/>
  		<div>	
  			<span class="col-lg-4 col-sm-6">상세설명</span>
  			<input type="text" name = "component" >
  		</div>
  		<hr/>
  		</div>
  	</div>
  	
  	  	<div id="rew2" class="row">
  		<div class="col-lg-4 col-sm-6">리워드 </div>  		
  		<div id = "reward">
  			<span class="col-lg-4 col-sm-6">금액</span>
  			<input type="number" name="amount"/> 원
  			<input style="width: 30px; text-align: center;" type="number" name="step" value="2" readonly/>단계
  			<br/>
  		<div>	
  			<span class="col-lg-4 col-sm-6">상세설명</span>
  			<input type="text" name = "component" >
  		</div>
  		<hr/>
  		</div>
  	</div>
  	
  	  	<div id="rew3" class="row">
  		<div class="col-lg-4 col-sm-6">리워드 </div>  		
  		<div id = "reward">
  			<span class="col-lg-4 col-sm-6">금액</span>
  			<input type="number" name="amount"/> 원
  			<input style="width: 30px; text-align: center;" type="text" name="step" value="3" readonly/>단계
  			<br/>
  		<div>	
  			<span class="col-lg-4 col-sm-6">상세설명</span>
  			<input type="text" name = "component" >
  		</div>
  		<hr/>
  		</div>
  	</div>
  	<input type="submit" value="만들기" />
	
</form>
  	<div id = "newReward"></div>
  		<div class="col-lg-4 col-sm-6">
	  		<button id = "btnCreateNewReward">새 리워드 만들기</button>
	  	</div>
	<hr/>

<script>
$(document).ready(function() {
	
	$('#rew2').hide();
	$('#rew3').hide();
	
	var id = 1;
	
	$('#btnCreateNewReward').click(function() {
		id++;
		if(id < 4){
			$('#rew'+id).show();
		}
	});
	
});
</script>

</body>
</html>