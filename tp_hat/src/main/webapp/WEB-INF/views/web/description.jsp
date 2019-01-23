<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>프로젝트 상세보기</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../resources/css/category.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<script>
	$(document).ready(function() {
		if('${result}'=='success'){
			alert('후원을 성공했습니다.');
		}
	});

</script>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div style="margin: 4em 0 0 0;">
		<!-- 프로젝트 이름 -->
		<h1 class="mt-4" style="text-align: center;">${projectModel.title}</h1>
		<p class="lead" style="text-align: right;">
			by <a href="#">${projectModel.userId}</a></p>
		<hr>
		<!-- Date/Time -->
		<p style="text-align: right"> Posted on
		<fmt:formatDate value="${projectModel.regTime}" pattern="yy/MM/dd HH:mm:ss"></fmt:formatDate></p>
		<hr>
	</div>

	<div class="row">
		<!-- 프로젝트 썸네일-->
		<div class="col-12 col-md-8">
			<img class="img-fluid rounded" src="${projectModel.image.image}"
				alt="">
		</div>
		<!-- 프로젝트 정보 -->
		<div class="col-12 col-md-4">
			<div class="card my-4">
				<div class="card-body">
					<label>남은 시간</label>
					<c:if test="${projectModel.restDay<0}">
						<h3>D${projectModel.restDay}</h3>
					</c:if>
					<c:if test="${projectModel.restDay==0}">
						<h3>D-Day</h3>
					</c:if>
					<p class="progress">
						<a class="progress-bar progress-bar-striped progress-bar-animated"
							aria-valuenow="40" role="progressbar" aria-valuemin="0"
							aria-valuemax="100" style="width:${projectModel.percent*100}%;"></a>
					</p>
					<label>모인 금액</label>
					<h3><fmt:formatNumber value="${projectModel.currentAmount}"></fmt:formatNumber>원</h3>
				</div>
				<div class="card-body">
					<h3>펀딩 진행중</h3>
					<p>
						목표 금액인
						<fmt:formatNumber value="${projectModel.targetAmount}"></fmt:formatNumber>
						원이 모이면 펀딩에 성공합니다. 실패시 결제한 포인트는 환불처리 됩니다.
					</p>
				</div>
				<div class="card-body btn-wrap funding">
					<form action="rewards" method="get">
						<input type="hidden" id="inPno" name="pno"
							value="${projectModel.pno}" />
						<c:if test="${not empty loginId}">
							<button type="submit" id="btn" class="btn" style="width: 100%">펀딩하기</button>
						</c:if>
						<c:if test="${empty loginId}">
							<h4>
								<a>펀딩은 로그인이 필요합니다.</a>
							</h4>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- // end row1 -->

	<div class="row">
		<!-- 프로젝트 내용(content) -->
		<div class="col-12 col-md-8">
			<c:forEach items = "${images}" var ="img" varStatus="status">
				<c:if test = "${status.index!=0}">
					<img class="img-fluid rounded" src="${img.image}" alt=""><br/>
				</c:if>
			</c:forEach>
			<blockquote class="blockquote text-center">
				<p class="lead mb-0">${projectModel.content}</p>
			</blockquote>
		</div>

	<div class="col-md-4">
		<!-- 프로젝트 팀 정보 -->
		<div class="card my-4">
			<div class="card-body">
				<label>창작자 소개</label>
				<h3>${projectModel.userId}</h3>
			</div>
			<div class="card-body">
				<p>${projectModel.introduction}</p>
			</div>
			<div class="card-body btn-wrap funding">
			<c:if test="${not empty loginId}">
				<button class="btn" style="width: 100%" id="btnSendMessage">창작자에게 문의하기</button>
			</c:if>
			<c:if test="${empty loginId}"></c:if>
				<h4><a>문의는 로그인이 필요합니다.</a></h4>
           </div>
		</div>

		<!-- 댓글달기 -->
			<input type="hidden" id="loginId"value="<%=(String) session.getAttribute("loginId")%>" />
			<div class="card my-4">
				<h5 class="card-header">프로젝트 문의</h5>
				<div class="card-body">
					<div>
						<c:if test="${not empty loginId}">
							<div class="form-group">
								<textarea id="rtext" class="form-control" rows="3"></textarea>
							</div>
							<button type="submit" class="btn" id="btnResult"
								name="btnResult" style="width: 100%">댓글달기</button>
						</c:if>
						<c:if test="${empty loginId}">
							<textarea id="rtext" class="form-control" rows="3"
								placeholder="로그인이 필요합니다" readonly></textarea>
						</c:if>
					</div>
				</div>
				<!-- 프로젝트 관련 댓글 -->
				<div class="media mb-4">
					<div class="media-body">
						<div class="mt-0" id="mt-0">
							<!-- 여기 댓글 들어감 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="footer">
	<footer class="py-3" style="background: #78c2ad;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyrightⓒ2019 유니세프 Allrights reserved.</p>
		</div>
	</footer>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script id="reply-template" type="text/x-handlebars-template">
<li class="reply-item form-group">
	<input class="form-control" id="rno" value="{{rno}}" type="hidden" readonly />
	<input class="form-control" id="userId" value="{{userId}}" type="text" readonly />
	<input class="form-control" id="regDate" value="{{regDate}}" type="text" readonly />
	<input class="form-control" id="content" value="{{content}}" type="text" readonly />
	<div class="btnGroup-div{{rno}}">
		<button class="btnUpdate btn">수정</button>
		<button class="btnDelete btn">삭제</button>
	</div>
</li>
</script>

<script>
$(document).ready(function(){
	var pno = ${projectModel.pno};
	var division = $('#mt-0');
	var loginId = $('#loginId').val();
	var projectCreator = '${projectModel.userId}';
	
	var source = $('#reply-template').html();
	
	var template = Handlebars.compile(source);
	console.log('pno : ' +pno);
	
	function getAllReplies(){
		console.log('pno : ' + pno);
		
		$.getJSON('/controller/replies/allProject/'+pno, function(data){
			division.empty();
			console.log(pno);
			
			$(data).each(function(){
				
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
				console.log("rno 값 = "+rno);
				
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
					$('#createReply').show();
				}
				
			});
			
			
		});
		
	}//end function getAllReplies()
	
	getAllReplies();
	
	$('#btnResult').click(function(event){
		var content = $('#rtext').val();
		var loginId = $('#loginId').val();
		console.log(loginId);
		if(loginId==null){
			alert('로그인이 필요합니다.');
			event.preventDefault();
		}
		console.log(loginId);
		console.log(pno);
		console.log(content);
		$.ajax({
			type: 'post',
			url: '/controller/replies/projectPno',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'post'
			},
			data: JSON.stringify({
				'parentNumber': pno,
				'content': content,
				'userId': loginId
			}),
			success: function(result){
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
					getAllreplies();
				}else{
				}
			}
			
			
		});//end ajax
		
	
		
	});//divison btnupdate end	
	
	division.on('click','.reply-item .btnDelete', function(){
		var rno = $(this).parents('.reply-item').children('#rno').val();
		
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
	$('#btnSendMessage').click(function() {
		self.location = "/controller/message/createMessage?reciever="+projectCreator;
	});
	
	
});	
	
</script>

</body>
</html>