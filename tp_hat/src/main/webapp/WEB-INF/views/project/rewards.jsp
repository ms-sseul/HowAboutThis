<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>	
<meta charset="UTF-8">
<title>REWARDS</title>
<body>

<!-- nav : 상단메뉴바(고정) -->
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

<!-- header : 프로젝트 이름/기본설명 -->
<header style="margin:3em 10em;">
<h1>{프로젝트 이름}</h1>
<p class="sub-text">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
</header>

<!-- content : 결제페이지 -->
<div class="wpurchase-wrap">
	<form name="purchaseForm" id="purchaseForm" method="post">
		<div class="wpurchase-reward">
			<div class="reward-list">
				<ul>
					<li>
						<dl class="reward-box  active" data-rid="64103">
							<dt>
								<label class="checkbox"> 
									<input type="checkbox">
								</label>
							</dt>
							<dd>
								<p class="">{금액}원을 후원합니다.</p>
								<p class="">{펀딩 1단계 이름}</p>

								<div class="checked-area">
									<div class="amount">
										<p class="title">수량
										</p>
										<p class="input-area">
											<button type="button">-</button>
											<input type="number" value="0" disabled>
											<button type="button">+</button>
										</p>
								</div>
								<!-- 옵션영역 (옵션 없으면 추가X) -->
								<div class="option">
									<p class="title">옵션</p>
									<p class="input-area">
										<select style="width: 50%; height: 32px;">
											<option value="">옵션을 선택하세요.</option>
											<option value="option1">option1</option>
											<option value="option2">option2</option>
											<option value="option3">option3</option>
										</select>
									</p>
								</div>
								</div>
							</dd>
						</dl>
					</li>

					<li>
						<dl class="reward-box  active" data-rid="64103">
							<dt>
								<label class="checkbox"> 
									<input type="checkbox">
								</label>
							</dt>
							<dd>
								<p class="">{금액}원을 후원합니다.</p>
								<p class="">{펀딩 2단계 이름}</p>

								<div class="checked-area">
									<div class="amount">
										<p class="title">수량
										</p>
										<p class="input-area">
											<button type="button">-</button>
											<input type="number" value="0" disabled>
											<button type="button">+</button>
										</p>
								</div>
								<!-- 옵션영역 (옵션 없으면 추가X) -->
								<div class="option">
									<p class="title">옵션</p>
									<p class="input-area">
										<select style="width: 50%; height: 32px;">
											<option value="">옵션을 선택하세요.</option>
											<option value="option1">option1</option>
											<option value="option2">option2</option>
											<option value="option3">option3</option>
										</select>
									</p>
								</div>
								</div>
							</dd>
						</dl>
					</li>
					
										<li>
						<dl class="reward-box  active" data-rid="64103">
							<dt>
								<label class="checkbox"> 
									<input type="checkbox">
								</label>
							</dt>
							<dd>
								<p class="">{금액}원을 후원합니다.</p>
								<p class="">{펀딩 3단계 이름}</p>

								<div class="checked-area">
									<div class="amount">
										<p class="title">수량
										</p>
										<p class="input-area">
											<button type="button">-</button>
											<input type="number" value="0" disabled>
											<button type="button">+</button>
										</p>
								</div>
								<!-- 옵션영역 (옵션 없으면 추가X) -->
								<div class="option">
									<p class="title">옵션</p>
									<p class="input-area">
										<select style="width: 50%; height: 32px;">
											<option value="">옵션을 선택하세요.</option>
											<option value="option1">option1</option>
											<option value="option2">option2</option>
											<option value="option3">option3</option>
										</select>
									</p>
								</div>
								</div>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
	</form>
	<div class="btn-wrap">
		<p class="confirm">
		{프로젝트이름}에 {리워드 선택금액합}원을 펀딩합니다.
		</p>
		<button class="wz button primary" onclick="purchaseNextStep();">
			다음 단계로 <i class="icon chevron-right"></i>
		</button>
	</div>
</div>

</body>
</html>