<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
	<script src="resources/jquery-3.3.1.min.js"></script>
	<script src="resources/js/rsa.js"></script>
	<script src="resources/js/SecureRandom.js"></script>
	<script src="resources/js/jsbn.js"></script>
	<script>
		function isitaccount(){
			
			var accountno = $("#pop_account").val();
			
			$.ajax({
				type : 'GET',
				data : 'accountno='+accountno,
				url : 'selectaccount',
				success : function(resp){
					if(resp=='yes'){
						$("#accountcheck").html('위 계좌번호는 유효합니다.</span><br/><br /><br /><p><a href="#" onclick="confirmedaccount()" class="select">사용</a></p>');
					}
					else{
						$("#accountcheck").html("계좌번호가 존재하지 않습니다.<br>계좌번호를 확인해주세요</span>");
						$("#pop_account").val("");
					}
				}
			})
		}
function confirmedaccount(){
	window.close();
}
	</script>
</head>
<div class="popwrap">

<h2>입금 계좌번호 확인</h2>
	<div>
		<p class="list_btn">
			<input type="text" id = "pop_account" class="wr_idcheck" value = "${pop_account}"/> <a href="#" onclick="isitaccount()">조회</a><br /><br />
			<span style="display:;">
				<span id="accountcheck">
			</span>
		</p>
		
	</div>
</div>
</body>

</html>