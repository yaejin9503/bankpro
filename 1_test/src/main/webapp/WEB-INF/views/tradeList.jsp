<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<script>

function searchAccountList(resp){
	var tag ="";
	
	tag+='<tr>';
	tag+='<th width="200"></th>';
	tag+='<th width="200">기간</th>';
	tag+='<th width="200">출금</th>';
	tag+='<th width="200">입금</th>';
	tag+='<th width="200">내용</th>';
	tag+='<th width="200">잔고</th>';
	tag+='</tr>';
	
	
	$.each(resp,function(index,item){
		tag +='<tr>';
		tag +='<td>2016-01-06</td>';
		tag +='<td>12:12:01</td>';
		tag +='<td>45,000</td>';
		tag +='<td>이체</td>';
		tag +='<td>450,000</td>';
	})
	
	
</tr>
	
	
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
			<h1>거래내역 조회<span></span></h1><!-- 내용제목 -->
			<ul class="basic_list">
				<li><span>&#47; 조회계좌번호</span></li>
				<li><span>&#47; 조회기간선택</span><input type="text" class="wr_date" /> ~ <input type="text" class="wr_date"  /></li>
				<li><span>조회내용</span><input type="radio" name="listcheck" checked />전체 <input type="radio" name="listcheck" />입금내역 <input type="radio" name="listcheck" />출금내역</li>
				<li><span>&#47; 조회결과순서</span> <input type="radio" name="listcheck" />최근거래순서  <input type="radio" name="listcheck" />과거거래순서</li>
			</ul>

			<p class="list_btn">
				<a href="haveaccount">이전</a><a href="#" class="select" onclick="searchAccountList">조회</a>
			</p>
			<table id="tradeList">
				
			</table>
			<p class="paging">
			<a href="#">&lt</a><a href="#" class="select">1</a><a href="#">2</a><a href="#">3</a>...<a href="#">&gt</a>
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