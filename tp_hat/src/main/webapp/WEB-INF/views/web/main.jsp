<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>MAIN</title>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- 배너 이미지출력  -->
			<c:forEach items="${bannerImageList}" var="bannerImage" varStatus="b">
				<c:if test="${b.count==1}">
					<div class="carousel-item active"
						onclick="location.href='project/description?pno='+${bannerImage.pno}"
						style="background-image: url('${bannerImage.image}'); cursor: pointer;">
						<div class="carousel-caption d-none d-md-block">
							<h3>프로젝트 보러가기</h3>
						</div>
					</div>
				</c:if>
				<c:if test="${b.count>1}">
					<div class="carousel-item"
						onclick="Location.href = 'project/description?pno='+${bannerImage.pno}"
						style="background-image: url('${bannerImage.image}'); cursor: pointer;">
						<div class="carousel-caption d-none d-md-block">
							<h3>프로젝트 보러가기</h3>
						</div>
					</div>
				</c:if>
			</c:forEach>
			<%-- <!-- Slide Two - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/dummy2.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3>Second Slide</h3>
					<p>This is a description for the second slide.</p>
				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/dummy3.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3>Third Slide</h3>
					<p>This is a description for the third slide.</p>
				</div>
			</div> --%>
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

	<div class="content-category">
		<!-- onclick : tech.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='tech'">
			테크 & 가전 <span class="badge badge-light"></span>
		</button>
		<!-- onclick : fasion.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='fasion'">
			패션 <span class="badge badge-light"></span>
		</button>
		<!-- onclick : design.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='design'">
			디자인 <span class="badge badge-light"></span>
		</button>
		<!-- onclick : animal.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='animal'">
			반려동물 <span class="badge badge-light"></span>
		</button>
		<!-- onclick : hobby.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='hobby'">
			취미 <span class="badge badge-light"></span>
		</button>
		<!-- onclick : social.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='social'">
			소셜 <span class="badge badge-light"></span>
		</button>
	</div>

	<div class="project-container">

		<h3 style="padding: 10px;">마감 임박순</h3>
		<div class="row">
			<c:forEach items="${closingTimeProjects}" var="ctp" varStatus="index">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<!-- 해당 프로젝트 연결 / 아래 썸네일도 동일합니다 -->
						<div>
							<a href=""><img class="card-img-top" style="height: 500px"
								src="${ctp.image.image}"></a>
						</div>
						<div class="card-body">
							<h4 class="card-title">
								<a href="description?pno=${ctp.pno}">${ctp.title}</a>
							</h4>
							<p class="card-text">${ctp.content}</p>
						</div>
						<div>
							<a></a>
						</div>
						<div class="progress">
							<a class="progress-bar progress-bar-striped active"
								role="progressbar" aria-valuemin="0" aria-valuemax="100"
								style="width:${ctp.percent*100}%"></a>
						</div>
						<div>
							<a><fmt:formatNumber value="${ctp.percent}" type="percent"></fmt:formatNumber></a>
							<a><fmt:formatNumber value="${ctp.currentAmount}"
									groupingUsed="true"></fmt:formatNumber></a>
							<c:if test="${ctp.restDay>0}">
								<a class="">D-${ctp.restDay}</a>
							</c:if>
							<c:if test="${ctp.restDay==0}">
								<a class="">D-Day</a>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
			<%-- <div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<div>
						<a href="#"><img class="card-img-top" style="height: 500px"
							src="${pageContext.request.contextPath}/resources/images/dummy5.jpg"></a>
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Hello!</p>
					</div>
					<div>
						<a>Now Progress</a>
					</div>
					<div class="progress">
						<a class="progress-bar" style=""></a>
					</div>
					<div>
						<a>%</a> <a>money</a> <a>day</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<div>
						<a href="#"><img class="card-img-top" style="height: 500px"
							src="${pageContext.request.contextPath}/resources/images/dummy6.jpg"></a>
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Hello!</p>
					</div>
					<div>
						<a>Now Progress</a>
					</div>
					<div class="progress">
						<a class="progress-bar" style=""></a>
					</div>
					<div>
						<a>%</a> <a>money</a> <a>day</a>
					</div>
				</div>
			</div> --%>
		</div>

		<h3 style="padding: 10px;">인기순</h3>
		<div class="row">
			<c:forEach items="${popularProjects}" var="pp" varStatus="index">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<!-- 해당 프로젝트 연결 / 아래 썸네일도 동일합니다 -->
						<div>
							<a href=""><img class="card-img-top" style="height: 500px"
								src="${pp.image.image}"></a>
						</div>
						<div class="card-body">
							<h4 class="card-title">
								<a href="description?pno=${pp.pno}">${pp.title}</a>
							</h4>
							<p class="card-text">${pp.content}</p>
						</div>
						<div>
							<a></a>
						</div>
						<div class="progress">
							<a class="progress-bar progress-bar-striped active"
								role="progressbar" aria-valuemin="0" aria-valuemax="100"
								style="width:${pp.percent*100}%"></a>
						</div>
						<div>
							<a><fmt:formatNumber value="${pp.percent}" type="percent"></fmt:formatNumber></a>
							<a><fmt:formatNumber value="${pp.currentAmount}"
									groupingUsed="true"></fmt:formatNumber></a>
							<c:if test="${pp.restDay>0}">
								<a class="">D-${pp.restDay}</a>
							</c:if>
							<c:if test="${pp.restDay==0}">
								<a class="">D-Day</a>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
			<%-- <div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<div>
						<a href="#"><img class="card-img-top" style="height: 500px"
							src="${pageContext.request.contextPath}/resources/images/dummy7.jpg"></a>
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Hello!</p>
					</div>
					<div>
						<a>Now Progress</a>
					</div>
					<div class="progress">
						<a class="progress-bar" style=""></a>
					</div>
					<div>
						<a>%</a> <a>money</a> <a>day</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<div>
						<a href="#"><img class="card-img-top" style="height: 500px"
							src="${pageContext.request.contextPath}/resources/images/dummy8.jpg"></a>
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Hello!</p>
					</div>
					<div>
						<a>Now Progress</a>
					</div>
					<div class="progress">
						<a class="progress-bar" style=""></a>
					</div>
					<div>
						<a>%</a> <a>money</a> <a>day</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<div>
						<a href="#"><img class="card-img-top" style="height: 500px"
							src="${pageContext.request.contextPath}/resources/images/dummy9.jpg"></a>
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Hello!</p>
					</div>
					<div>
						<a>Now Progress</a>
					</div>
					<div class="progress">
						<a class="progress-bar" style=""></a>
					</div>
					<div>
						<a>%</a> <a>money</a> <a>day</a>
					</div>
				</div>
			</div> --%>
		</div>

		<h3 style="padding: 10px;">최신순</h3>
		<div class="row">
			<c:forEach items="${lastestProjects}" var="lp" varStatus="index">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<!-- 해당 프로젝트 연결 / 아래 썸네일도 동일합니다 -->
						<div>
							<a href=""><img class="card-img-top" style="height: 500px"
								src="${lp.image.image}"></a>
						</div>
						<div class="card-body">
							<h4 class="card-title">
								<a href="description?pno=${lp.pno}">${lp.title}</a>
							</h4>
							<p class="card-text">${lp.content}</p>
						</div>
						<div>
							<a></a>
						</div>
						<div class="progress">
							<a class="progress-bar progress-bar-striped active"
								role="progressbar" aria-valuemin="0" aria-valuemax="100"
								style="width:${lp.percent*100}%"></a>
						</div>
						<div>
							<a><fmt:formatNumber value="${lp.percent}" type="percent"></fmt:formatNumber></a>
							<a><fmt:formatNumber value="${lp.currentAmount}"
									groupingUsed="true"></fmt:formatNumber></a>
							<c:if test="${lp.restDay>0}">
								<a class="">D-${lp.restDay}</a>
							</c:if>
							<c:if test="${lp.restDay==0}">
								<a class="">D-Day</a>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
			<%-- <div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<div>
						<a href="#"><img class="card-img-top" style="height: 500px"
							src="/controller/resources/images/dummy10.jpg"></a>
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Hello!</p>
					</div>
					<div>
						<a>Now Progress</a>
					</div>
					<div class="progress">
						<a class="progress-bar" style=""></a>
					</div>
					<div>
						<a>%</a> <a>money</a> <a>day</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<div>
						<a href="#"><img class="card-img-top" style="height: 500px"
							src="${pageContext.request.contextPath}/resources/images/dummy11.jpg"></a>
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Hello!</p>
					</div>
					<div>
						<a>Now Progress</a>
					</div>
					<div class="progress">
						<a class="progress-bar" style=""></a>
					</div>
					<div>
						<a>%</a> <a>money</a> <a>day</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<div>
						<a href="#"><img class="card-img-top" style="height: 500px"
							src="${pageContext.request.contextPath}/resources/images/dummy12.jpg"></a>
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Hello!</p>
					</div>
					<div>
						<a>Now Progress</a>
					</div>
					<div class="progress">
						<a class="progress-bar" style=""></a>
					</div>
					<div>
						<a>%</a> <a>money</a> <a>day</a>
					</div>
				</div>
			</div> --%>
		</div>
		<!-- 더보기 버튼 : 누르면 프로젝트 추가로 불러오는 기능 넣어주세요 -->
		<div class="more-project" style="margin: 1em">
			<button style="width: 100%; height: 30px;">더보기</button>
		</div>

	</div>
	<div class="footer">
		<footer class="py-5 bg-info">
			<div class="container">
				<p class="m-0 text-center text-white">Footer</p>
			</div>
		</footer>
	</div>

</body>
</html>