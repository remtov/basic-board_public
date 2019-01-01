<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardView</title>
<script>
	
</script>
</head>
<body>
	<%-- 	${comCodeList}
	<br> ${board.boardType} --%>
		<%-- ${board} --%>
		
	<table align="center">
		<tr>
			<td>
				<table border="1">
					<tr>
						<td width="120" align="center">Type</td>
						<td width="400"><c:forEach items="${comCodeList}" var="comCodeListForEach">
								<c:choose>
									<c:when test="${comCodeListForEach.codeId eq board.boardType}">
																		${comCodeListForEach.codeName}
												</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</c:forEach></td>
					</tr>
					<tr>
						<td width="120" align="center">Title</td>
						<td width="400"><input name="boardTitle" type="text" size="50" value="${board.boardTitle}" disabled></td>
					</tr>
					<tr>
						<td height="300" align="center">Comment</td>
						<td valign="top"><textarea name="boardComment" rows="20" cols="55" disabled>${board.boardComment} </textarea></td>
					</tr>
					<tr>
						<td align="center">Writer</td>
						<td>${board.creator}</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><a href="<%=rootPath%>/board/boardList.do" style="margin-right:5px;">List</a><a href="<%=rootPath%>/board/${board.boardType}/${board.boardNum}/boardUpdateView.do?pageNo=${pageNo}" id="submit">Update</a></td>
		</tr>
	</table>
</body>
</html>
