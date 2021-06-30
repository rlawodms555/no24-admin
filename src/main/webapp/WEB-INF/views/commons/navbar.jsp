<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<nav class="navbar navbar-expand-sm justify-content-end text-white w3-black">
		<i class='fas fa-crown' style="color: yellow; margin-right: 10px;"></i>
		<span style="margin-right: 30px;">Administrator ${LOGINED_USER.name }님</span><a href="/no24-admin/logout.do">로그아웃</a>
	</nav>
	
	<nav class="navbar navbar-expand-sm bg-white navbar-white w3-bottombar w3-hover-border-orange">
  		<!-- Brand/logo -->
  		<a class="navbar-brand" href="/no24-admin/home.do">
  		<strong>No<span class="text-danger">2</span><span class="text-primary">4</span></strong>
    	<!-- <img src="bird.jpg" alt="logo" style="width:40px;"> -->
  		</a>

	  	<ul class="navbar-nav">
	    	<li class="nav-item dropdown">
	    		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">회원관리</a>
	      	<div class="dropdown-menu">
	        	<a class="dropdown-item" href="/no24-admin/user/list.do?status=Y&sort=date">회원정보 조회</a>
	        	<a class="dropdown-item" href="/no24-admin/user/list.do?status=N&sort=date">탈퇴회원 관리</a>
	      	</div>
	    	</li>
	    </ul>
	  	<ul class="navbar-nav">
	    	<li class="nav-item dropdown">
	    		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">공연관리</a>
	      	<div class="dropdown-menu">
	        	<a class="dropdown-item" href="/no24-admin/show/list.do?categoryNo=-1&sort=date">공연정보 조회</a>
	        	<a class="dropdown-item" href="/no24-admin/show/place/list.do">공연장소 조회</a>
	        	<a class="dropdown-item" href="/no24-admin/show/form.do">공연등록</a>
	        	<a class="dropdown-item" href="/no24-admin/show/putShowForm.do">상연등록</a>
	      	</div>
	    	</li>
	    </ul>
	  	<ul class="navbar-nav">
	    	<li class="nav-item dropdown">
	    		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">예매관리</a>
	      	<div class="dropdown-menu">
	        	<a class="dropdown-item" href="/no24-admin/order/list.do?sort=date">예매내역 조회</a>
	        	<a class="dropdown-item" href="/no24-admin/order/stats.do?categoryNo=-1">매출통계</a>
	      	</div>
	    	</li>
	    </ul>
	  	<ul class="navbar-nav">
	    	<li class="nav-item dropdown">
	    		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">리뷰관리</a>
	      	<div class="dropdown-menu">
	        	<a class="dropdown-item" href="/no24-admin/review/list.do?status=Y&sort=date">공연리뷰</a>
	        	<a class="dropdown-item" href="/no24-admin/review/list.do?status=N&sort=date">삭제리뷰</a>
	      	</div>
	    	</li>
	    </ul>
	  	<ul class="navbar-nav">
	    	<li class="nav-item dropdown">
	    		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">게시판관리</a>
	      	<div class="dropdown-menu">
	        	<a class="dropdown-item" href="/no24-admin/board/notice/list.do?sort=date">공지사항</a>
	      	</div>
	    	</li>
	    </ul>
	</nav>

	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<a href="/no24-admin/home.do" class="mr-1">Home</a>
		<span> > </span>
	</nav>