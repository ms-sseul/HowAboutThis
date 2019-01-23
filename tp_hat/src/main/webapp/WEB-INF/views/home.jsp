<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
img {
	max-width:100%; height:auto; cursor: pointer;
}

@media ( max-width: 480px ) {
	img {
		max-height:auto; cursor: pointer;
	}
}

</style>
<title>HOME</title>
</head>
<body>

<jsp:include page="web/header.jsp" />

<img Onclick="location='/controller/project/main'" 
 src="https://images.pexels.com/photos/1449080/pexels-photo-1449080.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260">

<c:if test="${not empty certyResult}">
	<script >
		alert("메일인증이 완료되지 않았습니다. 메일 인증 후 다시 로그인 해주세요");
	</script>
</c:if>

<script>
$(document).ready(function() {
	$('#btn-logout').click(function() {
		location = 'user/logout';
	});
});
</script>

</body>
</html>
