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
function plusdeposit(){
	 var accountno = $("#accountno").val(); 
	 var balance = $("#balance").val();
	 
	 var information ={
		 "accountno" : accountno, 
		 "balance": balance
	 }
	 
	 $.ajax({
		 type : 'POST',
		 data : information, 
	     url : 'plusdeposit',
	     success : function(resp){
	    	 if(resp =='success'){
	    		 alert("입금에 성공했습니다")
	    		 $("#accountno").val("");
	    		 $("#balance").val("");
	    	 }else{
	    		 alert("임금에 실패했습니다.")
	    		 $("#accountno").val("");
	    		 $("#balance").val("");
	    	 }
	     }
	 })
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
					<li><a href="haveaccount.html" class="select">보유계좌현황</a>
						<!-- <ul>
						   <li><a href="#">서브메뉴1</a></li>
						   <li><a href="#">서브메뉴2</a></li>
						   <li><a href="#">서브메뉴3</a></li>
						</ul> -->
					</li>

					<li><a href="addaccount_1.html">신규계좌개설</a>
						<ul>
						   <li><a href="addaccount_1.html">예금계좌</a></li>
						   <li><a href="addaccount_2.html">적금계좌</a></li>
						   <li><a href="addaccount_3.html">대출계좌</a></li>
						</ul>
					</li>
					<li><a href="board_list.html">고객문의게시판</a>
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
			<h1>입금<span>입금정보를 입력해 주세요</span></h1><!-- 내용제목 -->
			<ul class="basic_list">
				<li><span>&#47; 계좌구분</span>예금/적금</li>
				<li><span>&#47; 계좌번호</span><input type="text" class="wr_account" name = "accountno" id ="accountno" value="${accountno}"/></li>
				<li><span>&#47; 입금금액</span><input type="text" class="wr_account" name ="balance" id="balance"/></li>
			</ul>

			<p class="list_btn">
				<a href="haveaccount">이전</a><a href="#" onclick="plusdeposit()" class="select">입금</a>
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