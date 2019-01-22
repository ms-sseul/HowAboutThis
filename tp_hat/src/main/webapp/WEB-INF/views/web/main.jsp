<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/main.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&amp;subset=korean" rel="stylesheet">
<style>
a:link, a:visited,
a:hover, a:active { 
	text-decoration: none; !important;
	color: black; !important;
}

.round-button{ 
  width: 50px; 
  height: 50px; 
  text-decoration: none; 
  display: inline-block; 
  outline: none; 
  cursor: pointer; 
  border-style: none; 
  color: white; 
  background-color: #3498db; 
  border-radius: 100%; 
  overflow: none; 
  text-align: center;
   
}

.align {
	padding: 40px;
	margin: 0 auto;
}

</style>
<title>MAIN</title>
</head>
<body>

<script>
$(document).ready(function() {
   if('${createResult}'=='success'){
      alert('프로젝트 생성이 성공했습니다.');
   }
});
</script>

<jsp:include page="header.jsp"></jsp:include>

<div>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- 배너 이미지출력  -->
			<c:forEach items="${bannerImageList}" var="bannerImage"
				varStatus="b">
				<c:if test="${b.count==1}">
					<div class="carousel-item active"
						onclick="location.href='description?pno='+${bannerImage.pno}"
						style="background-image: url('${bannerImage.image}'); cursor: pointer;">
						<div class="carousel-caption d-none d-md-block">
						</div>
					</div>
				</c:if>
				<c:if test="${b.count>1}">
					<!--  이미지 클릭 시 해당 프로젝트 번호 상세보기로 넘어가기 -->
					<div class="carousel-item"
						onclick="Location.href = 'project/description?pno='+${bannerImage.pno}"
						style="background-image: url('${bannerImage.image}'); cursor: pointer;">
						<div class="carousel-caption d-none d-md-block">
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

		<!--  TODO : 각 분야별 프로젝트 출력 창으로 넘어가기  -->
		<div class="content-category" style="transform: translateY(0px);">
			<!-- 전체보기 -->
			<div class="container">
				
				
				
			<!-- onclick : tech.jsp 연결 -->
		<div class = "form form-inline" style="text-align: center;">
		
		 	<div class="align">
			<a style="background-color: white; border: none;" onclick="location.href='theme?category=0'">
				<img class="round-button" src="../images/category/all.jpg"/> 
			</a>
			<div>전체보기</div>
		 	</div>
		
			<div class="align">
			<a style="background-color: white; border: none;" onclick="location.href='theme?category=1'">
				<img class="round-button" src="../images/category/category-tech.jpeg"/> 
			</a>
			<div>테크 & 가전</div>
			</div>
			
			<!-- onclick : fasion.jsp 연결 -->
			<div class="align">
			<a style="background-color: white; border: none;" onclick="location.href='theme?category=2'">
				<img class="round-button" src="../images/category/category-fashion.jpeg"/>
			</a>
			<div>패션</div>
			</div>
			
			<!-- onclick : design.jsp 연결 -->
			<div class="align">
			<a style="background-color: white; border: none;" onclick="location.href='theme?category=3'">
				<img class="round-button" src="../images/category/category-design.jpg"/>
			</a>
			<div>디자인</div>
			</div>
			
			<!-- onclick : animal.jsp 연결 -->
			<div class="align">
			<a style="background-color: white; border: none;" onclick="location.href='theme?category=4'">
				<img class="round-button" src="../images/category/category-pet.jpg"/>
			</a>
			<div>반려동물</div>
			</div>
			
			<!-- onclick : hobby.jsp 연결 -->
			<div class="align">
			<a style="background-color: white; border: none;" onclick="location.href='theme?category=5'">
				<img class="round-button" src="../images/category/category-hobby.jpeg"/>
			</a>
			<div>취미</div>
			</div>
			
			<!-- onclick : social.jsp 연결 -->
			<div class="align">
			<a style="background-color: white; border: none;" onclick="location.href='theme?category=6'">
				<img class="round-button" src="../images/category/category-social.jpeg"/>
			</a>
			<div>소셜</div>
			</div>
		</div>
	</div>
	
	
	<div>
		<div class="container">
			<c:if test="${empty option}">
				<h3 style="padding: 10px;">마감 임박순</h3>
				<div class="row">
					<c:forEach items="${closingTimeProjects}" var="ctp"
						varStatus="index">
						<div class="col-lg-4 col-sm-6 portfolio-item">
							<div class="card h-100">
								<!-- 해당 프로젝트 연결 / 아래 썸네일도 동일합니다 -->
								<div>
									<a href="description?pno=${ctp.pno}"> <img
										class="card-img-top" src="${ctp.image.image}"></a>
								</div>
								<div class="card-body">
									<h4 class="card-title">
										<a href="description?pno=${ctp.pno}">${ctp.title}</a>
									</h4>
								</div>
								<div class="progress" style="margin:0 0.5em 0.5em 0.5em;">
									<a class="progress-bar progress-bar-striped progress-bar-animated"
										aria-valuenow="40" role="progressbar" aria-valuemin="0"
										aria-valuemax="100" style="width:${ctp.percent*100}%; background-color:#78c2ad;"></a>
								</div>
								<div style="margin:0 0.5em 0.5em 0.5em;">
									<a><fmt:formatNumber value="${ctp.percent}" type="percent"></fmt:formatNumber></a>
									<a><fmt:formatNumber value="${ctp.currentAmount}"
											groupingUsed="true"></fmt:formatNumber>원</a>
									<c:if test="${ctp.restDay<0}">
										<a class="">D${ctp.restDay}</a>
									</c:if>
									<c:if test="${ctp.restDay==0}">
										<a class="">D-Day</a>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>

				<h3 style="padding: 10px;">인기순</h3>
				<div class="row">
					<c:forEach items="${popularProjects}" var="pp" varStatus="index">
						<div class="col-lg-4 col-sm-6 portfolio-item">
							<div class="card h-100">
								<!-- 해당 프로젝트 연결 / 아래 썸네일도 동일합니다 -->
								<div>
									<a href="description?pno=${pp.pno}"><img
										class="card-img-top" src="${pp.image.image}"></a>
								</div>
								<div class="card-body">
									<h4 class="card-title">
										<a href="description?pno=${pp.pno}">${pp.title}</a>
									</h4>
								</div>
								<div>
									<a></a>
								</div>
								<div class="progress" style="margin:0 0.5em 0.5em 0.5em;">
									<a class="progress-bar progress-bar-striped progress-bar-animated"
										aria-valuenow="40" role="progressbar" aria-valuemin="0"
										aria-valuemax="100" style="width:${pp.percent*100}%; background-color:#78c2ad;"></a>
								</div>
								<div style="margin:0 0.5em 0.5em 0.5em;">
									<a><fmt:formatNumber value="${pp.percent}" type="percent"></fmt:formatNumber></a>
									<a><fmt:formatNumber value="${pp.currentAmount}"
											groupingUsed="true"></fmt:formatNumber>원</a>
									<c:if test="${pp.restDay<0}">
										<a class="">D${pp.restDay}</a>
									</c:if>
									<c:if test="${pp.restDay==0}">
										<a class="">D-Day</a>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<h3 style="padding: 10px;">최신순</h3>
				<div class="row">
					<c:forEach items="${lastestProjects}" var="lp" varStatus="index">
						<div class="col-lg-4 col-sm-6 portfolio-item">
							<div class="card h-100">
								<!-- 해당 프로젝트 연결 / 아래 썸네일도 동일합니다 -->
								<div>
									<a href="description?pno=${lp.pno}"><img
										class="card-img-top" src="${lp.image.image}"></a>
								</div>
								<div class="card-body">
									<h4 class="card-title">
										<a href="description?pno=${lp.pno}">${lp.title}</a>
									</h4>
								</div>
								<div>
									<a></a>
								</div>
								<div class="progress" style="margin:0 0.5em 0.5em 0.5em;">
									<a class="progress-bar progress-bar-striped progress-bar-animated"
										aria-valuenow="40" role="progressbar" aria-valuemin="0"
										aria-valuemax="100" style="width:${lp.percent*100}%; background-color:#78c2ad;"></a>
								</div>
								<div style="margin:0 0.5em 0.5em 0.5em;">
									<a><fmt:formatNumber value="${lp.percent}" type="percent"></fmt:formatNumber></a>
									<a><fmt:formatNumber value="${lp.currentAmount}"
											groupingUsed="true"></fmt:formatNumber>원</a>
									<c:if test="${lp.restDay<0}">
										<a class="">D${lp.restDay}</a>
									</c:if>
									<c:if test="${lp.restDay==0}">
										<a class="">D-Day</a>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
		<div class="container">
			<c:if test="${not empty option}">
				<h3 style="padding: 10px;">${categoryName}</h3>
				<c:forEach items="${projectModels}" var="pm" varStatus="vs">
					<c:if test="${vs.index%3==0}">
						<div class="row">
					</c:if>
					<div class="col-lg-4 col-sm-6 portfolio-item">
						<div class="card h-100">
							<!-- 해당 프로젝트 연결 / 아래 썸네일도 동일합니다 -->
							<div>
								<a href="description?pno=${pm.pno}"><img
									class="card-img-top" src="${pm.image.image}"></a>
							</div>
							<div class="card-body">
								<h4 class="card-title">
									<a href="description?pno=${pm.pno}">${pm.title}</a>
								</h4>
							</div>
							<div>
								<a></a>
							</div>
							<div class="progress" style="margin:0 0.5em 0.5em 0.5em;">
								<a class="progress-bar progress-bar-striped progress-bar-animated"
									aria-valuenow="40" role="progressbar" aria-valuemin="0"
									aria-valuemax="100" style="width:${pm.percent*100}%; background-color:#78c2ad;"></a>
							</div>
							<div style="margin:0 0.5em 0.5em 0.5em;">
								<a><fmt:formatNumber value="${pm.percent}" type="percent"></fmt:formatNumber></a>
								<a><fmt:formatNumber value="${pm.currentAmount}"
										groupingUsed="true"></fmt:formatNumber>원</a>
								<c:if test="${pm.restDay<0}">
									<a class="">D${pm.restDay}</a>
								</c:if>
								<c:if test="${pm.restDay==0}">
									<a class="">D-Day</a>
								</c:if>
							</div>
						</div>
					</div>
					<c:if test="${vs.index%3==2}"> </div> </c:if>
		</c:forEach>
		</c:if>
	</div>
</div>
</div>
<div class="footer">
	<footer class="py-3" style="background:#78c2ad;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyrightⓒ2019 유니세프 All rights reserved.</p>
		</div>
	</footer>
</div>
</body>
</html>