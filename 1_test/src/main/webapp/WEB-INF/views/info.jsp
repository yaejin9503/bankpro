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
	$("#info").on('click',confirm);
})

function confirm(){
	var password = $("#password").val(); 
	var password2 = $("#password2").val();
	
	if(password!=password2){
		alert("비밀번호가 다릅니다."); 
		return false; 
	}
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
					<li><a href="haveaccount.html">보유계좌현황</a>
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
						   <li><a href="addaccount_3.html">대출계좌</a></li>
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
			<h1>회원정보 수정<span></span></h1><!-- 내용제목 -->
			<div >
				<form action="info" method="post">
					<ul class="member_info"><!-- 회원가입 -->
		
						<li><label for="wr_pass">비밀번호</label><input type="password" id ="password" name ="password" class="login_write" /></li>
						<li><label for="wr_passchk">비밀번호 확인</label><input type="password" id="password2" class="login_write" /></li>
						<li><label for="wr_name">이름</label><input type="text" name= "name" class="login_write" /></li>
						<li><label for="wr_email">이메일</label><input type="email" name ="email" class="login_write" /></li>
						<li><label for="wr_address">주소</label><input type="text" name ="address" class="login_write" /></li>
					</ul>
								
				<p class="list_btn">
						<input type="submit" id ="info" class="btn_join" value="회원정보수정">
				</p>
				</form>	
			</div>
		</div>

		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 김예진<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>



		</div>

	</div>




</body>

</html>