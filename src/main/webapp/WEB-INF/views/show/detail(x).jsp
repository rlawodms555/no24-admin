<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="../resources/css/commons.css">
<title>No24 detail</title>
<style type="text/css">
	th {
		background-color: LightGray;
		width: 150px;
		text-align: center;
	}
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<div class="row">
		<div class="col-12">
			<%@ include file="../commons/navbar.jsp" %>
		</div>
	</div>
	
	<div class="container mt-5">
	<div class="row">
		<div class="col-12">
			<p>${topCategory.name } > ${category.name }</p>
			<h2><strong>${show.name }</strong></h2>
			<span><fmt:formatDate value="${show.beginDate }" /> ~ <fmt:formatDate value="${show.endDate }" /></span>&nbsp;|&nbsp;<span style="margin-left: 10px;">${place.placeName }</span>
			<p class="w3-border-bottom w3-border-black"></p>
		</div>
	</div>
	<div class="row mb-5">
   		<div class="col-4">
			  <div class="card" style="width:300px">
			    <img class="card-img-top" src="../resources/images/NO24/뮤지컬001.jpg" alt="poster" style="width:100%">
			    <div class="mt-4">
					<span class="">하트이미지</span>
					<span class="">좋아요숫자</span>
					<span class="">Likes</span>
			    </div>
			  </div>
		</div>
		    
		<div class="col-8">
			<dl style=" border-bottom: 2px solid #000;">
				<dt>등급</dt>
				<dd>${show.viewingGradeName }</dd>
				<dt>관람시간</dt>
				<dd>${show.runningTime }</dd>
				<dt>출연</dt>
				<dd>
					<c:forEach var="actor" items="${actors }">
						<p style="display: inline-block; margin-right: 5px;">${actor.actorName }</p>
					</c:forEach>
				</dd>
				<dt class="mb-1">가격</dt>
				<dd class="bg-light">
					<c:forEach var="seat" items="">
						<p  style="display: inline-block; margin-bottom: 0px;">100석</p>
						<fmt:formatNumber value="10000" /> 10000 원 <br/>
					</c:forEach>
					<p>R석 10000원</p>
					<p>S석 10000원</p>
				</dd>
			</dl>
		</div>
	</div>
	
	<div class="row d-flex justify-content-center mt-5 mb-3">
   		<a href="modifyForm.do?showNo=${show.no }" class="btn btn-outline-dark float-center mr-3">공연정보 수정하기</a>
   		<a href="putShowForm.do" class="btn btn-danger float-center">상연 등록하기</a>
   	</div>
	
	<p class="w3-border-bottom w3-border-black mt-5"></p>
	
	<p>상연정보 뿌려야 함</p>
	<div class="row d-flex justify-content-center">
		<div class="co1-12">
			<table class="table">
				<thead>
					<tr>
			        	<th>상연 번호</th>
			        	<th>상연 요일</th>
			        	<th>시작시간</th>
			      	</tr>
			    </thead>
			    <tbody>
			    	<p>for문 돌려야 함</p>
			    	<tr>
			        	<td>John</td>
			        	<td>john@example.com</td>
			        	<td>Doe</td>
			      	</tr>
			    </tbody>
		    </table>
		
		</div>
	</div>
	</div>
	
	
	<!-- footer -->
	<div class="row mt-5">
		<div class="col-12">
			<%@ include file="../commons/footer.jsp" %>
		</div>
	</div>
</body>
</html>