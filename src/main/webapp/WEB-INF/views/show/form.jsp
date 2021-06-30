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
		
			<h2 class="w3-border-bottom w3-border-red w3-padding-16">공연등록</h2>
				<form id="show-form" method="post" action="register.do" enctype="multipart/form-data">
			    	<div class="form-group mt-4">
		  				<strong><label for="topCategoryNo">카테고리</label></strong>
				    	<select name="topCategoryNo" id="box-big" style="width: 200px; height: 30px; margin-top: 14px; margin-bottom: 14px;">
		    				<option value="" disabled selected>1차 카테고리 선택</option>
		    				<option value="1">콘서트</option>
		    				<option value="2">뮤지컬</option>
		    				<option value="3">연극</option>
		    				<option value="4">클래식</option>
		    				<option value="5">전시</option>
		    				<option value="6">아동</option>
						</select>
				    	<select name="categoryNo" id="box-small" style="width: 200px; height: 30px; margin-top: 14px; margin-bottom: 14px;">
		    				<option value="" disabled selected>2차 카테고리 선택</option>
						</select>
					</div>
			    	<div class="form-group was-validated mt-4">
			      		<strong><label for="name">공연명</label></strong>
			      		<input type="text" class="form-control" id="name" name="name" placeholder="공연명을 입력해주세요." required>
			    	</div>
			    	<div class="form-group mt-4">
		  				<strong><label for="viewingNo">관람등급</label></strong>
				    	<select name="viewingNo" style="width: 200px; height: 30px; margin-top: 14px; margin-bottom: 14px;">
		    				<option value="" disabled selected>관람등급 선택</option>
		    				<option value="1">전체관람가</option>
		    				<option value="2">7세이상</option>
		    				<option value="3">12세이상</option>
		    				<option value="4">19세이상</option>
						</select>
					</div>
			    	<div class="form-group was-validated mt-4">
	  					<strong><label for="content">관람시간</label></strong>
			      		<input type="text" class="form-control" id="runningTime" name="runningTime" placeholder="관람시간을 입력해주세요. 예)120분" required>
					</div>
			    	<div class="form-group mt-4">
			      		<strong><label for="title">공연 포스터</label></strong>
			      		<input type="file" class="form-control" id="posterImg" name="posterfile">
			    	</div>
			    	<div class="form-group mt-4">
	  					<strong><label for="content">공연시작일</label></strong>
			      		<input type="date" id="beginDate" name="beginDate">
	  					<strong><label for="content">공연종료일</label></strong>
			      		<input type="date" id="endDate" name="endDate">
					</div>
			    	<div class="form-group mt-4">
	  					<strong><label for="date">공연장소</label></strong>
				    	<select name="place" id="place" style="width: 200px; height: 30px; margin-top: 14px; margin-bottom: 14px;">
		    				<option value="" disabled selected>공연장소 선택</option>
							<c:forEach var="place" items="${placeList }">
		    					<option value="${place.no }">${place.placeName }</option>
							</c:forEach>
						</select>
					</div>
			    	<div class="form-group mt-4">
			      		<strong><label for="file">유의사항 이미지</label></strong>
			      		<input type="file" class="form-control" id="attentionImg" name="attentionfile">
			    	</div>
			    	<br>
			    	<div class="form-group mt-4">
			      		<strong><label for="file">할인정보 이미지</label></strong>
			      		<input type="file" class="form-control" id="saleImg" name="salefile">
			    	</div>
			    	<br>
			    	<div class="form-group mt-4">
			      		<strong><label for="title">공연정보 이미지</label></strong>
			      		<input type="file" class="form-control" id="showDetailImg" name="showDetailfile">
			    	</div>
			    	<br>
			    	<div class="row d-flex justify-content-center mt-4 mb-3">
			    		<button type="submit" class="btn btn-danger float-right mr-2">등록</button>
			    		<a href="list.do?pageNo=" class="btn btn-outline-dark float-right">취소</a>
			    	</div>
			  	</form>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	
	<!-- footer -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../commons/footer.jsp" %>
		</div>
	</div>

<script type="text/javascript">

	// 카테고리 선택 AJAX
	$("#box-big").change(function () {
		var $combobox = $("#box-small").empty();
		var bigCategoryNo = $(this).val();
		$.getJSON("/no24-admin/api/show/categoryList.do", {bigCatNo:bigCategoryNo}, function(result) {
			$.each(result, function(index, item) {
				var option = "<option value="+item.no+">" + item.name + "</option>"
				$combobox.append(option);
			})
		})
	});
	
</script>
</body>
</html>