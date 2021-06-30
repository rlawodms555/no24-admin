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
	
	<div class="container">
		<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16"><i class='far fa-folder-open' style="color: orange; margin-right: 10px;"></i>상세정보</h2>
	
		<div class="row mt-5">
			<div class="col-2">
			<img src="../resources/images/commons/userDefault.png" alt="user" class="img-thumbnail">
			</div>
			<div class="col-10">
			<table class="table" style="margin-left: auto; margin-right: auto;">
				<thead>
					<tr>
						<th>이름</th>
						<td>${user.name }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${user.id }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>${user.password }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><fmt:formatDate value="${user.birth }" pattern="yyyy/MM/dd"/></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${user.tel }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${user.email }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${user.address }</td>
					</tr>
					<tr>
						<th>이메일 수신여부</th>
						<td>${user.emailReceivingConsent eq 'Y' ? '수신' : '거부' }</td>
					</tr>
					<tr>
						<th>SMS 수신여부</th>
						<td>${user.smsReceivingConsent eq 'Y' ? '수신' : '거부' }</td>
					</tr>
					<tr>
						<th>포인트</th>
						<td>${user.availablePoint }</td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><fmt:formatDate value="${user.createdDate }" pattern="yyyy/MM/dd"/></td>
					</tr>
					<c:if test="${user.ableStatus eq 'N' }">
						<tr>
							<th>탈퇴일자</th>
							<td><fmt:formatDate value="${user.withdrawalDate }" pattern="yyyy/MM/dd"/></td>
						</tr>
					</c:if>
				</thead>
			</table>
			</div>
		</div>
		<div class="row float-right">
			<div class="col-12">
				<!-- pageNo만 전해주면 안 될 텐데 돌아갈 때 검색 조건도?-->
				<a href="list.do?status=${status }&sort=${sort }&pageNo=${param.pageNo }&userNo=${user.no }" class="btn text-danger">
					<strong><i class='fas fa-redo' style='font-size:24px; margin-right: 10px;'></i>이전</strong>
				</a>
				<c:if test="${param.status eq 'Y' }">
				<a href="update.do?" class="btn text-danger">
					<strong><i class='far fa-edit' style='font-size:24px; margin-right: 10px;'></i>회원정보수정</strong>
				</a>
				<a href="updateUserRole.do?status=${status }&sort=${sort }&pageNo=${param.pageNo }&userNo=${user.no }" class="btn text-danger">
					<strong><i class='fas fa-trash-alt' style='font-size:24px; margin-right: 10px;'></i>회원삭제</strong>
				</a>
				</c:if>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	
<!-- footer -->
<div class="row mt-5">
		<div class="col-12">
			<%@ include file="../commons/footer.jsp" %>
		</div>
	</div>
</body>
</html>