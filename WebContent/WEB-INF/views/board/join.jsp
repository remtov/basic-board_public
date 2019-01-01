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
	var idCheckDuplicatesConfirm = 0;
	var compareTwoPasswords = 0;

	function idCheckDuplicates() {
		var userIdValue = $j('#userId').val().trim();
		var param = { userId : userIdValue };
		
		/* alert('중복체크버튼 작동 id=\''+param.userId+'\''); */
		$j.ajax({
			url : "/basic-board/userInfo/idCheckDuplicatesAction.do",
			dataType : "text",
			type : "POST",
			data : param,
			success : function(data, textStatus, jqXHR) {
				/* 				alert("\'/basic-board/board/idCheckDuplicatesAction.do\'컨트롤러작동 성공"); */
				/* console.log(data); */
				if (data == 1) {
					alert('사용중인 아이디입니다. 변경 부탁드립니다.');
				} else {
					alert('사용하실 수 있는 아이디입니다.');
					idCheckDuplicatesConfirm = 1;
				}
				/* location.href = "/basic-board/board/boardList.do"; */
			},
			error : function(request, status, error) {
				alert("id가 중복체크에 실패하였습니다. " + request.status + ' : '
						+ request.responseText);
			}
		});
	}
	
	function notNullCheck(joinWrite){
		var formNotNullCheck =$j("form[name="+joinWrite+"]");
		var notNullElements = formNotNullCheck.find("[not-null]");
		
		for(var i=0;i<notNullElements.length;i++){
			if(notNullElements.eq(i).val()==''){
				alert("" + notNullElements.eq(i).attr("not-null-name") + ' 은(는) 필수로 입력하셔야 합니다.');
				notNullElements.eq(i).focus();
				return true;
			}
		}
		return false;
	}
	
	function enter(ent) {
		var code = ent.which ? ent.which : event.keyCode;
			if (code == 13) {
				save();
			}
		}
	 
	$j(document).ready(function() {
		$j("#submit").on("click", function() {
			save();
		});//서밋버튼
	});//레디
	
	//널체크유효성
	function save(){
		var userPwValue = $j('#userPw').val();			
		var userPwCheckValue = $j('#userPwCheck').val();
		var $frm = $j('.joinWrite :input');
		var param = $frm.serialize();
		var postNoPattern = new RegExp(/^[0-9]{3}-[0-9]{3}$/);//우편번호패턴
			
		if (idCheckDuplicatesConfirm == 0) {
			alert('가입하시기 전에 아이디 중복체크를 부탁드립니다.');
			document.querySelector('#userId').focus();
			return false;
		} else if (userPwValue != userPwCheckValue) {
			alert('비밀번호와 비밀번호확인의 값이 틀립니다. 재확인 부탁드립니다.');
			 document.querySelector('#userPw').focus();
			return false;
		}else if( userPwValue.length < 6 ){
			alert('비밀번호는 6자리 이상으로 입력하여 주시기 바랍니다.');
			document.querySelector('#userPw').focus();
			return false;
		}else if($j('#userPhone2').val().length < 4 ){
			alert('\'phone\' 항목에는 4자리의 숫자를 입력하여 주십시오.');
			document.querySelector('#userPhone2').focus();
			return false;
		}else if($j('#userPhone3').val().length < 4 ){
			alert('\'phone\' 항목에는 4자리의 숫자를 입력하여 주십시오.');
			document.querySelector('#userPhone3').focus();
			return false;
		}else if(notNullCheck('joinWrite')){
			alert('빈칸에 내용을 적어 주십시오.')
			return false;
		}else if(isNaN($j('#userPhone2').val())){
			alert('\'phone\'항목에 숫자만 입력 가능하십니다.');
			document.querySelector('#userPhone2').focus();
			return false;						
		}else if(isNaN($j('#userPhone3').val())){	
			alert('\'phone\'항목에 숫자만 입력 가능하십니다.');
			document.querySelector('#userPhone3').focus();
			return false;				
		}else if(!($j('#userAddr1').val().match(postNoPattern))){
			alert('\'postNo\' 항목의 형식을 준수하여 주시기 바랍니다. \'000-000\'(숫자와 \'-\'만 입력 가능합니다.)');
			document.querySelector('#userAddr1').focus();
			return false;
		} else {
			$j.ajax({
				url : "/basic-board/userInfo/joinWriteAction.do",
				dataType : "json",
				type : "POST",
				data : param,
				success : function(data, textStatus, jqXHR) {
					
					alert("작성완료 결과 :"+ textStatus); 
					location.href = "/basic-board/board/boardList.do"; 
				},
				error : function(request, status, error) {
					alert("유효성검사 통과 후 요청,응답 실패");
					alert("code:" + request.status);
					/* 	alert("message:"+request.responseText);
						alert("error:"+error); */
				}
			});
		}//else구문
	}
