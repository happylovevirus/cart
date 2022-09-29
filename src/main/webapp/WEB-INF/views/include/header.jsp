<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
.w3-wide {
	color: #A283E5;
	font-size: 46px;
	font-family: "Allerta Stencil", Sans-serif;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	var toggle = false;
	var toggle2 = false;
	$('#myBtn').mouseenter(function(){
		 var x = document.getElementById("demoAcc");
		  if (x.className.indexOf("w3-show") == -1 && !toggle) {
		    x.className += " w3-show";
		    toggle = true;
		  }
	});
	$('#myBtn').mouseenter(function(){
		 var x = document.getElementById("demoAcc");
		  if (x.className.indexOf("w3-show") == -1 && !toggle) {
		    x.className += " w3-show";
		    toggle = false;
		  }
	});
	$('#demoAcc').mouseleave(function(){
		 var x = document.getElementById("demoAcc");
		  if (x.className.indexOf("w3-show") != -1) {
			  x.className = x.className.replace(" w3-show", "");
			  toggle = false;
		  }
	});
	$('#myBtn').click(function(){
		 var x = document.getElementById("demoAcc");
		  if (x.className.indexOf("w3-show") != -1) {
			  x.className = x.className.replace(" w3-show", "");
		  }else{
			  x.className += " w3-show";
		  }
	});
	
	
	$('#myBtn2').mouseenter(function(){
		 var x = document.getElementById("demoAcc2");
		  if (x.className.indexOf("w3-show") == -1 && !toggle2) {
		    x.className += " w3-show";
		    toggle2 = true;
		  }
	});
	$('#myBtn2').mouseenter(function(){
		 var x = document.getElementById("demoAcc2");
		  if (x.className.indexOf("w3-show") == -1 && !toggle2) {
		    x.className += " w3-show";
		    toggle2 = false;
		  }
	});
	$('#demoAcc2').mouseleave(function(){
		 var x = document.getElementById("demoAcc2");
		  if (x.className.indexOf("w3-show") != -1) {
			  x.className = x.className.replace(" w3-show", "");
			  toggle2 = false;
		  }
	});
	$('#myBtn2').click(function(){
		 var x = document.getElementById("demoAcc2");
		  if (x.className.indexOf("w3-show") != -1) {
			  x.className = x.className.replace(" w3-show", "");
		  }else{
			  x.className += " w3-show";
		  }
	});
});

</script>
</head>
<body class="w3-content" style="max-width:1200px">

<input type="hidden" id="toggleValue" value="토글값"/>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b>COZY</b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="/product/list/dog/1" class="w3-button w3-block w3-white w3-left-align" id="myBtn">강아지 &nbsp;<i class="fa fa-caret-down"></i></a>
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button w3-light-grey"><i class="fa fa-caret-right w3-margin-right"></i>사료</a>
      <a href="#" class="w3-bar-item w3-button">간식 / 영양제</a>
      <a href="#" class="w3-bar-item w3-button">위생용품</a>
      <a href="#" class="w3-bar-item w3-button">생활용품</a>
    </div>
    <a href="/product/list/cat/1" class="w3-button w3-block w3-white w3-left-align" id="myBtn2">고양이 &nbsp;<i class="fa fa-caret-down"></i></a>
    <div id="demoAcc2" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button w3-light-grey"><i class="fa fa-caret-right w3-margin-right"></i>사료</a>
      <a href="#" class="w3-bar-item w3-button">간식 / 캣닢</a>
      <a href="#" class="w3-bar-item w3-button">위생용품</a>
      <a href="#" class="w3-bar-item w3-button">생활용품</a>
    </div>
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide">LOGO</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
</body>
</html>