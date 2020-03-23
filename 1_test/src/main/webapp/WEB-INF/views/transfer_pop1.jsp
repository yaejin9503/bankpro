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
		type :'GET', 
		url : 'showyouraccount', 
		success: showyouraccount
	})
}

function showyouraccount(resp){
	var tag = ''; 
	tag += '<tr>'; 
	tag +='<th>선택</th>'; 
	tag +='<th>계좌번호</th>'; 
	tag +='<th>ID</th>';
	tag +='</tr>';
	
	$.each(resp,function(index,item){
		tag += '<tr>';
		tag += '<td><input type="radio" name="accountno" value ="'+item.accountno+'"checked /></td>';
		tag += '<td>'+item.accountno+'</td>';
		tag += '<td>'+item.custid+'</td>';
		tag += '</tr>';
	})
	$("#myaccount").html(tag);
}
function sendaccount(){
	var accountno = $('input[name="accountno"]:checked').val();
	$(opener.document).find("#accountno1").val(accountno);
	window.close();
}
</script>
</head>

<body>

<div class="popwrap">

<h2>입금계좌선택</h2>
	<div style="">
		<table id = "myaccount">
		</table>

		<p class="list_btn">
				<a href="#" class="godeposit" onclick="sendaccount()">선택</a>
		</p>
	</div>
</div>



</body>

</html>