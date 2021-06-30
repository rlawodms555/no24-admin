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
<link rel="stylesheet" href="resources/css/commons.css">
<title>No24 home</title>
<style type="text/css">
	a { text-decoration: none !important }
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<div class="row">
		<div class="col-12">
			<%@ include file="commons/navbar.jsp" %>
		</div>
	</div>
	
	<div class="container mt-5">
		<div class="row">
	    	<div class="col-12">
				<h2 class="text-center mb-4">공지사항</h2>
				<table class="table">
		  		<thead class="bg-light">
			  		<colgroup>
						<col width="15%">
						<col width="40%">
						<col width="30%">
						<col width="15%">
					</colgroup>
		  			<tr>
			        	<th>타입</th>
			        	<th>제목</th>
			        	<th>등록일</th>
			        	<th>조회수</th>
			      	</tr>
			    </thead>
			    <tbody>
			    <c:forEach var="noticeList" items="${noticeList }">
			    	<tr>
			        	<td><button type="button" class="btn btn-outline-danger btn-sm">${noticeList.type }</button></td>
			        	<td><a href="board/notice/detail.do?pageNo=1&noticeNo=${noticeList.no }" class="text-primary" id="notice-title">${noticeList.title }</a></td>
			        	<td><fmt:formatDate value="${noticeList.createdDate }"/></td>
			        	<td>${noticeList.views }</td>
			      	</tr>
			    </c:forEach>
			    </tbody>
				</table>
				<div class="mt-5 d-flex justify-content-center">
					<a href="/no24-admin/board/notice/list.do?sort=date" class="w3-dark-grey w3-hover-shadow w3-padding-16 d-flex justify-content-center" style="width:50%">공지사항 더보기 +</a>
				</div>
			</div>
		</div>
		
		<br>
		<br>
		<br>
		
		<div class="row">
    		<div class="col-12">
		    	<h2 class="text-center mb-4">공연정보</h2>
				<table class="table">
			  		<thead class="bg-light">
			  			<tr>
				        	<th>번호</th>
				        	<th>공연명</th>
		        			<th>시작일</th>
		        			<th>종료일</th>
		        			<th>등록일</th>
				      	</tr>
				    </thead>
				    <tbody>
				    <c:forEach var="showList" items="${showList }">
		    			<tr>
		        			<td>${showList.no }</td>
		        			<td><a href="/genre/detail.do?no=${showList.no }" class="text-primary">${showList.name }</a></td>
		        			<td><fmt:formatDate value="${showList.beginDate }"/></td>
		        			<td><fmt:formatDate value="${showList.endDate }"/></td> 
		        			<td><fmt:formatDate value="${showList.createdDate }"/></td> 
		      			</tr>
		    		</c:forEach>
				    </tbody>
				</table>
				<div class="mt-5 d-flex justify-content-center">
					<a href="/no24-admin/show/list.do?categoryNo=-1&sort=date" class="w3-dark-grey w3-hover-shadow w3-padding-16 d-flex justify-content-center" style="width:50%">공연정보 더보기 +</a>
				</div>
			</div>
    	</div>
	</div>
	<!-- footer -->
	<div class="row mt-5">
		<div class="col-12">
			<%@ include file="commons/footer.jsp" %>
		</div>
	</div>
</body>
</html>