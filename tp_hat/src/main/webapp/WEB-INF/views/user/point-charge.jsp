<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">
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
<jsp:include page="../web/header.jsp" />

<div class="container">
	<div class="row" style="margin-top: 4em;">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card h-100">
				<div class="card-body">
					<div class="mt-0">
						<span>충전할 금액</span>
						<form action="point-charge" method="post">
							<span><input type="text" id="userId" name="userId"
								placeholder="${userId}님" readonly></span> <br /> <span><input
								type="text" id="phone" name="phone" placeholder="${phone}"
								readonly></span> <br /> <span><input type="number"
								id="money" name="point" placeholder="금액을 입력해주세요" required></span>
							<br /> <span><input type="submit" id="result"
								value="충전 완료"></span> <br />
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>

</body>
</html>