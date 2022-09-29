
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="./css/adminIndex.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    function maddr_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var ext = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        ext += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        ext += (ext !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(ext !== ''){
                        ext = ' (' + ext + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("MADDR_EXT").value = ext;
                
                } else {
                    document.getElementById("MADDR_EXT").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('MADDR_POCO').value = data.zonecode;
                document.getElementById("MADDR_ADDR").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("MADDR_DET").focus();
            }
        }).open();
    }
</script>
<script>
$(function(){
	var idflag = false;
	$('#MID').focusout(function() {idcheck(); });
	function idcheck() {
	 	var userId = document.getElementById('MID').value;
		$.ajax({
			url : "<%= request.getContextPath()%>/joinidcheck.ca",
			type : "post",
			data : {userId: userId},
			dataType : 'json',
			success : function(result){
				if(result == 0){
					$('#idcheck').attr('class','red');
					$('#idcheck').html('이미 사용중인  아이디입니다.');
					idflag = false;
				} else if (result == 1)  {
					$('#idcheck').html('필수 입력 사항입니다.');
					$('#idcheck').attr('class','red');	
					idflag = false;
				} else if (result == 2)  {
					$('#idcheck').attr('class','green');
					$('#idcheck').html('사용 가능한 아이디입니다.');	
					idflag = true;
				}
			},
			error : function() { alert('서버요청실패');	 ch = false; }
		});
		return idflag;
		};
	
});
</script>
<script>
	function check(){
		if(document.joinform.MPWD.value==""){
			alert('비밀번호를 입력하세요.');
			return;
		}
		if(document.joinform.MPWD2.value==""){
			alert('비밀번호 확인란을 입력하세요.');
			return;
		}
		if(document.joinform.MPWD2.value != document.joinform.MPWD.value){
			alert('입력한 비밀번호가 확인과 다릅니다.');
			return;
		}
		if(confirm('회원가입을 축하드립니다.')) {
			document.joinform.action = './memberJoin.ca';
			document.joinform.submit();
		}
	}
</script>
<style>
.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover {
    z-index: 2;
    color: #333;
    background-color: #ccc;
    border-color: #ddd;
}

 .search_bar { border: 0;
      		   background-color: #F5F5F5;      		
      		   border-radius: 10px;
      		   -webkit-appearance: none;
      		   -moz-appearance: none;
      		   -ms-appearance: none;
      		   -o-appearance: none;
      		   appearance: none;
      		   text-align: left;
      		   width: 100%;
      		   height: 32px;    
       	 	 }
       	 	 
 #search-button { float:right;
 				  margin-right:30px; 
 				  margin-top: -20px;
 				  margin-bottom: 10px
 				}
 				
 .form-group 	{ float:right; 
 				  margin-top: -20px;
 				  margin-bottom: 10px
 				}
 th 			{ font-size: 1.9vh;
 				  background-color: #F5F5F5; 
 				  width: 150px;}
 td				{ font-size: 1.9vh; 
 				  width: 300px;}

  .btn {
  cursor: pointer;
  -webkit-box-shadow: none !important;
  box-shadow: none !important;
  font-size: 15px;
  padding: 10px 20px; }

 .btn.btn-primary {
    background: #663939 !important;
    border: 1px solid #663939 !important;
    color: #fff !important; }
    
   .d-flex {
  display: -webkit-box !important;
  display: -ms-flexbox !important;
  display: flex !important; }
  
  .w-100 {
  width: 100% !important; }
  
   .justify-content-center {
  -webkit-box-pack: center !important;
  -ms-flex-pack: center !important;
  justify-content: center !important; }

</style>
</head>
<body>
<div class="container" align="center" style="margin-top: 100px;">
	<h2 style="margin-bottom: 30px;"><strong>Camelia 회원가입</strong> </h2>
	<form name="joinform" method="post">
	<table class="table table-striped">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="uid" id="uid" autofocus required/>
		<span id="idcheck"></span></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="upwd" id="upwd"/></td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" name="upwd2" id="upwd2"/></td>
	</tr>
	<tr>
		<th>이 름</th>
		<td><input type="text" name="uname" id="uname"/></td>
	</tr>
	<tr>
		<th>핸드폰번호</th>
		<td><input type="text" name="uphone" maxlength="11" id ="uphone"/></td>
	</tr>
	<tr>
		<th>주 소</th>
		<td>
			<p><input type="text" name="MADDR_POCO" id="MADDR_POCO" placeholder="우편번호">
			<input type="button" onclick="maddr_execDaumPostcode()" value="우편번호 찾기">
			<p><input type="text" name="MADDR_ADDR" id="MADDR_ADDR" placeholder="주소"><br>
			<p><input type="text" name="MADDR_DET" id="MADDR_DET" placeholder="상세주소">
			<input type="text" name="MADDR_EXT" id="MADDR_EXT" placeholder="참고항목">
			<input type="hidden" name="returnUrl" value="<%=request.getParameter("returnUrl") %>">
		</td>			
	</tr>
	<tr>
		<td colspan="2">
		<div class="w-100 d-flex justify-content-center">
			<button type="button" class="btn btn-primary rounded" onclick="javascript:joinform.reset()" style="margin: 20px;">다시작성</button>
			<button type="button" class="btn btn-primary rounded" onclick="check()" style="margin: 20px;">회원가입</button>
		</div>
		</td>
	</tr>	
</table>
</form>
</div>
</body>
</html>