<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<a href="info.html">회원정보수정</a><a href="login.html">로그아웃</a>&nbsp;&nbsp;&nbsp;
			</div>
			<div id="navi">
			<a href=""><img src="resources/images/logo.png" width="150" /></a>
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
			<h1>고객문의 게시판<span></span></h1><!-- 내용제목 -->
		<form action ="writeboard" method="post" enctype="multipart/form-data">	
			<table class="wr_board">
				<tr>
					<th>작성자</th>
					<td>${sessionScope.loginId}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><input type="text"
					value="<fmt:formatDate value ="${today}" pattern ="yyyy년 MM월 dd일(E)"/>"
					disabled="disabled" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title"/></td>
				</tr>
				<tr>
					<th colspan="2"><textarea cols="130" rows="20" id="content" name="content"></textarea></th>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="upload"/></td>	
				</tr>
			
			</table>
			<p class="list_btn">
				<button type="button">취소</button>
				<input type="submit" id="boardwrite" class="select" value="등록">
			</p>
		</form>
		</div>
		
		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>

		</div>
	</div>

</body>

</html>