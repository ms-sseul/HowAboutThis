<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
<title>게시글 입력하기</title>
</head>
<body>

<div class="insertBoard">
	<table>
		<tr>
			<td>
				<input type="text" id="title" name="title" style="width:100%" value="${detail.title}" placeholder="제목" autofocus />
			</td>
		</tr>
        <tr>
			<td>
				<textarea name="content" id="content" rows="10" cols="80">${detail.content}</textarea>
			</td>
		</tr>
		<tr>
			<td align="right">
			<input type="submit" value="작성하기">
			<!-- <button type="submit" style="width:25%">작성하기</button> -->
			<button class="btn" onclick="location.href='list'" style="width:25%">취소</button>
			</td>	
		</tr>
	
	</table>
</div>

<script>
	CKEDITOR.replace( 'content' );
</script>

	
</body>
</html>