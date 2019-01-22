<%@ page language="java" contentType="text/html; charset=EUC-KR"
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

<form class="col-sm-9 col-md-7 col-lg-5 mx-auto alert alert-dismissible alert-info" id = "projectForm" action="create" method="post">
<div class="rewardList"></div>
  	<div id="rew" class="row">
  		<div class="col-lg-4 col-sm-6">리워드 </div>  		
  		<div id = "reward">
  			<span class="col-lg-4 col-sm-6">금액</span>
  			<input type="number" name="amount"/> 원
  			<input style="width: 30px; text-align: center;" 
  				id="test" type="text" name="step" value="1" readonly/>단계
  			<br/>
  		<div>	
  			<span class="col-lg-4 col-sm-6">상세설명</span>
  			<input type="text" name = "component" >
  		</div>
  		<hr/>
  		</div>
  	</div>
  	
  	<div id = "newReward"></div>
  		<div class="col-lg-4 col-sm-6">
	  		<button id = "btnCreateNewReward">새 리워드 만들기</button>
	  	</div>
	<hr/>
	
</form>

<script>
$('#btnCreateNewReward').click(function() {
	
	var red = $('#test').val();
	red = (Number(red) + 1);
	
	if($('#test').val() < 3) {
		$('#test').val(red);
		$('#rew').clone().appendTo(".rewardList");
	}
			
});
</script>

</body>
</html>