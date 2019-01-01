<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
</head>
<script type="text/javascript">
	
function enter(ent) {
	var code = ent.which ? ent.which : event.keyCode;
		if (code == 13) {
			save();
		}
	}
	
	
$j(document).ready(function() {

		$j("#submit").on("click", function() {
			save();
		});//서밋클릭
	});//도큐먼트레디

	function save(){
			var boardTypeValue = $j('#boardType').val();	
			var boardTitleValue = $j('#boardTitle').val();	
			var boardCommentValue = $j('#boardComment').val();	
		 			
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
				if(boardTypeValue==null||boardTypeValue=='none'){
						alert('\'Type\'항목을 클릭하여 작성하실 분류를 선택하여 주십시오.');
						return false;
				}else if(boardTitleValue==null||boardTitleValue.trim()==''){
						alert('\'Title\'항목에 게시물의 제목을 입력하여 주십시오.');
						return false;
				}else if(boardCommentValue==null||boardCommentValue.trim()==''){
						alert('\'Comment\'항목에 게시물의 내용을 입력하여 주십시오.');
						return false;
				}else{
						$j.ajax({
							url : "/basic-board/board/boardWriteAction.do",
							dataType : "json",
							type : "POST",
							data : param,
							success : function(data, textStatus, jqXHR) {
								 alert("게시물 작성이 완료되었습니다."); 
								location.href = "/basic-board/board/boardList.do";
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("실패");
							}
						});
					}//else
	}//save
</script>
<body>
	<%-- 	<c:forEach items="${comCodeList}" var="list">
		<p>${list.codeType}, ${list.codeId}, ${list.codeName}, ${list.creator}, ${list.createTime}, ${list.modifier},</p>
	</c:forEach> --%>
		
	
<c:choose>
	<c:when test="${userlogininfo ne null}">
		<form class="boardWrite">
			<table align="center">
				<tr>
					<td align="right"><input id="submit" type="button" value="작성"> <input type="button" value="행추가"></td>
				</tr>
				<tr>
					<td>
						<table border="1">
							<tr>
								<td width="120" align="center">Type</td>
								<td width="400"><select name="boardType"  id="boardType">
										<option selected value="none" disabled>선택</option>
										<c:forEach items="${comCodeList}" var="comCodeListForEach">
											<option value="${comCodeListForEach.codeId}">${comCodeListForEach.codeName}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td width="120" align="center">Title</td>
								<td width="400"><input name="boardTitle" type="text" size="50" value="${board.boardTitle}" id="boardTitle" placeholder="제목 ↵" onkeypress="enter(event)"></td>
							</tr>
							<tr>
								<td height="300" align="center">Comment</td>
								<td valign="top"><textarea name="boardComment" rows="20" cols="55" id="boardComment" placeholder="내용 ↵" onkeypress="enter(event)">${board.boardComment}</textarea></td>
							</tr>
							<tr>
								<td align="center">Writer</td>
								<td><input name="creator" type="text" size="50" value="${userlogininfo.userId}" readonly/></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="right"><a href="<%=rootPath%>/board/boardList.do">List</a></td>
				</tr>
		
			</table>
		</form>
	</c:when>
	<c:otherwise>
		<script>
			alert("로그인이 되어 있지 않은 상태입니다. 로그인 후 이용 부탁 드립니다.");
			location.href='/basic-board/userInfo/login.do';
		</script>
	</c:otherwise>			
</c:choose>
	
</body>
</html>