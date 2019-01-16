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
<title>게시글 상세보기</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />
<div class="boardhead" style="margin:3em;">게시글</div>

<div class="boarddetail" align="center">
	<table width="900px">
		<thead>
			<tr><td>
				<div><input type="number" id="bno" value="${board.bno}" readonly />
					<input type="text" value="${board.title}" readonly /></div>
					
					<fmt:formatDate value="${board.regDate}" pattern="yyyy/MM/dd HH:mm:ss" var="regDate"/>
					<input type="text" value="${regDate}" readonly />
					<input type="text" value="${board.userId}" readonly />
				<hr/>
			</td></tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<div><textarea rows="5" cols="80" readonly>${board.content}</textarea></div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<input type="text" id="rtext" placeholder="댓글 내용 입력" />
						<button id="createReply">댓글 작성</button>
					</div>
				</td>
				<td>
					<hr/>
				</td>
			</tr>
			<tr>
				<td>
					<div id="replies">
						<!-- 댓글 리스트를 넣어줄 영역 -->
						<textarea rows="5" cols="80" readonly>댓글리스트</textarea>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<button class="btn" onclick="location.href='/controller/board/list?page=${criteria.page}&perPageNum=${criteria.perPageNum}'" style="width:20%" align="right" >목록으로 돌아가기</button>
	<a href="update?bno=${board.bno}">수정하기</a>
</div>


</body>
</html>