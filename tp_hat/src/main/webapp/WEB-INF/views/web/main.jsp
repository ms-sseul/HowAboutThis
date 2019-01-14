<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  
<title>MAIN</title>

</head>
<body>

<!-- 상단메뉴바(고정) -->
<div class="topnav" id="myTopnav">
    <nav class="navbar navbar-expand-sm navbar-dark bg-info sticky-top">
      <a class="navbar-brand" href="#">여기어때</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" 
      	aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav mr-auto">
		  <!-- navbar 메뉴 추가시 주석 해제 
		  <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Features</a>
          </li>
          -->
          <li class="nav-item dropdown">
		  	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 둘러보기</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">카테고리1</a> 
					<a class="dropdown-item" href="#">카테고리2</a> 
					<a class="dropdown-item" href="#">카테고리3</a>
				</div>
		  </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#">검색</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">로그인</a>
          </li>
        </ul>
      </div>
    </nav>
</div>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" onclick="location.href='#'"
          		style="background-image: url(''); cursor: pointer;">
            <div class="carousel-caption d-none d-md-block">
              <h3>First Slide</h3>
              <p>This is a description for the first slide.</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Second Slide</h3>
              <p>This is a description for the second slide.</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Third Slide</h3>
              <p>This is a description for the third slide.</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
</div>

<div class="content-category">
		<!-- onclick : tech.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='tech'">테크 & 가전
		<span class="badge badge-light"></span>
		</button>
		<!-- onclick : fasion.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='fasion'">패션
		<span class="badge badge-light"></span>
		</button>
		<!-- onclick : design.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='design'">디자인
		<span class="badge badge-light"></span>
		</button>
		<!-- onclick : animal.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='animal'">반려동물
		<span class="badge badge-light"></span>
		</button>
		<!-- onclick : hobby.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='hobby'">취미
		<span class="badge badge-light"></span>
		</button>
		<!-- onclick : social.jsp 연결 -->
		<button class="btn btn-primary" onclick="location.href='social'">소셜
		<span class="badge badge-light"></span>
		</button>
</div>
	
<div class="project-container">

	<h3 style="padding: 10px;">마감 임박순</h3>
	<div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
          	<!-- 해당 프로젝트 연결 / 아래 썸네일도 동일합니다 -->
            <a href=""><img class="card-img-top" src=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="description">Project One</a>
              </h4>
              <p class="card-text">Hello!</p>
            </div>
           <div>
              	<a>Now Progress</a>
              </div>
              <div class="progress">
              	<a class="progress-bar" style="0%"></a>
              </div>
              <div>
              	<a class="">%</a>
              	<a class="">money</a>
              	<a class="">day</a>
           </div>
          </div>
        </div>
        
         <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src=""></a>
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
              	<a class="progress-bar" style="0%"></a>
              </div>
              <div>
              	<a>%</a>
              	<a>money</a>
              	<a>day</a>
           </div>
          </div>
        </div>
        
         <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src=""></a>
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
              	<a class="progress-bar" style="0%"></a>
              </div>
              <div>
              	<a>%</a>
              	<a>money</a>
              	<a>day</a>
           </div>
          </div>
        </div>
	</div>
	
	<h3 style="padding: 10px;">인기순</h3>
	<div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src=""></a>
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
              	<a class="progress-bar" style="0%"></a>
              </div>
              <div>
              	<a>%</a>
              	<a>money</a>
              	<a>day</a>
           </div>
          </div>
        </div>
        
         <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src=""></a>
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
              	<a class="progress-bar" style="0%"></a>
              </div>
              <div>
              	<a>%</a>
              	<a>money</a>
              	<a>day</a>
           </div>
          </div>
        </div>
        
         <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src=""></a>
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
              	<a class="progress-bar" style="0%"></a>
              </div>
              <div>
              	<a>%</a>
              	<a>money</a>
              	<a>day</a>
           </div>
          </div>
        </div>
	</div>
	
	<h3 style="padding: 10px;">최신순</h3>
	<div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src=""></a>
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
              	<a class="progress-bar" style="0%"></a>
              </div>
              <div>
              	<a>%</a>
              	<a>money</a>
              	<a>day</a>
           </div>
          </div>
        </div>
        
         <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src=""></a>
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
              	<a class="progress-bar" style="0%"></a>
              </div>
              <div>
              	<a>%</a>
              	<a>money</a>
              	<a>day</a>
           </div>
          </div>
        </div>
        
        
        
         <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src=""></a>
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
              	<a class="progress-bar" style="0%"></a>
              </div>
              <div>
              	<a>%</a>
              	<a>money</a>
              	<a>day</a>
           </div>
          </div>
        </div>
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