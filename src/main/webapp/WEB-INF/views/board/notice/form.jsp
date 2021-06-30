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
<title>NO24</title>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	
	<!-- navbar -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../../commons/navbar.jsp" %>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-12">
		
			<h2 class="w3-border-bottom w3-border-red w3-padding-16">공지쓰기</h2>
				<form action="add.do" method="post">
			    	<select name="type" style="width: 200px; height: 30px; margin-top: 14px; margin-bottom: 14px;">
	    				<option value="" disabled selected>공지타입을 선택하세요.</option>
	    				<option value="서비스점검">서비스점검</option>
	    				<option value="티켓오픈">티켓오픈</option>
	    				<option value="변경/취소">변경/취소</option>
					</select>
			    	<div class="form-group">
			      		<label for="title">제목</label>
			      		<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요.">
			    	</div>
			    	<div class="form-group">
	  					<label for="content">내용</label>
	  					<textarea class="form-control" rows="15" id="content" name="content" placeholder="내용을 입력하세요."></textarea>
					</div>
			    	<div class="form-group form-check">
			      		<label class="form-check-label">
			        	<input class="form-check-input" type="checkbox" name="remember"> Remember me
			      		</label>
			    	</div>
			    		<button type="submit" class="btn btn-danger float-right">등록</button>
			  	</form>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	
	<!-- footer -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../../commons/footer.jsp" %>
		</div>
	</div>

</body>
</html>