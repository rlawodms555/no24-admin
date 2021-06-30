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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		<form id="search-form" method="get" action="list.do">
		<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16"><i class='fas fa-map-marker-alt' style="color: orange; margin-right: 10px;"></i>공연장소정보</h2>
  		<div class="row mt-5 mb-5">
  			<div class="col-12 d-flex justify-content-center">
      			<input type="hidden" name="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
				<select name="opt" style="margin-right: 10px;">
					<option value="placeName" ${param.opt eq 'placeName' ? 'selected' : '' }> 장소</option>
					<option value="address" ${param.opt eq 'address' ? 'selected' : '' }> 주소</option>
				</select>
				<input type="text" placeholder="검색어를 입력하세요" name="keyword" id="keyword-field" value="${param.keyword }">
				<button type="button" class="btn" id="btn-search">
					<i class="fa fa-search" style="font-size:24px"></i>
				</button>
  			</div>
		</div>
		
		<div class="d-flex justify-content-between mb-1">
			<div>
				<select name="local" style="margin-right: 10px;">
					<option value="" selected> 전체</option>
					<option value="서울" ${param.local eq '서울' ? 'selected' : '' }> 서울</option>
					<option value="경기/인천" ${param.local eq '경기/인천' ? 'selected' : '' }> 경기/인천</option>
					<option value="충청/강원" ${param.local eq '충청/강원' ? 'selected' : '' }> 충청/강원</option>
					<option value="부산/대구" ${param.local eq '부산/대구' ? 'selected' : '' }> 부산/대구</option>
					<option value="광주/전라" ${param.local eq '광주/전라' ? 'selected' : '' }> 광주/전라</option>
					<option value="제주" ${param.local eq '제주' ? 'selected' : '' }> 제주</option>
				</select>
			</div>
			<div>
				<button type="button" class="btn float-right" data-toggle="modal" data-target="#myModal">
					<strong style="font-size:20px;"><i class="far fa-map" style="margin-right: 10px; color: orange;"></i>신규장소등록</strong>
				</button>
			</div>
        </div>
		
	  	<table class="table">
	  		<thead class="bg-light">
	  			<tr>
		      		<th><input type="checkbox" id="check-all"></th>
		        	<th>번호</th>
		        	<th>지역</th>
		        	<th>장소</th>
		        	<th>주소</th>
		        	<th>좌석수</th>
		      	</tr>
		    </thead>
		    <tbody>
		    <c:forEach var="place" items="${places }">
		    	<tr>
		      		<td><input type="checkbox" name="placeNo" id="placeNo" value="${place.no }"></td>
		        	<td>${place.no }</td>
		        	<td>${place.localName }</td>
		        	<td><a href="detail.do?placeNo=${place.no }" class="text-primary">${place.placeName }</a></td>
		        	<td>${place.address }</td> 
		        	<td>${place.seatCapacity }</td> 
		      	</tr>
		    </c:forEach>
		    </tbody>
		</table>
  		<br>
		<div class="row float-right mt-3">
			<div class="col-12">
			<button type="button" class="btn text-danger" id="delete-checked">
				<strong><i class='fas fa-trash-alt' style='font-size:24px; margin-right: 10px;'></i>삭제</strong>
			</button>
			</div>
		</div>
		<br>
		<div class="row mt-5">
			<div class="col-12">
				<ul class="pagination justify-content-center">
			  		<li class="page-item ${page.pageNo gt 1 ? '' : 'disabled' }">
			  			<a class="page-link w3-hover-blue" data-page-no=${page.pageNo - 1 } href="list.do?status=${status }&sort=${param.date }&pageNo=${page.pageNo - 1 }">&laquo;</a>
			  		</li>
			  		<c:forEach var="num" begin="${page.beginPage }" end="${page.endPage }">
				  		<li class="page-item ${num eq page.pageNo ? 'active' : '' }">
				  			<a class="page-link w3-hover-blue" data-page-no=${num } href="list.do?status=${status }&sort=${param.date }&pageNo=${num }">${num }</a>
				  		</li>
			  		</c:forEach>
			  		<li class="page-item ${page.pageNo lt page.totalPages ? '' : 'disabled' }">
			  			<a class="page-link w3-hover-blue" data-page-no=${page.pageNo + 1 } href="list.do?status=${status }&sort=${param.date }&pageNo=${page.pageNo + 1 }">&raquo;</a>
			  		</li>
				</ul>
			</div>
		</div>
		</form>
	</div>
	<!-- footer -->
	<div class="row mt-5">
		<div class="col-12">
			<%@ include file="../../commons/footer.jsp" %>
		</div>
	</div>


	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
		<form id="place-form" method="post" action="register.do">
			<div class="modal-content">
		        <!-- Modal Header -->
		        <div class="modal-header">
		        	<h4 class="modal-title"><i class="far fa-copy" style="color: orange; margin-right: 10px;"></i>신규장소등록</h4>
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
	  				<strong><label for="localName">지역</label></strong>
			    	<select name="localName" style="width: 200px; height: 30px; margin-top: 14px; margin-bottom: 14px;">
	    				<option value="" disabled selected>지역 선택</option>
	    				<option value="서울"> 서울</option>
						<option value="경기/인천"> 경기/인천</option>
						<option value="충청/강원"> 충청/강원</option>
						<option value="부산/대구"> 부산/대구</option>
						<option value="광주/전라"> 광주/전라</option>
						<option value="제주"> 제주</option>
					</select>
					
			    	<div class="form-group mt-4">
			      		<strong><label for="placeName">이름</label></strong>
			      		<input type="text" class="form-control" id="placeName" name="placeName" placeholder="장소 이름을 입력해주세요." required>
			    	</div>
			    	
			    	<div class="form-group mt-4">
			      		<strong>주소</strong>
			    		<input type="button" class="btn btn-primary mt-1 mb-1" onclick="execDaumPostcode()" value="주소찾기"><br>
						<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly>
						<span id="guide" style="color:#999; display:none;"></span>
						<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
						<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" readonly>
			    	</div>
			    	
			    	<div class="form-group mt-4">
			      		<strong><label for="address">주소 직접 입력</label></strong>
			      		<input type="text" class="form-control" id="address" name="address" placeholder="주소찾기가 불가능할 경우에만 입력해주세요.">
			    	</div>
			    	
			    	<div class="form-group mt-4">
	  					<strong><label for="content">좌석수</label></strong>
			      		<input type="number" class="form-control" id="seatCapacity" name="seatCapacity" placeholder="좌석수를 입력해주세요. 예)100" required>
					</div>
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
			    	<button type="submit" class="btn btn-outline-danger float-right">등록</button>
		        	<button type="button" class="btn btn-outline-dark float-right" data-dismiss="modal">취소</button>
		        </div>
	      	</div>
	    </form>
	    </div>
	</div>

