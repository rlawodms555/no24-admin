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
				<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16"><i class='far fa-file-alt' style="color: orange; margin-right: 10px;"></i>회원정보</h2>
			</c:if>
			<c:if test="${param.status eq 'N' }">
				<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16"><i class='fas fa-user-times' style="color: orange; margin-right: 10px;"></i>탈퇴회원정보</h2>
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
              		<option value="name" ${param.opt eq 'name' ? 'selected' : '' }> 이름</option>
				</select>
				<input type="text" placeholder="검색어를 입력하세요" name="keyword" id="keyword-field" value="${param.keyword }">
				<button type="button" class="btn" id="btn-search" >
					<i class="fa fa-search" style="font-size:24px"></i>
				</button>
  			</div>
		</div>
        <div class="mb-1">
        	<button id="btn-sort-date" class="btn ${empty param.sort or param.sort eq 'date' ? 'btn-outline-primary' : 'btn'}">가입일순</button>
            <button id="btn-sort-name" class="btn ${param.sort eq 'name' ? 'btn-outline-primary' : 'btn'}">이름순</button>
        </div>
        
	  	<table class="table" id="tb">
	  		<thead class="bg-light">
	  			<tr>
		      	<!-- 계정사용여부가 Y냐 N이냐에 구분  -->
		      		<th><input type="checkbox" id="check-all"></th>
		        	<th>번호</th>
		        	<th>아이디</th>
		        	<th>이름</th>
		        	<th>연락처</th>
		        	<th>이메일</th>
		        	<th>가입일</th>
		        	<!-- <th>수정, 삭제 버튼을 각각 넣을지 고민</th> -->
		      	</tr>
		    </thead>
		    <tbody>
		    <!-- ${user} 거꾸로 올라가 보면 내가 Map에 status를 담았어 그래서 Y나 N 여부에 유동적으로 대응하는 것임 -->
		    <c:forEach var="user" items="${users }">
		    	<tr>
		      		<td><input type="checkbox" name="userNo" id="userNo" value="${user.no }"></td>
		        	<td>${user.no }</td>
		        	<!-- 뒤로가기를 생각하면 음... 이렇게 3개 넣어주고 검색 조건도 넣어야 하나? -->
		        	<td><a href="detail.do?status=${status }&sort=${sort }&pageNo=${page.pageNo }&userNo=${user.no }" class="text-primary">${user.id }</a></td>
		        	<td>${user.name }</td>
		        	<td>${user.tel }</td> 
		        	<td>${user.email }</td> 
		        	<td><fmt:formatDate value="${user.createdDate }"/></td>
		      	</tr>
		    </c:forEach>
		    </tbody>
		</table>
  
  		<br>
		<div class="row float-right">
			<div class="col-12">
			<c:if test="${param.status eq 'Y' }">
				<button type="button" class="btn text-danger" id="delete-checked">
					<strong><i class='fas fa-trash-alt' style='font-size:24px; margin-right: 10px;'></i>회원삭제</strong>
				</button>
			</c:if>
			</div>
		</div>
		<br>
		<%-- <p>${page }</p> --%>
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
			<%@ include file="../commons/footer.jsp" %>
		</div>
	</div>

<script type="text/javascript">

	// 체크박스 전체 선택/해제
	$("#check-all").click(function() {
		if ($("#check-all").prop("checked")) {
			$("input[name='userNo']").prop("checked", true);
		} else {
			$("input[name='userNo']").prop("checked", false);
		}
	});
	
	// 체크된 항목 삭제
	$("#delete-checked").click(function() {
		if ($(":checkbox[name='userNo']:checked").length == 0) {
			alert("체크된 항목이 없습니다.");
			return false;
		}
		$("#search-form").attr("action", 'updateUserRole.do').submit();
	});
   	
   	// 가입일순, 이름순 정렬
   	$('#btn-sort-date').click(function() {
      	$("[name=sort]").val("date");
      	$("#search-form").submit();
   	});
   	
   	$('#btn-sort-name').click(function() {
      	$("[name=sort]").val("name");
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

</script>	
</body>
</html>