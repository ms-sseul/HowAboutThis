<%@ page language="java" contentType="text/html; charset=EUC-KR"
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

<title>Project Create</title>
</head>
<body>

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

<h1>프로젝트 만들기</h1>

<div class="container">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">기본 정보</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">리워드</a>
    </li>
  </ul>
  
  <div class="tab-content">
  	<div id="home" class="container tab-pane active">
  	<div>프로젝트 번호</div> 
  		<div>ㅇㅇ</div>
  	<div>프로젝트 제목</div> 
  		<div><input type="text"/></div>
  	<div>목표 금액</div> 
  		<div><input type="text" />원</div>
  	<div>대표 이미지</div> 
  		<div>
	  		<a href="#">이미지
	  			<div style="background-image: url('')"></div>
	  				<ul>
	  					<li>사이즈</li>
	  					<li>용량</li>
	  				</ul>
  			</a>
  		</div>
  	<div>프로젝트 스토리</div>
  		<div>
  			<textarea rows="5" cols="10"></textarea>
  		</div>
  	<div>카테고리</div> 
  		<div>
  			<select>
  				<option>프로젝트 카테고리</option>
  				<option>테크 & 가전</option>
  				<option>패션</option>
  				<option>디자인</option>
  				<option>반려동물</option>
  				<option>취미</option>
  				<option>소셜</option>
  			</select>
  		</div>
  		
  	<div>프로젝트 종료일</div> 
  		<div><input type="text" placeholder="yyyy-MM-dd"/></div>
  		<div>달력 아이콘</div>
  		
  	</div>
  	
  	<div id="menu1" class="container tab-pane fade">
  		<div>리워드 #</div>
  		<div>
  			<span>금액</span>
  			<input type="text"/> 원
  			<span>정렬순서</span>
  			<input type="number">
  			<a>삭제</a>
  		</div>
  		<div>
  			<span>리워드 명</span>
  			<input type="text" />
  		</div>
  		<div>
  			<span>상세설명</span>
  			<input type="text">
  		</div>
  		<div>
  			<span>옵션조건</span>
  			<input type="radio"/>
  			<span>옵션1</span>
  		</div>
  		<div>
  			<input type="radio"/>
  			<span>옵션2</span>
  		</div>
  		<div>
  			<input type="radio"/>
  			<span>옵션3</span>
  		</div>
  		<div>
  			<span>배송 조건</span>
  			<input type="checkbox"/>
  			<span>배송을 위해 주소지가 필요합니다</span>
  			<span>배송료</span>
  			<input type="text"> 원
  		</div>
  		<div>
  			<span>제한 수량</span>
  			<span>리워드를 </span> <input type="text"/> <span>개로 제한합니다</span>
  		</div>
  		<div>
  			<span>발송시작일</span>
  			<select>
  				<option>년</option>
  				<option>2019</option>
  				<option>2020</option>
  				<option>2021</option>
  			</select>
  			<select>
  				<option>월</option>
  				<option>1월</option>
  				<option>2월</option>
  				<option>3월</option>
  				<option>4월</option>
  				<option>5월</option>
  				<option>6월</option>
  				<option>7월</option>
  				<option>8월</option>
  				<option>9월</option>
  				<option>10월</option>
  				<option>11월</option>
  				<option>12월</option>
  			</select>
  			<select>
  				<option>시기</option>
  				<option>초(1 ~ 10일)</option>
  				<option>중(11 ~ 20일)</option>
  				<option>말(21 ~ 말일)</option>
  			</select>
  		</div>
  			<button>저장하기</button>
  		
  		<div>
	  		<button>새 리워드 만들기</button>
	  	</div>
  	</div>
  		<a>
  			<button>저장하기</button>
  		</a>
  		<a>
  			<button>다음 단계로</button>
  		</a>
  </div>
</div>

</body>
</html>