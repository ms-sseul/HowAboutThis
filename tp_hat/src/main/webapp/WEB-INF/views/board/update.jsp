<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>

<title>게시글 수정</title>
</head>
<body>

	<jsp:include page="../web/header.jsp" />
	<div class="boardhead" style="margin: 3em;">게시글 수정</div>

	<div>
		<form action="update" method="post">
			<input type="number" name="bno" id = "bno" value="${board.bno}" readonly /> <br />
			<input type="text" name="title" value="${board.title}" required /> <br />
			<textarea name="content" id="content" rows="100" cols="100">${board.content}</textarea>
			<br /> <input type="text" name="userId" value="${board.userId}"
				readonly /> <br />
			<fmt:formatDate value="${board.regDate}"
				pattern="yyyy/MM/dd HH:mm:ss" var="regDate" />
			<input type="text" value="${regDate}" readonly /> <br /> <input
				type="submit" value="수정 완료" />
		</form>

		<button class="btn" onclick="location.href='list'" style="width: 20%" align="right">취소</button>
		<c:if test="${session.loginId} == ${board.userId}">
			<button class="btn" id="btnDel" style="width: 20%" align="right">삭제</button>
		</c:if>
	</div>

<script>
	CKEDITOR.replace('content');
	$(document).ready(function() {
		$('#btnDel').click(function() {
			var result = confirm('게시글을 삭제할까요?');
			if(result){
				self.location = "/controller/board/delete?bno=" + $('#bno').val();
			}
		});
	});
</script>


</body>
</html>