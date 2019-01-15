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
	<table width="900px">
		<tr>
		<td>
			<input type="text" id="title" name="title" style="width:100%" value="${detail.title}" 
				placeholder="제목" autofocus />
		</td>
		</tr>
		<tr>
		<td>
			<textarea name="content" id="content" rows="100" cols="100">${detail.content}</textarea>
		</td>
		</tr>
		<tr>
			<td align="right">
			<br/>
			<button class="btn" id="save" style="width:20%">작성하기</button>
			<button class="btn" onclick="location.href='list'" style="width:20%">취소</button>
			</td>	
		</tr>
	
	</table>
</div>

<script>
	CKEDITOR.replace( 'content' );
</script>

</body>
</html>