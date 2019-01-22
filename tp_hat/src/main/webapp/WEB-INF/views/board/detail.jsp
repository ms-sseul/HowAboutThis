
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
			<input type="hidden" id="loginId" value="<%=(String)session.getAttribute("loginId")%>" />
			<div class="form-inline" style="width: 100%">
				<c:if test="${not empty loginId}">
					<input type="text" id="rtext" placeholder="댓글 입력" class="form-control" style="margin-right: 0.5em;"/>
					<button class="btn" id="createReply">댓글 등록</button>
				</c:if>
				<c:if test = "${empty loginId}">
					<input type="text" id="rtext" placeholder="로그인이 필요합니다." class="form-control" style="margin-right: 0.5em;" readonly/>
				</c:if>
			</div>
		</div>
	</div>
	
	<button class="btn" onclick="location.href='/controller/board/list?page=${criteria.page}&perPageNum=${criteria.perPageNum}'">목록으로 돌아가기</button>
	<c:if test="${board.userId==loginId}">
	<button class="btn float-right" id = "btnBoardUpdate" onclick="location.href='/controller/board/update?bno=${board.bno}'">수정하기</button>
	<button class="btn float-right" id = "btnBoardDelete" style="margin-right: 0.5em;">삭제하기</button>
	</c:if>
</div>
</div>

<input type="hidden" id="bno" value="${board.bno}" />
<input type ="hidden" id="pagenum"  value="page=${criteria.page}&perPageNum=${criteria.perPageNum}&bno=${board.bno}"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script id="reply-template" type="text/x-handlebars-template">
<li class="reply-item list-group-item d-flex justify-content-between align-items-center">
	<input id="rno" value="{{rno}}" type="hidden" readonly />
	<input id="content" value="{{content}}" type="text" readonly />
	<input id="userId" value="{{userId}}" type="text" readonly />
	<input id="regDate" value="{{regDate}}" type="text" readonly />
	<div class="btnGroup-div{{rno}}">
		<button class="btnUpdate">수정</button>
		<button class="btnDelete">삭제</button>
	</div>
</li>

</script>


<script>
$(document).ready(function(){
	var bno = ${board.bno};
	var division = $('#replies');
	var page = $('#pagenum').val();
	var loginId = $('#loginId').val();
	var source = $('#reply-template').html();
	
	var template = Handlebars.compile(source);
	
	function getAllReplies(){
		
		$.getJSON('/controller/replies/all/'+bno, function(data){
			division.empty();
			
			$(data).each(function(){
				console.log(this);
				console.log(bno);
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
				var userId = this.userId;
				division.append(replyItem);
				var rno = this.rno;
				if(loginId == userId) {
					$('.btnGroup-div' + rno + ' ' + '.btnUpdate').show();
					$('.btnGroup-div' + rno + ' ' + '.btnDelete').show();
					
				}
				if(loginId != userId) {
					$('.btnGroup-div' + rno + ' ' + '.btnUpdate').hide();
					$('.btnGroup-div' + rno + ' ' + '.btnDelete').hide();
				}
				
				console.log("loginId : "+loginId);
				if(loginId == "null"){
					console.log("loginId가 없음"+loginId);					
					$('#createReply').hide();
					$('#rtext').prop('placeholder','로그인이 필요합니다.');
					$('#rtext').prop('readonly',true);
					
				}else{				
					console.log("loginId가 있다 : "+loginId);
					$('#rtext').show();
					$('#rtext').prop('readonly',false);
					$('#createReply').show();
				}
				
			});
			
			
		});
		
	}//end function getAllReplies()
	
	getAllReplies();
	
	$('#createReply').click(function(event){
		var content = $('#rtext').val();
		var loginId = $('#loginId').val();
		if(loginId==null){
			alert('로그인이 필요합니다.');
			event.preventDefault();
		}
		console.log(loginId);
		console.log(bno);
		console.log(content);
		$.ajax({
			type: 'post',
			url: '/controller/replies',
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
				alert('댓글 추가 결과: '+result);
				$('#rtext').val('');
				getAllReplies();
			}			
		});		
	});
	
	division.on('click', '.reply-item .btnUpdate', function(){
		var userId = $(this).parents('.reply-item').children('#userId').val();
		var rno = $(this).parents('.reply-item').children('#rno').val();
		var selectedContent = $(this).parents('.reply-item').children('#content');
		var content = $(this).parents('.reply-item').children('#content').val();
		
		selectedContent.attr('readonly',false);
	
		$.ajax({
			type: 'put',
			url: '/controller/replies/update/' + rno,
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'put'
			},
			data: JSON.stringify({'userId':userId,'content':content}),
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
		var rno = $(this).parents('.reply-item').children('#rno').val();
		alert(rno + ' 댓글 삭제?');
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
					}else{
						alert('입력하신 글이 아닙니다');
					}
				}
				
				
			});
			
			
		} //result end
		
		
	});
	
	$('#btnBoardDelete').click(function() {
		var result = confirm('게시글을 삭제할까요?');
		if(result){
			location = '/controller/board/delete?bno='+${board.bno};
		} else {
			
		}
	}); 
	 	
});	
	
	
	
	
</script>



</body>
</html>