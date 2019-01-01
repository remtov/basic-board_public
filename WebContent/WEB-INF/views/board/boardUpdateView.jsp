<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardView</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {

		$j("#submit").on("click", function() {
			var param='';
			var $frm = $j('.boardWrite :input');
			param = $frm.serialize();
			/* alert(param); */
			$j.ajax({
				url : "/basic-board/board/updateBoard.do",
				dataType : "json",
				type : "POST",
				data : param,
				success : function(data, textStatus, jqXHR) {

					/* 					jqXHR = JSON.parse(jqXHR);  */

					 alert('게시물 수정이 완료되었습니다.'); 
					/* alert('data?????'+data+'textStatus?????'+textStatus+'jqXHR?????'+jqXHR); */
					location.href = '<%=rootPath%>/board/boardList.do';
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('에러가 발성했습니다.' + textStatus +" : "+ errorThrown);
					/*		alert("status??---" + status);
					alert("xhr??---" + xhr); */
				}

			});
		});

		$j("#delete").on("click", function() {
			if (confirm('정말 게시물을 삭제하시겠습니까?')) {
							var $frm = $j('.boardWrite :input');
							var param = $frm.serialize();
							
							$j.ajax({
								url : "/basic-board/board/boardDelete.do",
								dataType : "json",
								type : "POST",
								data : param,
								success : function(data, textStatus, jqXHR) {
								
									alert('게시물이 삭제 되었습니다.');
					 
									location.href = '/basic-board/board/boardList.do';
								},
								error : function(xhr, status, error) {
									alert("error??---" + error);
									
									alert('죄송합니다. 서버오류가 발생 하였습니다.');
								}
							});
       			} else {
               					
       			}
	
		});

	});
</script>
<body>
	<%-- ${board} | ${board.boardNum} | ${board.boardType} --%>
	<%-- ${comCodeList} --%>
	<form class="boardWrite">
		<input name="boardNum" type="hidden" size="50" value="${board.boardNum}">
		<table align="center">
			<tr>
				<td align="right"><input id="submit" type="submit" value="수정"> <input id="delete" type="submit" value="삭제"></td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="120" align="center">Type</td>
							<td width="400"><select name="boardType" >
									<option selected value="none" disabled>선택</option>
									<c:forEach items="${comCodeList}" var="comCodeListForEach">
										<c:choose>
											<c:when test="${comCodeListForEach.codeId eq board.boardType}">
												<option value="${comCodeListForEach.codeId}" selected>${comCodeListForEach.codeName}</option>
											</c:when>
											<c:otherwise>
												<option value="${comCodeListForEach.codeId}">${comCodeListForEach.codeName}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td width="120" align="center">Title</td>
							<td width="400"><input name="boardTitle" type="text" size="50" value="${board.boardTitle}"><br></td>
						</tr>
						<tr>
							<td height="300" align="center">Comment</td>
							<td valign="top"><textarea name="boardComment" rows="20" cols="55">${board.boardComment}</textarea></td>
						</tr>
						<tr>
							<td align="center">Writer</td>
							<td>${board.creator}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="<%=rootPath%>/board/boardList.do">List</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
