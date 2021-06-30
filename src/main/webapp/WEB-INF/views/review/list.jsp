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
<style type="text/css">
	.w5 {width: 5%;}
	.w10 {width: 10%;}
	.w12 {width: 12%;}
	.w48 {width: 48%;}
	.w11 {width: 11%;}
	.w14 {width: 14%;}
	.star { 
		text-decoration: none; color: gray;
	}
	.star.on {
		color: orange;
	}
</style>
<title>No24</title>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	
	<!-- navbar -->
	<div class="row">
		<div class="col-12">
			<%@ include file="../commons/navbar.jsp" %>
		</div>
	</div>
	
	<div class="container">
		<form id="search-form" method="get" action="list.do">
		<div class="row">
			<div class="col-12">
			<c:if test="${param.status eq 'Y' }">
				<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16"><i class='fas fa-pencil-alt' style="color: orange; margin-right: 10px;"></i>리뷰정보</h2>
			</c:if>
			<c:if test="${param.status eq 'N' }">
				<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16"><i class='fas fa-cut' style="color: orange; margin-right: 10px;"></i>삭제된 리뷰정보</h2>
			</c:if>
			</div>
		</div>
  		
  		<div class="row mt-5 mb-5">
  			<div class="col-12 d-flex justify-content-center">
				<input type="hidden" name="status" value="${param.status }" />
				<input type="hidden" name="sort" value="${empty param.sort ? 'date' : param.sort }"/>
      			<input type="hidden" name="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
				<select name="opt" style="margin-right: 10px;">
					<option value="id" ${param.opt eq 'id' ? 'selected' : '' }> 아이디</option>
             		<option value="content" ${param.opt eq 'content' ? 'selected' : '' }> 내용</option>
				</select>
				<input type="text" placeholder="검색어를 입력하세요" name="keyword" id="keyword-field" value="${param.keyword }">
				<button type="button" class="btn" id="btn-search" >
					<i class="fa fa-search" style="font-size:24px"></i>
				</button>
  			</div>
		</div>
		
        <div class="mb-1">
        	<button type="button" id="btn-sort-date" class="btn ${empty param.sort or param.sort eq 'date' ? 'btn-outline-primary' : 'btn'}">최근등록순</button>
            <button type="button" id="btn-sort-rating" class="btn ${param.sort eq 'rating' ? 'btn-outline-primary' : 'btn'}">높은평점순</button>
        </div>
        
	  	<table class="table mt-5">
	  		<thead class="bg-light">
	  			<tr>
		      		<th class="w5"><input type="checkbox" id="check-all"></th>
		        	<th class="w10">공연번호</th>
		        	<th class="w12">작성자</th>
		        	<th class="w48">내용</th>
		        	<th class="w11">평점</th>
		        	<th class="w14">등록일</th>
		      	</tr>
		    </thead>
		    <tbody id="table-reviews">
		    <!-- AJAX로 입력될 부분 -->
		    <!-- ${reviewDtos} 거꾸로 올라가 보면 내가 Map에 status를 담았어 그래서 Y나 N 여부에 유동적으로 대응하는 것임 -->
		    <c:forEach var="reviewDto" items="${reviewDtos }">
		    	<tr>
		    	<%-- <p>테스트 ${reviewDto.userName }</p> --%>
		      		<td><input type="checkbox" name="reviewNo" id="reviewNo" value="${reviewDto.no }"></td>
		        	<td>${reviewDto.showNo }</td>
		        	<!-- 뒤로가기를 생각하면 음... 이렇게 3개 넣어주고 검색 조건도 넣어야 하나? -->
		        	<td><a href="/user/detail.do?status=${status }&sort=${sort }&pageNo=${page.pageNo }&userNo=${user.no }" class="text-primary">${reviewDto.userName }</a></td>
		        	<td>${reviewDto.content }</td> 
		        	<td>
		        		<c:choose>
		        			<c:when test="${5 eq reviewDto.rating }"><span class="text-warning">★★★★★</span></c:when>
		        		</c:choose>
		        		<c:choose>
		        			<c:when test="${4 eq reviewDto.rating }"><span class="text-warning">★★★★</span><span>★</span></c:when>
		        		</c:choose>
		        		<c:choose>
		        			<c:when test="${3 eq reviewDto.rating }"><span class="text-warning">★★★</span><span>★★</span></c:when>
		        		</c:choose>
		        		<c:choose>
		        			<c:when test="${2 eq reviewDto.rating }"><span class="text-warning">★★</span><span>★★★</span></c:when>
		        		</c:choose>
		        		<c:choose>
		        			<c:when test="${1 eq reviewDto.rating }"><span class="text-warning">★</span><span>★★★★</span></c:when>
		        		</c:choose>
		        	</td>
		        	<td><fmt:formatDate value="${reviewDto.createdDate }"/></td>
		      	</tr>
		    </c:forEach>
		    </tbody>
		</table>
  
  		<br>
		<div class="row float-right mt-5">
			<div class="col-12">
			<c:if test="${param.status eq 'Y' }">
				<button type="button" class="btn text-danger" id="delete-checked">
					<strong><i class='fas fa-trash-alt' style='font-size:24px; margin-right: 10px;'></i>리뷰삭제</strong>
				</button>
			</c:if>
			</div>
		</div>
		<br>
		<%-- <p>${page }</p> --%>
		<div class="row mt-5">
				<div class="col-12">
					<ul class="pagination justify-content-center" id="box-pagination">
				  		<li class="page-item ${page.pageNo gt 1 ? '' : 'disabled' }">
				  			<a class="page-link w3-hover-blue" data-page-no=${page.pageNo - 1 } href="">&laquo;</a>
				  		</li>
				  		<c:forEach var="num" begin="${page.beginPage }" end="${page.endPage }">
					  		<li class="page-item ${num eq page.pageNo ? 'active' : '' }">
					  			<a class="page-link w3-hover-blue" data-page-no=${num } href="">${num }</a>
					  		</li>
				  		</c:forEach>
				  		<li class="page-item ${page.pageNo lt page.totalPages ? '' : 'disabled' }">
				  			<a class="page-link w3-hover-blue" data-page-no=${page.pageNo + 1 } href="">&raquo;</a>
				  		</li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<!-- footer -->
	<div class="row mt-5">
		<div class="col-12">
			<%@ include file="../commons/footer.jsp" %>
		</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
       <div class="modal-dialog modal-lg">
         <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">유저 정보</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body">
                <table class="table table-bordered">
                	<colgroup>
                		<col width="15%">
                		<col width="35%">
                		<col width="15%">
                		<col width="35%">
                	</colgroup>
                	<tbody>
                		<tr>
                			<th>이름</th>
                			<td colspan="3"><span id="span-name"></span></td>
                		</tr>
                		<tr>
                			<th>아이디</th>
                			<td><span id="span-id"></span></td>
                			<th>생년월일</th>
                			<td><span id="span-birth"></span></td>
                		</tr>
                		<tr>
                			<th>연락처</th>
                			<td><span id="span-tel"></span></td>
                			<th>이메일</th>
                			<td><span id="span-email"></span></td>
                		</tr>
                		<tr>
                			<th>주소</th>
                			<td><span id="span-address"></span></td>
                			<th>이메일 수신여부</th>
                			<td><span id="span-emailReceivingConsent"></span></td>
                		</tr>
                		<tr>
                			<th>SMS 수신여부</th>
                			<td><span id="span-smsReceivingConsent"></span></td>
                			<th>포인트</th>
                			<td><span id="span-availablePoint"></span></td>
                		</tr>
                		<tr>
                			<th>가입일자</th>
                			<td><span id="span-created-date"></span></td>
                			<th>탈퇴일자</th>
                			<td><span id="span-withdrawal-date"></span></td>
                		</tr>
                	</tbody>   
                </table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
              </div>
         </div>
       </div>
  </div>


