<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>게시글 입력하기</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />
<div class="inserthead" style="margin:3em;">작성하기</div>

<div class="insertBoard" align="center">
	<form action="insert" method="post" id="form">
	<table width="700px">
		<tr><td>
			<input type="text" id="title" name="title" style="width:100%" placeholder="제목" autofocus required/>
		</td></tr>
		<tr><td>
			<textarea name="content" id="contents" rows="10" cols="100" required></textarea>
			<input type="text" id="userId" name="userId" placeholder="${loginId}" value="${loginId}" readonly>
		</td></tr>
		<tr><td align="right">
			<br/>
			<button type="submit" class="btn" id="btnResult" style="width:10%">작성</button>
			<button type="button" class="btn" onclick="location.href='list'" id = "btnCancel" style="width:10%">취소</button>
		</td></tr>
	</table>
	</form>	
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
	// CKEDITOR.replace( 'content' );
</script>

</body>
</html>