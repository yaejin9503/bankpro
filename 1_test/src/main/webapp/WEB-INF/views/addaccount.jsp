<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<script src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#account").on('click',accountmake);
	$("#accountM").on('click',insertaccount);
})

function accountmake(){
	$.ajax({
		type : 'POST',
		url : 'accountmake', 
		success : function(resp){
			$("#accountno").val(resp);
		}
	})
	
}
function insertaccount(){
	var accountno = $("#accountno").val();
	var balance = $("#balance").val();
	
	var infomation ={
		"accountno" : accountno,
		"balance" : balance
	}
	
	$.ajax({
		type : 'POST',
		url : 'insertcheckaccount',
		data : infomation,
		success: function(resp){
			if(resp=='success'){
				alert("예금 계좌 만들기에 성공했습니다.")
			}else{
				alert("예금 계좌 만들기에 실패했습니다.")
			}
			$("#accountno").val("");
			$("#balance").val("");
		}
	})
	
}
</script>
</head>


<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<div id="header"><!-- 상단 -->
			<div id="top"><!-- 멤버 -->
				<a href="info">회원정보수정</a><a href="logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
			</div>
			<div id="navi">
			<a href="#"><img src="resources/images/logo.png" width="150" /></a>
			<div class="gnb"><!-- 네비게이션 -->
     
				 <ul>
					<li><a href="haveaccount">보유계좌현황</a>
						<!-- <ul>
						   <li><a href="#">서브메뉴1</a></li>
						   <li><a href="#">서브메뉴2</a></li>
						   <li><a href="#">서브메뉴3</a></li>
						</ul> -->
					</li>

					<li class="select"><a href="gomakeaccount" class="select">신규계좌개설</a>
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
			<h1>신규계좌 개설<span>예금계좌정보를 입력해 주세요</span></h1><!-- 내용제목 -->
			<ul class="basic_list">
				<!-- 예금계좌 -->
				<li><span>&#47; 계좌구분</span>예금 계좌</li>
				<li><span>&#47; 계좌번호</span><input type="text" name = "accountno" id = "accountno" class="wr_account" placeholder="" /> <input type="button" value ="계좌번호 발급" id="account"></li>
				<li><span>&#47; 초기잔고</span><input type="text" name ="balance" id = "balance" class="wr_account" /></li>
			</ul>

			<br>
			<input type ="button" id="accountM" class="id_check" value ="계좌개설">
			
			<p class="extext">
			※ 대출계좌는 승인 완료 후 계좌현황에서 확인하실 수 있습니다
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