<script type="text/javascript">
	
	// 체크박스 전체 선택/해제
	$("#check-all").click(function() {
		if ($("#check-all").prop("checked")) {
			$("input[name='placeNo']").prop("checked", true);
		} else {
			$("input[name='placeNo']").prop("checked", false);
		}
	});
	
	// 체크된 항목 삭제
	$("#delete-checked").click(function() {
		if ($(":checkbox[name='placeNo']:checked").length == 0) {
			alert("체크된 항목이 없습니다.");
			return false;
		}
		$("#search-form").attr("action", 'deletePlace.do').submit();
	});
	
	// 지역별 정렬
	$("[name='local']").change(function(){
		$("[name=pageNo]").val("1");
		$("#search-form").submit();
	});
	
	// 검색
	$("#btn-search").click(function() {
      	if ($('#keyword-field').val() == '') {
        	alert("키워드를 입력하세요.");
        	return false;
        }
      	$("[name=pageNo]").val("1");
      
      	$("#search-form").submit();
   	});
	
	// 페이지 변경
	$('.pagination a').click(function() {
		var pageNo = $(this).data('page-no');
		$("[name=pageNo]").val(pageNo);
	
		$("#search-form").submit();
		return false;
	});
	
	// 장소등록 주소 찾기 API
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {

	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수

	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }

	            // 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("roadAddress").value = roadAddr;
	            
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }

	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';

	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
	        }
	    }).open();
	}
	
</script>	
</body>
</html>