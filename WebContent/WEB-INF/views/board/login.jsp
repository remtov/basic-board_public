<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<style>
td {
	/* border: 1px solid red; */
	
}
</style>
<script type="text/javascript">

		
	$j(document).ready(function() {
		 
		$j("#submit").on("click", function() {
			save();
		});
		
	});

	function enter(ent) {
			var code = ent.which ? ent.which : event.keyCode;
			if (code == 13) {
				save();
			}
	}

	function save(){
		
		var userIdValue = $j('#userId').val();			
		var userPwValue = $j('#userPw').val();
		var $frm = $j('.loginWrite :input');
		var param = $frm.serialize();
									
 		/* alert('폼태그 안에 값들 :'+param);  */
		
		if (userIdValue == '' || userIdValue == null) {
			alert('아이디를 입력 부탁드립니다.');
			document.querySelector('#userId').focus();
			return false;
		} else if (userPwValue == '' || userPwValue == null) {
			alert('비밀번호를 입력 부탁드립니다.');
			 document.querySelector('#userPw').focus();
			return false;
		} else {
		
			$j.ajax({
				url : '/basic-board/userInfo/loginAction.do',
				dataType : 'text',
				type : 'POST',
				data : param,
				success : function(data, textStatus, jqXHR) {
					 /* alert('data : '+ data + 'textStatus : ' + textStatus); */
					if(data == 'N'){
						alert('아이디나 비밀번호가 틀렸습니다. 다시 확인 부탁드립니다.')
						return false;
					}else{
						/* alert(textStatus); */
						alert('로그인이 완료되셨습니다.');
					 	location.href = document.referrer;
					}
				},
				error : function(request, status, error) {
					alert("유효성검사 통과 후 서버응답 오류");
					alert("code:" + request.status);
			
					/* 유효성검사는 통과됬고 에러뜨는데 실제로 로그인은 되어 있다. */
					
				}
			});
		}//else구문
	}
</script>
<body>
<%-- ${comCodeList} --%>
<%-- ${userlogininfo} --%>
	<form name="loginWrite" class="loginWrite">
		<table align="center">
			<tr>
				<td align="left">
					<a href="<%=rootPath%>/board/boardList.do">List</a>
				</td>
			</tr>
			<tr>
				<td>
					<table id="boardTable" border="1">
						<tr>
							<td width="100" align="center">id</td>
							<td width="200">
								<input name="userId" id="userId" size="15" type="text" placeholder="아이디 ↵" onkeypress="enter(event)"/>
								
							</td>
						</tr>
						<tr>
							<td align="center">pw</td>
							<td>
								<input name="userPw" id="userPw" size="15" type="password" placeholder="비밀번호 ↵" onkeypress="enter(event)" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<a id="submit">login</a>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>