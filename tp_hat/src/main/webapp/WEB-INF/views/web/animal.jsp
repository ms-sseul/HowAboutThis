<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/category.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>ANIMAL</title>

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


<div class="category">
	<button class="btn btn-primary" onclick="location.href='tech'">테크 & 가전
	<span class="badge badge-light"></span>
	</button>
	<button class="btn btn-primary" onclick="location.href='fasion'">패션
	<span class="badge badge-light"></span>
	</button>
	<button class="btn btn-primary" onclick="location.href='design'">디자인
	<span class="badge badge-light"></span>
	</button>
	<button class="btn btn-primary" onclick="location.href='animal'">반려동물
	<span class="badge badge-light"></span>
	</button>
	<button class="btn btn-primary" onclick="location.href='hobby'">취미
	<span class="badge badge-light"></span>
	</button>
	<button class="btn btn-primary" onclick="location.href='social'">소셜
	<span class="badge badge-light"></span>
	</button>
</div>

<div class="container">
	<h1>반려동물</h1>
	<div style="float: right; padding: 10px;">
		<select>
			<option value="all">전체</option>
			<option value="end">종료된</option>
			<option value="continue">진행중</option>
		</select>
		
		<select>
			<option value="new">최신순</option>
			<option value="popular">인기순</option>
			<option value="closing">마감임박순</option>
		</select>
	</div>
<hr/>
	<div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="looking-form.jsp"><img class="card-img-top" src="dog.jpg"></a>
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
              	<a class="">%</a>
              	<a class="">money</a>
              	<a class="">day</a>
           </div>
          </div>
        </div>
        
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="looking-form.jsp"><img class="card-img-top" src="dog.jpg"></a>
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
              	<a class="">%</a>
              	<a class="">money</a>
              	<a class="">day</a>
           </div>
          </div>
        </div>
	</div>
</div>

</body>
</html>