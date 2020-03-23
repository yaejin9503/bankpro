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
});

function init(){
	$.ajax({
		type:'GET',
		url:'listBoard',
		success :showBoard
	})
}

function showBoard(resp){
	
	var tag=''
	tag +='<tr>';
	tag +='<th>No.</th>';
	tag +='<th>문의내용</th>';
	tag +='<th>일자</th>';
	tag +='<th>작성자</th>';
	tag +='<th>조회수</th>';
	tag +='</tr>';

	$.each(resp,function(index,item){
		tag +='<tr>';
		tag +='<td>'+item.boarddno+'</td>';
		tag += '<td  class="board_title"><a href=goboardDetail?boarddno='+item.boarddno+'>'+item.title+'</a></td>'
		tag += '<td>'+item.regdate+'</td>' ; 
		tag += '<td>'+item.custid+'</td>'; 
		tag += '<td>'+item.hitcount+'</td>'; 
		tag +="</tr>";
	}) 
	$("#result").html(tag);
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
					<li><a href="haveaccount.html">보유계좌현황</a>
						<!-- <ul>
						   <li><a href="#">서브메뉴1</a></li>
						   <li><a href="#">서브메뉴2</a></li>
						   <li><a href="#">서브메뉴3</a></li>
						</ul> -->
					</li>

					<li><a href="gomakeaccount">신규계좌개설</a>
						<ul>
						   <li><a href="gomakeaccount">예금계좌</a></li>
						   <li><a href="gomake2account">적금계좌</a></li>
						   <li><a href="addaccount_3.html">대출계좌</a></li>
						</ul>
					</li>
					<li class="select"><a href="goboard"  class="select">고객문의게시판</a>
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
			
			<table id="result">
			</table>
			
			<p class="paging">
				<a href="#">&lt</a><a href="#" class="select">1</a><a href="#">2</a><a href="#">3</a>...<a href="#">&gt</a>
				<a href="gowriteboard" class="btn_write">글쓰기</a>
			</p>
			<p class="board_search">
				<select>
					<option value="">전체</option>
					<option value="">제목</option>
					<option value="">내용</option>
					<option value="">작성자</option>
				</select>
				<input type="text" /> <a href="#">검색</a>

			</p>

		</div>



		<div id="footer"><!-- 하단 -->
			서울시 강남구 삼성동 59-1 COEX 4F, 개인정보관리책임자: 홍길동<br />
			Copyright©2016 KITA-SESchool ICT Educational Center All rights reserved.			
		</div>



		</div>

	</div>




</body>

</html>