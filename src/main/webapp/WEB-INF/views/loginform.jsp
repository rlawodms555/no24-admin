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
<title>NO24</title>
<style type="text/css">
	a { text-decoration: none !important }
</style>
</head>
<body class="bg-light" style="font-family: 'Nanum Gothic', sans-serif;">

	
	<!-- login form -->
	<div class="container">
		<div class="row">
			<div class="col-6 mx-auto mt-5">
				<div class="mb-5">
	  				<h1 class="text-center w3-animate-opacity">
					<a href="/no24-admin/loginform.do">
	  					<strong>No
		  					<span class="text-danger">2</span><span class="text-primary">4</span>
		  					<span class="text-warning">Admin</span>
	  					</strong>
					</a>
	  				</h1>
				</div>
  				<div class="card mx-auto align-self-center">
  					<form id="login-form" method="post" action="login.do" onsubmit="checkLoginForm(event)">
  						<div class="card-body">
	  						<div class="form-group mb-4">
								<h2 style="font-weight: bold;">LOGIN</h2>
							</div>
							<div class="form-group">
								<label>아이디</label>
								<input type="text" class="form-control" placeholder="ID" name="id" id="user-id"/>
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<input type="password" class="form-control" placeholder="Password" name="password" id="user-password"/>
							</div>
							<!-- 로그인 상태 유지나 아이디 저장은 일단 넣어봤는데 할 거면 코드 수정해야 함 -->
							<!-- <span class="mr-2">
								<input type="checkbox" name="keep" value="keep">
								<label> 로그인 상태 유지</label>
							</span>
							<span class="form-group">
								<input type="checkbox" name="keep" value="keep">
								<label> 아이디 저장</label>
							</span> -->
							
							<c:if test="${param.error eq 'notfound' }">
								<div class="d-flex justify-content-center">
									<strong class="text-danger">사용자 정보가 존재하지 않습니다.</strong>
								</div>
							</c:if>
							<c:if test="${param.error eq 'role' }">
								<div class="d-flex justify-content-center">
									<strong class="text-danger">허용되지 않은 접근입니다.</strong>
								</div>
							</c:if>
							<c:if test="${param.error eq 'mismatch' }">
								<div class="d-flex justify-content-center">
									<strong class="text-danger">아이디 혹은 비밀번호가 일치하지 않습니다.</strong>
								</div>
							</c:if>
							
							<div class="form-group d-flex justify-content-center mt-3">
								<button type="submit" class="btn btn-warning btn-lg" id="form-submit">로그인</button>
							</div>
  						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row mt-5 fixed-bottom">
		<div class="col-12">
			<%@ include file="commons/footer.jsp" %>
		</div>
	</div>
	
<script type="text/javascript">
	function checkLoginForm() {
    	var id = document.querySelector("#user-id").value;
    	var password = document.querySelector("#user-password").value;
	    
    	if (id == "") {
	    	alert("아이디를 입력해주세요.")
	    	event.preventDefault();
	    	return false;
	    } else if (password == "") {
	    	alert("비밀번호를 입력해주세요.")
	    	event.preventDefault();
	    	return false;
	    }
	}
	
	/*
	// 로그인 ajax를 만들어본다
	$("#form-submit").click(function () {
		var userId = $("#user-id").val();
		var userPassword = $("#user-password").val();
		$.getJSON("/no24-admin/loginCheck.do", {id:userId, password:userPassword}, function(result) {
			var exist = result.exist;
			alert("테스트");
			alert("값 확인" + exist);
			if (exist) {
				$("#login-form").submit();
			} else {
				alert("허용되지 않은 접근입니다.");
				return false;
			}
		});
	});
	*/
	
	// 회원가입이 아니니까 아이디, 비밀번호 길이 체크할 필요는 없음
	
</script>
</body>
</html>