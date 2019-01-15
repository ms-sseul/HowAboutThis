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

<jsp:include page="../web/header.jsp" />

<h1>프로젝트 만들기</h1>

<form class="container">

  <div>
  	<div>
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
  			<textarea rows="5" cols="50"></textarea>
  		</div>
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
  		
  	<div>
  		<div>리워드 #</div>
  		<div>
  			<span>금액</span>
  			<input type="text"/> 원
  			<span>정렬순서</span>
  			<select>
  				<option>1</option>
  				<option>2</option>
  				<option>3</option>
  				<option>4</option>
  				<option>5</option>
  			</select>
  			<a>삭제</a>
  		</div>
  		
  		<div>
  			<span>상세설명</span>
  			<input type="text">
  		</div>
  	</div>	
  	
  		<div>
	  		<button>새 리워드 만들기</button>
	  	</div>
	  	
  	<div>프로젝트 종료일</div> 
  		<div><input type="text" placeholder="yyyy-MM-dd"/></div>
  		<div>달력 아이콘</div>
  		
  	</div>
  	
  		<a>
  			<button>취소하기</button>
  		</a>
  		<a>
  			<button>저장하기</button>
  		</a>
 
</form>

</body>
</html>