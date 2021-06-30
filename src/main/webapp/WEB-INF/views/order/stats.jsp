<%@ page import="com.example.demo.util.DateUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>NO24</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<link rel="stylesheet" href="../resources/css/commons.css">
	<style type="text/css">
		.book-title {
			display: block;
    		height: 52px;
    		overflow: hidden;
		}
		.img-thumbnail {
			width: 202.5px;
			height: 289px;
		}
	</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
<!-- navbar -->
<div class="row">
	<div class="col-12">
		<%@ include file="../commons/navbar.jsp" %>
	</div>
</div>
<div class="container mt-5">
	<div class="row mb-3">
		<div class="col-6">
			<div class="card">
				<div class="card-header">예매현황</div>
				<div class="card-body">
					<div class="row">
						<div class="col-8 ">
							<div class="form-row">
								<div class="col-8">
									<select class="form-control" name="categoryNo" id="category-box-1">
										<option value="-1"> 전체</option>
										<c:forEach var="category" items="${categories }">
											<option value="${category.no }"> ${category.name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-4">
									<button onclick="updateOrderChart()" class="btn btn-outline-primary">조회</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-12">
							<canvas id="order-status-chart" style="width: 100%; height: 300px;"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6">
			<div class="card">
				<div class="card-header">매출현황</div>
					<div class="card-body">
					<div class="row">
						<div class="col-8 ">
							<div class="form-row">
								<div class="col-8">
									<select class="form-control" name="categoryNo" id="category-box-2">
										<option value="-1"> 전체</option>
										<c:forEach var="category" items="${categories }">
											<option value="${category.no }"> ${category.name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-4">
									<button onclick="updatePriceChart()" class="btn btn-outline-primary">조회</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-12">
						<canvas id="price-status-chart" style="width: 100%; height: 300px;"></canvas>
						</div>
					</div>
				</div>
				<div class="card-board"></div>
			</div>
		</div>
	</div>	
</div>
<!-- footer -->
<div class="row mt-5">
	<div class="col-12">
		<%@ include file="../commons/footer.jsp" %>
	</div>
</div>
<script type="text/javascript">
	// var color = Chart.helpers.color;
	var chartData = {
		labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		datasets: [{
			label: '월별 예매 주문 횟수',
			data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
		}]
	};
	var ctx = document.getElementById("order-status-chart").getContext('2d');
	var orderStatusChart = new Chart(ctx, {
		type: 'bar',
		data: chartData
	});
	
	function updateOrderChart() {
		
		var selectedCategoryNo = $("#category-box-1").val();
		
		$.getJSON("/no24-admin/api/order/orderStats.do", {categoryNo:selectedCategoryNo}, function(data) {
			// 월별 주문횟수를 chartData의 datasets에 추가한다.
			chartData.datasets[0].data = data;
			// 차트를 새로 그린다.
			orderStatusChart.update();
		})
	}
	
	
	
	
	
	var chartData2 = {
		labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		datasets: [{
			label: '월별 매출액',
			data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
		}]
	};
	var ctx = document.getElementById("price-status-chart").getContext('2d');
	var priceStatusChart = new Chart(ctx, {
		type: 'bar',
		data: chartData2
	});
	
	function updatePriceChart() {
		
		var selectedCategoryNo = $("#category-box-2").val();
		
		$.getJSON("/no24-admin/api/order/priceStats.do", {categoryNo:selectedCategoryNo}, function(data) {
			// 월별 발행부수를 chartData의 datasets에 추가한다.
			chartData2.datasets[0].data = data;
			// 차트를 새로 그린다.
			priceStatusChart.update();
		})
	}
	
</script>
</body>
</html>