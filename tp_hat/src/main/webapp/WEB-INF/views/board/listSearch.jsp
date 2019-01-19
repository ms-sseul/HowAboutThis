<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>게시판</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />
<div class="boardhead" style="margin:3em;">게시판</div>

<div class="table-responsive-lg" align="center" style="margin:1em">
	<table class="table table-hover" text-align="center">
		<thead>
			<tr class="info">
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
						<a href="/controller/board/detailSearch${pageMaker.makeQuery(pageMaker.criteria.page)}&bno=${board.bno}&keyWord=${keyWord}&searchType=${searchType}">
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
</div>

<div class="text-center">
	<ul class="pagination justify-content-center">
	<c:if test="${pageMaker.prev}">
    <li class="page-item">
    	<a class="page-link" href="/controller/board/listSearch${pageMaker.makeQuery(pageMaker.startPage - 1)}&keyWord=${keyWord}&searchType=${searchType}">Previous</a>
    </li>
	</c:if>
	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    		<li class="page-item">
    			<a class="page-link" href="/controller/board/listSearch${pageMaker.makeQuery(idx)}&keyWord=${keyWord}&searchType=${searchType}">${idx}</a>
   			</li>
	</c:forEach>
	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page-item"><a class="page-link" href="/controller/board/listSearch${pageMaker.makeQuery(pageMaker.endPage + 1)}&keyWord=${keyWord}&searchType=${searchType}">Next</a></li>
	</c:if>	
  </ul>
</div>

<div class="option">
	<form align="right" action="listSearch" method="get">
		<input type="button" onclick="location.href='list'" value="전체목록" />
		<select name="searchType">
			<option value="1">글쓴이</option>
			<option value="2">제목</option>
			<option value="3">제목/내용</option>
		</select>
		<input type="text" name="keyWord" placeholder="검색어를 입력해주세요" required/>
		<input type="submit" value="검색" id="btnSearch" />
		
		<input type="hidden" name="queryString" value="/controller/board/list${pageMaker.makeQuery(pageMaker.criteria.page)}"/>
	</form>
</div>

<div>
<input type="button" onclick="location.href='insert'" value="글쓰기" />
</div>



</body>
</html>