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
<link rel="stylesheet" href="../resources/css/main.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&amp;subset=korean" rel="stylesheet">

<title>MAIN</title>
</head>
<body>

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
			<div>
				<!-- 수정예정 
				<a href="" onclick="location.href='theme?category=1'" style="display: inline-block;">
					<img src="../resources/images/category/category-all.jpeg" style="width:60px;height:60px;border:0;">
	 					전체보기
				</a>
				-->
			<!-- onclick : tech.jsp 연결 -->
			<button class=btn
				onclick="location.href='theme?category=1'">
				테크 & 가전 <span class="badge badge-light"></span>
			</button>
			<!-- onclick : fasion.jsp 연결 -->
			<button class="btn" onclick="location.href='theme?category=2'">
				패션 <span class="badge badge-light"></span>
			</button>
			<!-- onclick : design.jsp 연결 -->
			<button class="btn"
				onclick="location.href='theme?category=3'">
				디자인 <span class="badge badge-light"></span>
			</button>
			<!-- onclick : animal.jsp 연결 -->
			<button class="btn"
				onclick="location.href='theme?category=4'">
				반려동물 <span class="badge badge-light"></span>
			</button>
			<!-- onclick : hobby.jsp 연결 -->
			<button class="btn"
				onclick="location.href='theme?category=5'">
				취미 <span class="badge badge-light"></span>
			</button>
			<!-- onclick : social.jsp 연결 -->
			<button class="btn"
				onclick="location.href='theme?category=6'">
				소셜 <span class="badge badge-light"></span>
			</button>
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