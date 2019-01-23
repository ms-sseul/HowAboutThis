<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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
input {
	margin: 10px;
}

#btnCan {
  background-color: #78c2ad;
  color: #ffffff;
}
</style>

<title>쪽지 보내기</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />
<div class="container">
	<div class="col-sm-8" style="margin: 5em 0 1em 0;">
		<input type="hidden" id="loginId"
			value="<%=(String) session.getAttribute("loginId")%>" />

		<form class="form-group" action="createMessage" method="post">
			<div class="mx-auto alert alert-dismissible alert-info">
				<input type="text" class="form-control" id="title" name="title"
					placeholder="제목입력" required /> <br />
				<textarea rows="5" class="form-control" cols="80" id="content"
					name="content" required></textarea>
				<br /> <input type="text" class="form-control" id="sender"
					name="sender" value="${loginId}" placeholder="${loginId}" readonly />
				<br />
				<c:if test="${empty param.reciever}">
					<input type="text" class="form-control" name="reciever"
						id="reciever" placeholder="받는 사람" required />
					<br />
				</c:if>
				<c:if test="${not empty param.reciever}">
					<input name="reciever" id="reciever" type="text"
						value="${param.reciever}" readonly="readonly" />
					<br />
				</c:if>
				<button type="submit" class="btn save">보내기</button>
				<button type="button" class="btn " onclick="location.href='/controller/user/profile'" id="btnCan">취소</button>
			</div>
		</form>
	</div>
</div>

</body>
</html>