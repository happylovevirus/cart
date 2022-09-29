<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empList</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link href="<%=request.getContextPath() %>/css/header-style.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
	.as {
		color:black; 
		font-size : 18px; 
		text-decoration: none;
		float:right;
	}
	.as:hover {
		text-decoration: none;
		color:#A283E5
	}
</style>

</head><body style="max-width:1600px">
<!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    </br>
    <div>
    
    <% String id = (String)session.getAttribute("uid"); %>
    <% if(session.getAttribute("uid") == null){ %>
    <a href="userInputForm" class = "as"><span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a>
    <a href="loginForm"class = "as"><span class="glyphicon glyphicon-log-in "></span>&nbsp;로그인&nbsp;&nbsp;&nbsp;</a>
    <% } else if( id.equals("admin")) { %>
    <a href="logout" style = "color:white; font-size : 20px"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a>
    <% } else {%>
    <a href="userInputForm" class = "as"><span class="glyphicon glyphicon-user"></span>&nbsp;마이페이지</a>
    <a href="logout"class = "as"><span class="glyphicon glyphicon-log-out "></span>&nbsp;로그아웃&nbsp;&nbsp;&nbsp;</a>
     <%  } %>
    </div>
    <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right">카테고리 : </span> 
      <button class="w3-button w3-black">ALL</button>
      <button class="w3-button w3-white"><i class="fa fa-map-pin w3-margin-right"></i>사료</button>
      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>간식 / 영양제(캣닢)</button>
      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>위생용품</button>
      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>생활용품</button>
    </div>
    </div>
  </header>
  
  <div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="/resources/banner.jpg" alt="banner" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
  

</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>