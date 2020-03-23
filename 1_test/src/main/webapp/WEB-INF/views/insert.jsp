<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<style>
p{
	color: red;
}
</style>
<script src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	var custid = $("#custid").val();
	var password =$("#password").val();
	
	/* 
	$("#insert").on('click',function(){
		if(custid.length==0 || custid.length <3 ||custid.length > 15){
			alert("아이디 길이는 3~15자로 해주세요.");
			return false; 
		}
		if(password.length==0 || password.length <3 ||password.length > 15){
			alert("비밀번호 길이는 3~15자로 해주세요.");
			return false; 
		} */
	})
	
	$("#insert").on('click',confirm);
	$("#id_check").on('click',idcheck);
	
})
function confirm(){
	var password = $("#password").val(); 
	var password2 = $("#password2").val();
	
	if(password!=password2){
		alert("비밀번호가 다릅니다."); 
		return false; 
	}
}
function idcheck(){
	var custid = $("#custid").val();

	$.ajax({
		type: 'GET', 
		data : "custid="+custid,
		url: 'idcheck', 
		success : function(resp){
			if(resp=='fail'){
				$("#message").html("아이디가 중복 되었습니다.");
				return false; 
			}
			else{
				$("#message").html("사용 가능한 아이디 입니다.");
				$("#custid").val(custid);
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
			<h1>회원가입<span>가입항목을 입력해 주세요</span></h1><!-- 내용제목 -->
			<div class="login_area">
				<img src="resources/images/login_icon.png" class="login_icon" />
				<form action ="insertcustomer" method="post">
					<ul><!-- 회원가입 -->
						<li style="border-bottom:1px dotted #e7121c; padding-bottom:5px;"><img src="resources/images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li class="grp_area"><label for="">회원구분</label><input type="radio" name="division" value ="personal" checked /> 개인 <input type="radio" name="division" value ="company" /> 법인</li>
						<li><input type="text" placeholder="아이디" id = "custid" name ="custid" class="join_write" /><input type="button" id="id_check" class="id_check" value="중복체크"/></li>
						<li><p id = "message" class="join_write" /></li>
						<li><input type="password" placeholder="비밀번호" id ="password" name ="password" class="login_write" /></li>
						<li><input type="password" placeholder="비밀번호 확인" id="password2" class="login_write" /></li>
						<li><input type="text" placeholder="이름" name= "name" class="login_write" /></li>
						<li><input type="text" placeholder="주민(사업자)번호" name ="idno" class="login_write" /></li>
						<li><input type="email" placeholder="이메일주소@도메인" name ="email" class="login_write" /></li>
						<li><input type="text" placeholder="주소"  name ="address"  class="login_write" /></li>
						<li><input type="submit" id ="insert" class="btn_join" value="회원가입"/>
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