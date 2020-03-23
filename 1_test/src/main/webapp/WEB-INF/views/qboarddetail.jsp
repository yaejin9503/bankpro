<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<script src="resources/jquery-3.4.1.min.js"></script>
</head>

<body><!-- 계좌현황서브 -->
	<div id="wrap"><!-- wrap -->
		
		<div id="header"><!-- 상단 -->
			<div id="top"><!-- 멤버 -->
				<a href="info">회원정보수정</a><a href="logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
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
			<h1>고객문의 게시판<span></span></h1><!-- 내용제목 -->
			
			<table class="vw_board">
				<tr>
					<th>작성자</th>
					<td width="800">${sessionScope.loginId}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><input type="text"
					value="<fmt:formatDate value ="${today}" pattern ="yyyy년 MM월 dd일(E)"/>"
					disabled="disabled" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${board.title}</td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2" class="table_contents">
					${board.content}
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><c:if test="${board.originalfile!=null}">
					<a href ="download?boarddno=${board.boarddno}">
   					${board.originalfile}
   					</a>
					</c:if>
					<c:if test="${board.originalfile==null}">
						첨부 파일이 없습니다.
					</c:if>
					</td>
				</tr>
			
			</table>
			
			<table class="adm_board">
				<tr>
					<th>ㄴ관리자<br />
					<span>
					<c:if test="${board.repdate!=null}">
					${board.repdate}</c:if>
					<c:if test="${board.repdate==null}">
									
					</c:if></span>
					
					</th>
					<td width="800">
						<c:if test="${board.replytext!=null}">
						${board.replytext}</c:if>
						<c:if test="${board.replytext==null}">
						아직 답변을 남기지 않았습니다.</c:if>
					</td>
				</tr>
			</table>
			<p class="list_btn">
				<!--<a href="board_write.html">수정</a>-->
				<c:if test="${board.replytext==null}">
					<c:if test="${sessionScope.loginId==board.custid}">
					<a href="deleteboard?boarddno=${board.boarddno}">삭제</a>
					</c:if>
				</c:if>
				<a href="goboard" class="select">목록</a>
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