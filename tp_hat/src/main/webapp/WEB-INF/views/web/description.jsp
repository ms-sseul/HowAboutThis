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

<title>description</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../resources/css/category.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
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
	<div style="margin:4em 0 0 0;">
		<!-- 프로젝트 이름 -->
		<h1 class="mt-4" style="text-align:center;">${projectModel.title}</h1>
        <p class="lead" style="text-align:right;">by 
        	<a href="#">${projectModel.userId}</a>
		</p>
		<hr>
		<!-- Date/Time -->
		<p style="text-align:right"> Posted on <fmt:formatDate value="${projectModel.regTime}" pattern="yy/MM/dd HH:mm:ss"></fmt:formatDate></p>
		<hr>
 	</div>
 	
	<div class="row">
		<!-- 프로젝트 썸네일-->
		<div class="col-12 col-md-8">
			<img class="img-fluid rounded" src="${projectModel.image.image}" alt="">
		</div>
		<!-- 프로젝트 정보 -->
		<div class="col-12 col-md-4">
			<div class="card my-4">
				<div class="card-body">
					<label>남은 시간</label>
					<c:if test= "${projectModel.restDay<0}">
					<h3>D${projectModel.restDay}</h3>
					</c:if>
					<c:if test = "${projectModel.restDay==0}">
					<h3>D-Day</h3>
					</c:if>
					<p class="progress">
						<a class="progress-bar progress-bar-striped progress-bar-animated" aria-valuenow="40" role="progressbar" 
						aria-valuemin="0" aria-valuemax="100" style="width:${projectModel.percent*100}%; background-color:#78c2ad;"></a>
					</p>
					<label>모인 금액</label>
					<h3><fmt:formatNumber value="${projectModel.currentAmount}"></fmt:formatNumber>원</h3>
				</div>
				<div class="card-body">
					<h3>펀딩 진행중/펀딩성공</h3><br/>목표 금액인 <fmt:formatNumber value="${projectModel.targetAmount}"></fmt:formatNumber>원이 모여야만 결제됩니다. 
					결제는 "마감일자"에 다함께 진행됩니다. <br/>
	           </div>
	           <div class="card-body btn-wrap funding">
					<button class="btn" onclick="location.href='rewards?pno='+${projectModel.pno}" style="width: 100%">펀딩하기</button>
	           </div>
			</div>
		</div>
	</div> <!-- // end row1 -->
		
	<div class="row">
		<!-- 프로젝트 내용(content) -->
		<div class="col-12 col-md-8">
			<c:forEach items = "${images}" var ="img" varStatus="status">
			<c:if test = "${status.index!=0}">
				<img class="img-fluid rounded" src="${img.image}" alt=""><br/>
			</c:if>
			</c:forEach>
			<p class="lead">${projectModel.content}</p>
		</div>
		
		<div class="col-md-4">
			<!-- 프로젝트 팀 정보 -->
			<div class="card my-4">
				<div class="card-body">
					<label>창작자 소개</label>
					<h3>${projectModel.userId}</h3>
				</div>
				<div class="card-body">
					설명블라블라</h5>
	           </div>
	           <div class="card-body btn-wrap funding">
					<button class="btn" onclick="" style="width: 100%">창작자에게 문의하기</button>
	           </div>
			</div>
			
			<!-- 댓글달기 -->
			<div class="card my-4">
				<h5 class="card-header">Leave a Comment:</h5>
				<div class="card-body">
					<form>
						<div class="form-group">
							<textarea class="form-control" rows="3"></textarea>
						</div>
						<button type="submit" class="btn" style="width: 100%">댓글달기</button>
					</form>
				</div>
					<!-- 프로젝트 관련 댓글 -->
	<div class="media mb-4">
		<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
		<div class="media-body">
			<div class="mt-0"> 
				<span>Commenter Name</span>
				<span>
					<a href="#">답글</a>
				</span>
			</div>
		<p>내용</p>
	
			<div class="media mb-4">
				<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
				<div class="media-body">
					<div class="mt-0"> 
						<span>Commenter Name</span>
						<span>
							<a href="#">답글</a>
						</span>
					</div>
				<p>내용</p>
	       
					<div class="media mb-4">
						<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
						<div class="media-body">
							<div class="mt-0"> 
								<span>Commenter Name</span>
								<span>
									<a href="#">답글</a>
								</span>
							</div>
							<p>내용</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
			</div>
		</div>
</div>
</div> <!-- .row -->

<div class="footer">
	<footer class="py-3" style="background:#78c2ad;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyrightⓒ2019 유니세프 All rights reserved.</p>
		</div>
	</footer>
</div>

</body>
</html>