</script>
<body>
<%-- ${comCodeList} --%>
	<form name="joinWrite" class="joinWrite">
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
							<td width="300">
								<input name="userId" id="userId" size="10" type="text" not-null="true" not-null-name="id" placeholder="아이디 ↵" onkeypress="enter(event)"/>
								<button type="button" onclick="idCheckDuplicates()">중복확인</button>
							</td>
						</tr>
						<tr>
							<td align="center">pw</td>
							<td>
								<input name="userPw" id="userPw" size="15" type="password" not-null="true" not-null-name="pw" placeholder="6~12글자의 비밀번호 ↵" maxlength="12" onkeypress="enter(event)" />
							</td>
						</tr>
						<tr>
							<td align="center">pw check</td>
							<td>
								<input name="pwCheck" id="userPwCheck" size="15" type="password" not-null="true" not-null-name="pw체크" placeholder="비밀번호 확인 ↵" maxlength="12" onkeypress="enter(event)"/>
							</td>
						</tr>
						<tr>
							<td align="center">name</td>
							<td>
								<input name="userName" id="userName" size="15" type="text" not-null="true" not-null-name="유저네임" placeholder="이름 ↵" onkeypress="enter(event)"/>
							</td>
						</tr>
						<tr>
							<td align="center">phone</td>
							<td>
								<select name="userPhone1" id="userPhone1" size="1">
									<c:forEach items="${comCodeList}" var="comCodeListForEach">
										<option value="${comCodeListForEach.codeId}">${comCodeListForEach.codeName}</option>	
									</c:forEach>
								</select>
								-
								<input name="userPhone2" id="userPhone2" size="3" type="text" not-null="true" not-null-name="핸드폰 번호 두번째 자리 ↵" maxlength="4" onkeydown="numberOnlyOnKeyDown()" placeholder="0000" onkeypress="enter(event)"/>
								-
								<input name="userPhone3" id="userPhone3" size="3" type="text" not-null="true" not-null-name="핸드폰 번호 세번째 자리 ↵" maxlength="4" onkeydown="numberOnlyOnKeyDown()" placeholder="0000" onkeypress="enter(event)" />
							</td>
						</tr>
						<tr>
							<td align="center">postNo</td>
							<td>
								<input name="userAddr1" id="userAddr1" size="15" type="text" placeholder="ex)123-456 ↵" maxlength="7" onkeypress="enter(event)" onkeypress="enter(event)" not-null="true" not-null-name="postNo"/>
							</td>
						</tr>
						<tr>
							<td align="center">address</td>
							<td>
								<input name="userAddr2" id="userAddr2" size="15" type="text" placeholder="주소 ↵" onkeypress="enter(event)" not-null="true" not-null-name="address"/>
							</td>
						</tr>
						<tr>
							<td align="center">company</td>
							<td>
								<input name="userCompany" id="userCompany" size="15" type="text" placeholder="회사 ↵" onkeypress="enter(event)" not-null="true" not-null-name="company"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<a id="submit" href="#">join</a>
				</td>
			</tr>
		</table>
	</form>
	<script>

	</script>
</body>
</html>