<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
	<script src="resources/jquery-3.3.1.min.js"></script>
	<script src="resources/js/rsa.js"></script>
	<script src="resources/js/SecureRandom.js"></script>
	<script src="resources/js/jsbn.js"></script>
<script>

function transfer(){
	var accountno = $("#accountno").val();  // (내 계좌 )출금 하는 계좌 
	var term = $("#accountno1").val(); // (상대 계좌)입금 되는 계좌  
	var balance = $("#balance").val(); 
	
	if(term.length==0){
		alert("입금 할 계좌 번호를 입력해주세요"); 
		return false; 
	}
	
	var infomation = { 
			"accountno" : accountno ,
			"term" :term , 
			"balance" : balance
	}
	
	$.ajax({
		type : 'POST',
		data : infomation, 
		url : 'transferin', 
		success: function(resp){
			if(resp=='success'){
				alert("이체 성공");
			}else if(resp =='overflow'){
				alert("출금잔고가 부족합니다.");
			}else if(resp =='false'){
				alert("이체 실패"); 
			}
		}

	})
}
function hexToBytes(hex) {
    for (var bytes = [], c = 0; c < hex.length; c += 2)
    bytes.push(parseInt(hex.substr(c, 2), 16));
    return bytes;
}
function pop(){
	var RSAModulus = "${RSAModulus}";
	var RSAExponent = "${RSAExponent}";
	
	var data = document.querySelector('#accountno1').value;
	
	
	var rsa = new RSAKey();
	rsa.setPublic(RSAModulus,RSAExponent);
	
	var encaccountno = rsa.encrypt(data);
	
	
	window.open('transfer_pop2?pop_account='+encaccountno,'pop','resizable=no scrollbars=yes top=300 left=500 width=500 height=300');
	return false
}
</script>
</head>
<body><!-- 계좌현황서브 -->
	<div id="wrap"><!-- wrap -->
		
		<div id="header"><!-- 상단 -->
			<div id="top"><!-- 멤버 -->
				<a href="info.html">회원정보수정</a><a href="login.html">로그아웃</a>&nbsp;&nbsp;&nbsp;
			</div>
			<div id="navi">
			<a href=""><img src="resources/images/logo.png" width="150" /></a>
			<div class="gnb"><!-- 네비게이션 -->
     
				 <ul>
					<li><a href="haveaccount" class="select">보유계좌현황</a>
						<!-- <ul>
						   <li><a href="#">서브메뉴1</a></li>
						   <li><a href="#">서브메뉴2</a></li>
						   <li><a href="#">서브메뉴3</a></li>
						</ul> -->
					</li>		
				<li class="select"><a href="gomakeaccount" >신규계좌개설</a>
						<ul>
						   <li><a href="gomakeaccount">예금계좌</a></li>
						   <li><a href="gomake2account">적금계좌</a></li>
						   <li><a href="gomake3account">대출계좌</a></li>
						</ul>
					</li>
					<li><a href="goboard">고객문의게시판</a>
						<!-- <ul>
						   <li><a href="#">서브메뉴1</a></li>
						   <li><a href="#">서브메뉴2</a></li>
						   <li><a href="#">서브메뉴3</a></li>
						</ul> -->
					</li>
				</ul>
			</div>
			</div>
			
		</div>



		<div id="contents"><!--내용-->
			<h1>계좌이체<span>계좌이체 정보를 입력해주세요</span></h1><!-- 내용제목 -->
			<ul class="basic_list">
				<li><span>&#47; 계좌구분</span> 예금계좌</li>
				<li><span>&#47; 출금계좌번호</span><input type="text" class="wr_account" name = "accountno" id ="accountno" value="${accountno}" /></li>
				<li><span></span><input type="radio"  name="add_account"onclick="window.open('transfer_pop1','pop','resizable=no scrollbars=yes top=300 left=500 width=500 height=300');return false"   />본인계좌<input type="radio" name="add_account" onclick="window.open('transferp','pop','resizable=no scrollbars=yes top=300 left=500 width=400 height=250');return false" />타인계좌</li>
				<li><span>&#47; 입금계좌번호</span><input type="text" class="wr_account" id ="accountno1" name="accountno1"/> <input type="button" onclick="pop()" value="조회"></input></li>
				<li><span>&#47; 계좌이체금액</span><input type="text" class="wr_account" name ="balance" id="balance"/></li>
			</ul>

			<p class="list_btn">
				<a href="#">뒤로</a><a href="#" class="select"  onclick="transfer()" >이체</a>
			</p>
	
		</div>

		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 김예진<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>
		</div>

	</div>




</body>

</html>