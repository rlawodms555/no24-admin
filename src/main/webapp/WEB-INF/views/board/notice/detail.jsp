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
<link rel="stylesheet" href="../../resources/css/commons.css">
<title>No24</title>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	
	<!-- navbar -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../../commons/navbar.jsp" %>
		</div>
	</div>
	
	<div class="container mb-5">
		<h2 class="text-center"><i class='far fa-file-alt' style="color: orange; margin-right: 10px;"></i>공지사항</h2>
		
		<div class="w3-panel w3-leftbar w3-border-orange mt-5">
			<button type="button" class="btn btn-outline-danger btn-sm">${notice.type }</button>
    		<h4>${notice.title }</h4>
  		</div>
  		
  		<div class="row mt-5 mb-2">
  			<div class="col-12 d-flex justify-content-end">
  				▸등록일: <fmt:formatDate value="${notice.createdDate }"/>
  				▸조회수: ${notice.views }
  			</div>
  		</div>
  
  		<div class="w3-border-top w3-border-bottom w3-border-light-grey w3-padding-16">
  			<c:out value="${notice.htmlContent }" escapeXml="false"></c:out>
  		</div>
  
		<div class="row float-right mt-5">
			<div class="col-12">
			<a href="/no24-admin/board/notice/list.do?pageNo=${param.pageNo }" class="btn text-danger">
				<strong><i class='far fa-sticky-note' style='font-size:24px; margin-right: 10px;'></i>목록보기</strong>
			</a>
			<a href="/no24-admin/board/notice/modifyform.do?pageNo=${param.pageNo }&noticeNo=${notice.no }" class="btn text-danger">
				<strong><i class='far fa-edit' style='font-size:24px; margin-right: 10px;'></i>수정</strong>
			</a>
			<a href="/no24-admin/board/notice/delete.do?noticeNo=${notice.no }" class="btn text-danger">
				<strong><i class='fas fa-trash-alt' style='font-size:24px; margin-right: 10px;'></i>삭제</strong>
			</a>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<!-- footer -->
	<div class="row mt-5">
		<div class="col-12">
			<%@ include file="../../commons/footer.jsp" %>
		</div>
	</div>
	
</body>
</html>