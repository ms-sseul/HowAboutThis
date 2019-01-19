
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
				<div>					
					<input type="number" id="bno" value="${board.bno}" readonly />
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
	</table>
	<button class="btn" onclick="location.href='/controller/board/listSearch?page=${criteria.page}&perPageNum=${criteria.perPageNum}&keyWord=${keyWord}&searchType=${searchType}'" style="width:20%" align="right" >목록으로 돌아가기</button>
	<a href="update?bno=${board.bno}">수정하기</a>
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