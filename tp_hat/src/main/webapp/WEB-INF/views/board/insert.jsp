<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/css/board.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>게시글 입력하기</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />
<div class="container col-lg-10 col-sm-8">
	<fieldset>
	<div class="table-responsive-lg" style="margin: 5em;">		
		<form class="form-group" action="insert" method="post" id="form">
			<table class="table" text-align="center">
				<tr>
					<td>
					<input type="text" id="title" name="title" placeholder="제목을 입력하세요" class="form-control" required>
					<input type="hidden" id="userId" name="userId" value="${loginId}" class="form-control" readonly>
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
						<button type="submit" class="btn " id="btnResult" style="margin-right: 0.5em;">작성</button>
						<button type="button" class="btn float-right" onclick="location.href='list'" id="btnCancel">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</fieldset>
</div>

<script>
$(document).ready(function() {
	$('#btnCancel').click(function(event) {
		event.preventDefault();
		self.location = 'list';
	});
	var btnResult = $('#btnResult');
	
	/* var form = $('#form');
	btnResult.click(function(event) {
		event.preventDefault();
		
		var title = $('#title').val();
		console.log(title);
		var content = $('#contents').val();
		console.log(content);
		
		if(title == "" || content == "") {
			alert('제목과 내용을 빠짐없이 입력해 주세요');
		} else {
			document.form.submit();
		}
	}); */
	
});
</script>

</body>
</html>