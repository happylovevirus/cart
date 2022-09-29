<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>장바구니</title>
<script type="text/javascript">

function fnPay(){
	alert("결제 API를 발급 받으시기 바랍니다.");
}
 
//체크박스
function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}

//쇼핑 계속하기
$(function(){
    $("#btnList").click(function(){
        location.href="/";
    });
    
//장바구니 비우기   
    $("#btnDelete").click(function(){
        if(confirm("장바구니를 비우시겠습니까?")){
            location.href="/cart/list/deleteAll";
        }
    });
});

$().ready(function(){
	let price = "${productDetail.price}" * 1;
	let prodPrice = price.toLocaleString('ko-KR');
	$("#pricespan").text(prodPrice + "원");
	if (price < 30000){
		price ="${productDetail.price}" * 1 + 3000;}
	priceComma = price.toLocaleString('ko-KR');
	$("#totalprice").val(price);
	$(".totalprice").text("합계금액 " + priceComma + "원");
	});

$(".plusbtn").on("click", function(){
	let quantity = $(".procnt").val();
	if(quantity < 999){
		$(".procnt").val(++quantity);
	}
	let price = "${productDetail.price}" * quantity;
	let fee = 3000;
	if(price >= 30000){
		fee = 0;
	}
	let prifee = price + fee
	priceComma =  prifee.toLocaleString('ko-KR');
	$("#totalprice").val(price+fee);
	$(".totalprice").text("합계금액 " + priceComma + "원");
});
$(".minusbtn").on("click", function(){
	let quantity = $(".procnt").val();
	if(quantity > 1){
		$(".procnt").val(--quantity);
	}
	let price = "${productDetail.price}" * quantity
	let fee = 3000;
	if(price >= 30000){
		fee = 0;
	}
	let prifee = price + fee
	priceComma =  prifee.toLocaleString('ko-KR');
	$("#totalprice").val(price+fee);
	$(".totalprice").text("합계금액 " + priceComma + "원");
});
$(".procnt").on("change", function(){
	let quantity = $(this).val();
	if(quantity%1 !=0){
		quantity = Math.floor(quantity);
		$(this).val(quantity);
	}
	if(quantity > 999 || quantity < 0.1){
		alert("수량을 다시 확인해주세요(최대 999개까지 구매 가능합니다.)")
		quantity = 1
		$(this).val(quantity);	
	}
	let price = "${productDetail.price}" * quantity
	let fee = 3000;
	if(price >= 30000){
		fee = 0;
	}
	let prifee = price + fee
	priceComma =  prifee.toLocaleString('ko-KR');
	$("#totalprice").val(price+fee);
	$(".totalprice").text("합계금액 " + priceComma + "원");
});
</script>
<style>
img {width:120px; height:120px; border-radius: 15%}
th {text-align: auto;}
td {text-align : left; align-items: center;}
input[type='number']::-webkit-inner-spin-button, 
input[type='number']::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    margin: 0;
}
.clear{clear:both;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>


<div class = "container">
<br>
<br>
	<h2>장바구니</h2>
	<br>
	
	<div class="col-sm-12">
	
	<table class="table text-center table-hover container">
	<c:if test="${empty cartList }">
	<p>장바구니에 담긴 상품이 없습니다.</p>
	</c:if>
	<thead>
	<tr><th><input type="checkbox" name='select' value='${cart.cart_num}' onclick='selectAll(this)'></th>
		<th>상품정보</th>
		<th>상품금액</th>
		<th>수량</th>
		<th>합계금액</th>
		<th></th></tr>
	</thead>
	
	<tbody>
	
		<c:forEach items="${cartList}" var="cart">
	<tr>
		<td><input type="checkbox" name="select" checked="checked"  value='${cart.cart_num}'></td>
		<td align="left"><img src="/resources/${cart.p_file}"/>
		<a href="#">${cart.p_name}</a></td>
		<td>${cart.price}</td>
		<td>
		<div class="price"><span class="count">
		<button type="button" class="plusbtn">&plus;</button><input type="number" name = "procnt" min = 1 max="999" value = "1" class = "procnt"><button type="button" class="minusbtn">&minus;</button>
		</span></div></td>
		<td><span class = "totalprice" style ="color : black">${cart.price}</span></td>
		<td><a class="btn" href="/cart/list/${cart.cart_num}">상품삭제</a></td>
		
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
<br>


<input type='button' value='주문하기' onclick='fnPay()' />
<button type="button" id="btnList">쇼핑 계속하기</button>
<button type="button" id="btnDelete">장바구니 비우기</button>
</div>
</div>

</body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>