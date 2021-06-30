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
<title>NO24</title>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	
	<!-- navbar -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../commons/navbar.jsp" %>
		</div>
	</div>
	
	<div class="container">
		<div class="row card mt-5">
			<div class="col-12">
			<h2 class="w3-border-bottom w3-border-red w3-padding-16">상연등록</h2>
				<form id="show-form" method="post" action="putShowRegister.do">
			    	<div class="form-group mt-5">
	  					<strong><label for="date">공연명</label></strong>
				    	<select name="showNo" id="showNo" style="width: 400px; height: 35px;">
		    				<option value="" disabled selected>공연 선택</option>
							<c:forEach var="show" items="${shows }">
		    					<option value="${show.no }">${show.name }</option>
							</c:forEach>
						</select>
					</div>
			    	<div class="form-group was-validated mt-5">
			      		<strong><label for="day">상연날짜</label></strong>
			      		<input type="text" class="form-control" id="day" name="day" placeholder="상연날짜를 입력해주세요. 예) 2021년 4월 3일(토)" required>
			    	</div>
			    	<div class="form-group was-validated mt-5">
	  					<strong><label for="startTime">상연시간</label></strong>
			      		<input type="text" class="form-control" id="startTime" name="startTime" placeholder="상연시간을 입력해주세요. 예) 오후 2시" required>
					</div>
			    	
			    	<div class="row d-flex justify-content-center mt-5 mb-3">
			    		<button type="submit" id="put-show" class="btn btn-danger float-right mr-2">등록</button>
			    		<a href="list.do" class="btn btn-outline-dark float-right">취소</a>
			    	</div>
			  	</form>
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
	$("#put-show").click(function() {
		if ($("#showNo").val() == null) {
			alert("공연명을 선택해주세요.");
			return false;
		}
	});
</script>
</body>
</html>