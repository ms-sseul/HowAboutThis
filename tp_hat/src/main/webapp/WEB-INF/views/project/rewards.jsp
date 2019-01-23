<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>

</style>
<title>펀딩하기</title>
<body>

<jsp:include page="../web/header.jsp" />

<div class="container">
	<div style="margin: 4em 0 0 0;">
		<!-- header : 프로젝트 이름/기본설명 -->
		<div style="margin: 3em 0 0 0; text-align: center;">
			<h1>${projectTitle}</h1>
			<p>펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
		</div>

		<!-- content : 결제페이지 -->
		<div class="wpurchase-wrap">
			<form name="purchaseForm" id="purchaseForm" method="post">
				<div class="wpurchase-reward card border-secondary mb-3"">
					<div class="reward-list">
						<ul class="list-group">
							<c:forEach items="${rewards}" var="reward" varStatus="r">
								<li class="list-group-item list-group-item-action">
									<dl class="reward-box  active" data-rid="64103">
										<div class="rewards">
											<label class="checkbox " for="check"> 
											<input type="hidden" id="amount" class="amount" value="${reward.amount}" />
											<input id="check" class="rewardCheck" type="checkbox" />
											</label>
											<p class="">${reward.amount}원을후원합니다.</p>
											<p class="">${reward.step}단계:${reward.component}</p>
											<p class="title">수량을 입력해 주세요</p>
											<!-- 모바일에서 안보임, 수정해야함
											<select class="form-control" id="exampleSelect1">
										        <option>1</option>
										        <option>2</option>
										        <option>3</option>
										        <option>4</option>
										        <option>5</option>
										    </select> -->
											<input id="count" class="count" type="number" value="0" placeholder="갯수를 입력해 주세요"/>
										</div>
									</dl>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</form>
			<div class="btn-wrap">
				<form id="supportForm" action="rewards" method="post">
					<input type="hidden" name="pno" value="${pno}" /> <input
						type="hidden" id="userPoint" value="${userPoint}" />
					<p class="confirm">
						프로젝트에 <input id="supportAmount" name="supportAmount" value="0"
							readonly="readonly" />원을 펀딩합니다.
					</p>
					<button type="submit" id="btnSupport" class="wz btn primary">후원하기</button>
					<i class="icon chevron-right"></i>

				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		
		$('.count').toggle(); // 수량 입력 input 처음엔 안보여줌 
		var division = $('.reward-list');		// div 찾아줌
		var userPoint = $('#userPoint').val(); // 로그인 사용자 포인트  
		var x = $('.count'); // count input 찾아줌
		var amount;
		var total;
		var count;
		var supportAmount = 0;
		var templet = /^[0-9]+$/
		division.on('change', '.rewards .rewardCheck', function() {
			$(this).parent().nextAll('#count').toggle(); // 선택된 체크박스 안에 있는 input 토글
				amount  = $(this).prevAll('#amount').val();
				count = $(this).parent().nextAll('#count').val();
				total = amount * count;
			if ($(this).is(':checked')) {
				console.log('total: ' + total);

				x.on('change', function() {
					if(templet.test($(this).val())){
					console.log('입력 범위 내에 있음 ');
					supportAmount = calcTotal();
					$('#supportAmount').val(supportAmount);						
				} else {
					console.log('입력 범위를 벗어남');
					$(this).val(0);
				}
				});
			} else {
				supportAmount = calcTotal();
				supportAmount -= total;
			}
			$('#supportAmount').val(supportAmount);
		});
		function calcTotal() {
			var totalAmount =0;
			var checkBoxes = $('.rewardCheck').toArray();
			var amountClasses = $('.amount').toArray();
			var counts = $('.count').toArray();
			for(var i = 0; i < checkBoxes.length ; i++){
					var sum = amountClasses[i].value * counts[i].value;
					totalAmount += sum;
			}
			return totalAmount;
		}

		$('#btnSupport').click(function(event) {
			var result = confirm('후원을 진행 하시겠습니까?');
				
			if(result){
				if(supportAmount ==0){
					event.preventDefault();
					alert('후원 금액에 해당하는 리워드와 갯수를 입력해 주세요');
				}else if(userPoint > supportAmount){
					document.$('#supportForm').submit();
				} else{
					event.preventDefault();
					alert('포인트가 부족합니다. 포인트를 충전해 주세요.');
				}
			} 
		});	
		
		
	});
</script>
</body>
</html>