<script type="text/javascript">

	// 체크박스 전체 선택/해제
	$("#check-all").click(function() {
		if ($("#check-all").prop("checked")) {
			$("input[name='reviewNo']").prop("checked", true);
		} else {
			$("input[name='reviewNo']").prop("checked", false);
		}
	});
	
	// 체크된 항목 삭제
	$("#delete-checked").click(function() {
		if ($(":checkbox[name='reviewNo']:checked").length == 0) {
			alert("체크된 항목이 없습니다.");
			return false;
		}
		$("#search-form").attr("action", 'updateReviewStatus.do').submit();
	});
   	
   	// 최근등록순, 높은평점순 정렬
   	$('#btn-sort-date').click(function() {
      	$("[name=sort]").val("date");
      	$("#search-form").submit();
   	});
   	
   	$('#btn-sort-rating').click(function() {
      	$("[name=sort]").val("rating");
      	$("#search-form").submit();
   	});
   	
   	// 검색
   	$("#btn-search").click(function() {
      	if ($('#keyword-field').val() == '') {
        	alert("키워드를 입력하세요.");
        	return false;
        }
      	$("[name=sort]").val("date");
      	$("[name=pageNo]").val("1");
      
      	$("#search-form").submit();
   	});
   	
   	// 페이지 변경
	$('.pagination a').click(function() {
		var pageNo = $(this).data('page-no');
		$("[name=pageNo]").val(pageNo);
		
		$("#search-form").submit();
		return false;
   	})
   	/*
   	// 리뷰 페이징처리입니다.	
	function getReviewsAndPagination(pageNo) {
		var $reviewTbody = $("#table-reviews").empty();
		var $reviewUl = $("#box-pagination").empty();
		
		$.getJSON("reviews.do", {status:'${param.status}', sort:'${param.sort}', page:pageNo}, function(result) {
			var reviews = result.reviewDtos;
			var page = result.pagination;
			
			$.each(reviews, function(index, review) {
				var tr = "<tr>";
				tr += "<td class='w5'>"+"<input type='checkbox' name='reviewNo' id='reviewNo'" + "value=" + review.no + ">"+"</td>";
				tr += "<td class='w10'>"+review.no+"</td>";
				tr += "<td class='w12'>"+review.id+"</td>";
				tr += "<td class='w48'>"+review.content+"</td>";
				tr += "<td class='w11'>"
				for (var i=1; i<=review.rating; i++) {
					tr += "<span class='star on'>★<span>"
				}
				for (var i=1; i<=5-review.rating; i++) {
					tr += "<span class='star'>★<span>"
				}
				tr += "</td>";
				tr += "<td class='w14'>"+new Date(review.createdDate).toLocaleString()+"</td>";
				tr += "</tr>"
				
				$reviewTbody.append(tr);
			});
			
			for (var num=page.beginPage; num<=page.endPage; num++) {
				var li = "<li class='page-item "+ (num == page.pageNo ? 'active' : '' ) +" '>";
				li += '<a class="page-link w3-hover-blue" data-page-no="'+num+'">'+num+'</a>'
				li += "</li>"
				
				$reviewUl.append(li);
			}
		})
	}
	
	getReviewsAndPagination(1);
	
	$('#box-pagination').on('click', 'a', function(event) {
		var pageNo = $(this).data("page-no");
		getReviewsAndPagination(pageNo)
	})
	
	// Bootstrap 4 Filters 참고한 검색 기능
	$(document).ready(function(){
  		$("#keyword-field").on("keyup", function() {
    		var value = $(this).val().toLowerCase();
    		$("#table-reviews tr").filter(function() {
      			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    		});
  		});
	});
	*/
</script>	
</body>
</html>