<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  
<title>포인트 충전 페이지</title>
</head>
<body>

<h1>포인트 충전 페이지</h1>

<form>
	<div>
		충전할 금액 <input type="text" placeholder="금액을 입력해주세요."> point
	</div>
	<ul>
		<li>
			<a>+1,000</a>
		</li>
		<li>
			<a>+5,000</a>
		</li>
		<li>
			<a>+10,000</a>
		</li>
	</ul>
	<div>
		<ul>
			<li>
				<label>충전 전</label>
				<span>충전 전 금액 표시</span> point
			</li>
			<li>
				<label>충전 후</label>
				<span>충전 후 금액 표시</span> point
			</li>
		</ul>
	</div>
	<div>
		<h3>결제 정보</h3>
		<div>
			<ul>
				<li>
					<a>계좌 이체</a>
					<div>
						계좌번호 <input type="text">
					</div>
				</li>
				<li>
					<a>휴대폰</a>
					<div>
						휴대폰 번호 <input type="text">
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>

</body>
</html>