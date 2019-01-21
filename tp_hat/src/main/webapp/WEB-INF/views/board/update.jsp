<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../resources/css/board.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>게시글 수정</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />
<div class="container col-lg-10 col-sm-8">
	<fieldset>
	<div class="table-responsive-lg" style="margin: 5em;">
		<form class="form-group" action="update" method="post" id="form">
			<table class="table" text-align="center">
				<tr>
					<td>
					<h3>[${board.bno}] ${board.title}</h3>
					<input type="hidden" id="bno" name="bno" value="${board.bno}">
					<input type="hidden" id="userId" name="userId" value="${loginId}">
					<input type="hidden" id="title" name="title" value="${board.title}">
					</td>
				</tr>
				<tr>
					<td>
					<div class="form-group">
					<textarea class="form-control" id="exampleTextarea" rows="20" name="content" id="content" 
					placeholder="내용을 입력하세요" required>${board.content}</textarea>
					</div>
				</tr>
				<tr>
					<td align="right">
						<button type="submit" class="btn " id="btnResult" style="margin-right: 0.5em;">수정</button>
						<button type="button" class="btn float-right" onclick="location.href='list'" id="btnCancel">취소</button>
					</td>
				</tr>
			</table>
		</form>
	
		<c:if test="${session.loginId} == ${board.userId}">
			<button class="btn float-left" id="btnDel" onclick="location.href='/controller/board/delete?bno=${board.bno}'">삭제하기</button>
		</c:if>
	</div>
	</fieldset>
</div>

<script>
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