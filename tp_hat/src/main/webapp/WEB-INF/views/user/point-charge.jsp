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

<title>포인트 충전 페이지</title>

<style>
.row, .btn {
	margin: 10px;
}
</style>

</head>
<body>

<h1>포인트 충전 페이지</h1>

<div class="row">
 <div class="col-lg-4 col-sm-6">
  <div class="card h-100">
    <div class="card-body">
      <div class="mt-0">
      	<span>충전할 금액</span>      
      	<span><input type="text" placeholder="금액을 입력해주세요"></span>
      	<span>point</span>
      </div>
    </div>
    
    <div class="card-footer">
    	<a class="btn btn-primary">+10,000</a>
    	<a class="btn btn-primary">+50,000</a>
    	<a class="btn btn-primary">+100,000</a>
    </div>
    
     <div class="card-footer">
    	<a class="btn btn-danger">-10,000</a>
    	<a class="btn btn-danger">-50,000</a>
    	<a class="btn btn-danger">-100,000</a>
    </div>
  </div>      
 </div>
</div>

<div class="row">
 <div class="col-md-4 mb-4">
  <div class="card h-100">
    <div class="card-body">
      <div>충전 방식</div>
      <a class="btn btn-primary">휴대폰</a>
    </div>
    
    <div class="card-footer">
    	핸드폰 번호 <input type="text">
    </div>
  </div>      
 </div>
</div>

<div class="row">
	<button>확인</button>
	<button>취소</button>
</div>

</body>
</html>