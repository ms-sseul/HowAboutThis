
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
<title>게시글 상세보기</title>
</head>
<body>

<jsp:include page="../web/header.jsp" />
<div class="container col-lg-10 col-sm-8">

	 <div class="table-responsive-lg" style="margin:4em;">
	<!--	<table class="table" text-align="center">
			<thead>
				<tr><td>
					<div>					
						글번호: ${board.bno}
						작성일: ${regDate}
						작성자: ${board.userId} <br/>
						제목: 
					</div>
					<hr/>
				</td></tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="jumbotron">
							${board.content}
						</div>
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
							<ul class="list-group">
							</ul>
							<textarea rows="5" cols="80" readonly>댓글리스트</textarea>
						</div>
					</td>
				</tr>
			</tbody>
		</table> -->
	<div class="card mb-3">
		<h3 class="card-header">[${board.bno}] ${board.title}</h3>
		<div class="card-body">
			<fmt:formatDate value="${board.regDate}" pattern="yyyy/MM/dd HH:mm:ss" var="regDate" />
			<h5 class="card-title">작성자: ${board.userId}</h5>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">
				<div class="jumbotron" style="margin-bottom: 0">
					<h6 class="text-muted" style="text-align:right">작성시간: ${regDate}</h6>
				${board.content}
				</div>
			</li>
			<li class="list-group-item">
				<div id="replies">
					<ul class="list-group"></ul>
				</div>
			</li>
		</ul>
		<div class="card-footer form-group" style="margin-bottom: 0;">
			<form class="form-inline" style="width: 100%">
				<input type="text" id="rtext" placeholder="댓글 내용 입력" class="form-control" style="margin-right: 0.5em;" required>
				<button class="btn" id="createReply">댓글작성</button>
			</form>
		</div>
	</div>
	
	<button class="btn" onclick="location.href='/controller/board/list?page=${criteria.page}&perPageNum=${criteria.perPageNum}'">목록으로 돌아가기</button>
	<c:if test="${board.userId==loginId}">
	<button class="btn float-right" onclick="location.href='/controller/board/update?bno=${board.bno}'">수정하기</button>
	<button class="btn float-right" onclick="location.href='/controller/board/delete?bno=${board.bno}'" style="margin-right: 0.5em;">삭제하기</button>
	</c:if>
</div>
</div>

<input type="hidden" id="loginId" value="<%=(String)session.getAttribute("loginId")%>" />
<input type ="hidden" id="pagenum"  value="?page=${criteria.page}&perPageNum=${criteria.perPageNum}"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script id="reply-template" type="text/x-handlebars-template">
<li class="reply-item list-group-item d-flex justify-content-between align-items-center">
	<input id="rno" value="{{rno}}" type="hidden" readonly />
	<input id="content" value="{{content}}" type="text" />
	<input id="userId" value="{{userId}}" type="text" readonly />
	<input id="regDate" value="{{regDate}}" type="text" readonly />
	<button class="btnUpdate">수정</button>
	<button class="btnDelete">삭제</button>
</li>

</script>


<script>
$(document).ready(function(){
	var bno = $('#bno').val();
	var division = $('#replies');
	var page = $('#pagenum').val();
	
	var source = $('#reply-template').html();
	
	var template = Handlebars.compile(source);
	
	function getAllReplies(){
		
		$.getJSON('/controller/replies/all/'+bno, function(data){
			division.empty();
			
			$(data).each(function(){
				console.log(this);
				var date = new Date(this.regDate);
				var dateString = date.toLocaleDateString()
					+' '+date.toLocaleTimeString();
				
				var content_Item = {
						rno: this.rno,
						content: this.content,
						userId: this.userId,
						regDate: dateString
						
				};
				var replyItem = template(content_Item);
				
				division.append(replyItem);
				
			});
			
			
		});
		
	}//end function getAllReplies()
	
	getAllReplies();
	
	$('#createReply').click(function(){
		var content = $('#rtext').val();
		var loginId = $('#loginId').val();
		console.log(loginId);
		console.log(bno);
		console.log(content);
		$.ajax({
			type: 'post',
			url: '/controller/replies/',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'post'
			},
			data: JSON.stringify({
				'parentNumber': bno,
				'content': content,
				'userId': loginId
			}),
			success: function(result){
				
				alert('댓글 추가 결과: '+result)
				getAllReplies();
			}			
		});		
	});
	
	division.on('click', '.reply-item .btnUpdate', function(){
		var rno = $(this).prevAll('#rno').val();
		
		var content = $(this).prevAll('#content').val();
	
		$.ajax({
			type: 'put',
			url: '/controller/replies/update/' + rno,
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'put'
			},
			data: JSON.stringify({'content':content}),
			success: function(data){
				if(data == 1){
					alert('댓글'+rno+'번 수정 성공');
					getAllreplies();
				}else{
					alert('댓글 수정 실패')
				}
			}
			
			
		});//end ajax
		
	
		
	});//divison btnupdate end	
	
	division.on('click','.reply-item .btnDelete', function(){
		var rno = $(this).prevAll('#rno').val();
		console.log(rno);
		var result = confirm(rno+'번 댓글을 삭제 하시겠습니까?')
		if(result == true){
			$.ajax({
				type: 'delete',
				url: '/controller/replies/delete/'+rno,
				headers: {
					'Content-Type': 'apllication/json',
					'X-HTTP-Method-Override': 'delete'
				},
				success: function(data){
					if(data=='success'){
						alert(rno+'번 댓글 삭제 성공');
						getAllReplies();
					}
				}
				
				
			});
			
			
		} //result end
		
		
	});
	
	 	
});	
	
	
	
	
</script>



</body>
</html>