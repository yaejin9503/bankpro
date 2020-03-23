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
	init(); 
})

function init(){
	$.ajax({
		type : 'GET', 
		url : 'showaccount',  
		success : showaccount 
	})
}
function showaccount(resp){
	var tag = '';
	var data =''; 

	tag += '<tr>';
	tag += '<th width="50">선택</th>';
	tag += '<th width="150">계좌종류</th>';
	tag += '<th width="200">계좌번호</th>';
	tag += '<th width="200">잔고</th>';
	tag += '<th width="200">적금금액</th>';
	tag += '<th width="200">납입(상환)기간</th>';
	tag += '<th width="200">대출 이율</th>';
	tag += '</tr>';
	
	$.each(resp,function(index,item){
		tag +='<tr>';
		tag +='<td><input type="radio" name="accountno" value ="'+item.accountno+'"checked /></td>';
		tag +='<td>'+item.accounttype+'</td>';
		tag +='<td>'+item.accountno+'</td>';
		tag +='<td>'+item.balance+'</td>';
		tag +='<td>'+item.payment+'</td>';
		tag +='<td>'+item.startdeposit+'~'+item.enddeposit+'</td>';
		tag +='<td>'+item.interest+'</td>';
	})
	$("#result").html(tag);

	
	data += '<a href="#" class="godeposit" onclick="godeposit()">入金</a>';
	data +=	'<a href="#" class="gowithdraw" onclick="gowithdraw()">出金</a>'; 
	data +=	'<a href="#" class="gotransfer" onclick="gotransfer()">振込み</a>';
	data +=	'<a href="#" class="gotradeList" onclick="gotradeList()">取引内訳照会</a>';
	data +=	'<a href="loan.html">貸し付け償還</a>';
	$("#page").html(data); 
	
}

function godeposit() {
	var accountno = $('input[name="accountno"]:checked').val();
	location.href="godeposit?accountno="+accountno;
}

function gowithdraw() {
	var accountno = $('input[name="accountno"]:checked').val();
	location.href="gowithdraw?accountno="+accountno;
}

function gotransfer() {
	var accountno = $('input[name="accountno"]:checked').val();
	location.href="gotransfer?accountno="+accountno;
}

function gotradeList() {
	var accountno = $('input[name="accountno"]:checked').val();
	location.href="tradeList?accountno="+accountno;
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
			<a href="#"><img src="resources/images/logo.png" width="150" /></a>
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
			<h1>보유계좌현황</h1><!-- 내용제목 -->
			
			<table id ="result">
			
			</table>

			<p id ="page" class="list_btn">
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