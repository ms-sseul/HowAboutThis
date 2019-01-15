<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<body>

<a href="/controller/board/insert">작성</a>
<form>
	<input type="text" placeholder="검색어를 입력해주세요">
	<input type="submit" value="검색">
</form>

<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조횟수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${boardList}" var="board">
			<tr>
				<td>${board.bno}</td>
				<td>
					<a href="detail?bno=${board.bno}">
						${board.title}
					</a> [${board.replyCnt}]
				</td>
				<td>${board.userId}</td>
				<fmt:formatDate value="${board.regDate}"
					pattern="yyyy/MM/dd HH:mm" var="regDate"/>
				<td>${regDate}</td>
				<td>${board.readCnt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>