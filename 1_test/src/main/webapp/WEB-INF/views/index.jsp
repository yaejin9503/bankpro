<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />

</head>

<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<div id="header"><!-- 상단 -->
			<div id="top"><!-- 멤버 -->
				<a href="login.html">로그인</a><a href="join.html">회원가입</a>&nbsp;&nbsp;&nbsp;
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
			<h1>로그인</h1><!-- 내용제목 -->
			<div class="login_area">
				<img src="resources/images/login_icon.png" class="login_icon" />
				<form action ="logincustomer" method ="post">
					<ul>
						<li class=""><img src="resources/images/ico_login.png" width="14" /> SE Bank Login</li>
						<li><input type="text" placeholder="아이디" id = "custid" name ="custid" class="login_write" /></li>
						<li><input type="password" placeholder="비밀번호" id ="password" name ="password" class="login_write" /></li>
						<li><input type="submit" class="btn_login" value ="로그인"></li>
						<li><a href="insert" class="btn_join2">회원가입</a></li>
						<li><a href="idpwfind" class="btn_findid">아이디 / 비밀번호 찾기</a></li>
					</ul>
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