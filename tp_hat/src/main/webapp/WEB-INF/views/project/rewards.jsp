<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>REWARDS</title>
<body>

	<jsp:include page="../web/header.jsp" />

	<!-- header : 프로젝트 이름/기본설명 -->
	<header style="margin: 3em 10em;">
		<h1>${projectTitle}</h1>
		<p class="sub-text">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
	</header>

	<!-- content : 결제페이지 -->
	<div class="wpurchase-wrap">
		<form name="purchaseForm" id="purchaseForm" method="post">
			<div class="wpurchase-reward">
				<div class="reward-list">
					<ul>
						<c:forEach items="${rewards}" var="reward" varStatus="r">
							<li>
								<dl class="reward-box  active" data-rid="64103">
									<dt>
										<label class="checkbox"> <input id = "rewarCheck" type="checkbox">
										</label>
									</dt>
									<dd>
										<p class="">${reward.amount}원을 후원합니다.</p>
										<p class="">${reward.step}단계 : ${reward.component}</p>

										<div class="checked-area">
											<div class="amount">
												<p class="title">수량</p>
												<p class="input-area">
													<input id = "count" type="hidden" value="0">
												</p>
											</div>
										</div>
									</dd>
								</dl>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</form>
		<div class="btn-wrap">
			<input type="hidden" id = "userPoint" value="${userPoint}"/>
			<p class="confirm">프로젝트에 ${rewardSum}원을 펀딩합니다.</p>
			<button id="btnSupport" class="wz button primary">
				후원하기 <i class="icon chevron-right"></i>
			</button>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#btnSupport').click(function() {
				location();
			});
			$('#rewardCheck').click(function() {
				$('#count').attr('type', 'number');
			});
			
		});
	</script>
</body>
</html>