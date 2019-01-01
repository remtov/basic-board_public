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
	
function logOutAction() {
	
	$j.ajax({
		url : '/basic-board/userInfo/logOutAction.do',
		method : 'POST',
		success : function(res) {
			if (res == '1') {
			alert("로그아웃 완료");
			location.href = "/basic-board/board/boardList.do";		
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("에러발생" + textStatus + " : " + errorThrown);
			}
		});	
	}
		
	$j(document).ready(function() {
		
		//로그아웃
		$j("#logOut").on("click", function() {
			logOutAction();
		});
		
		/* 핸들러 올체크 */
		$j(document).on("change", "#allCheckBox", function() {
			$j('.OneCheckBox').prop("checked", $j(this).prop("checked"));
		});


		$j(document).on("click", "#checkBoxLookUp", function() {
			var $frm = $j('.checkBoxLookUpForm :input');
			param = $frm.serialize();
			/* alert('param???'+param); */
			var afterLookUpAction = document.getElementById("afterLookUp");

			$j.ajax({
				url : "/basic-board/board/boardList.do",
				dataType : "text",
				type : "GET",
				data : param,
				success : function(data, textStatus, jqXHR) {
					/* alert("작성완료"); */
					$j("#beforeLookUp").hide();
					$j(".OneCheckBox").attr("disabled", true);
					/* 
					 alert('data??' + data);
					 alert('textStatus??' + textStatus);
					 alert('jqXHR??' + jqXHR); */
					afterLookUpAction.innerHTML = data;

				},
				error : function(jqXHR, textStatus, errorThrown) {

					alert("에러발생" + textStatus + " : " + errorThrown);

				}
			});

		});
	});
</script>
<body>
	<%-- ${comCodeList} --%>
	<%-- ${pageVo.codeId01} --%>
	<%-- ${userlogininfo}	 --%>
	
	
	<div id="beforeLookUp">
		<table align="center">
			<tr>
				<td align="right">
					<span style="float: left;">
						<c:choose>
							<c:when test="${userlogininfo ne null}">${userlogininfo.userId}</c:when>
							<c:otherwise><a href="<%=rootPath%>/userInfo/login.do">login</a> <a href="<%=rootPath%>/userInfo/join.do">join</a></c:otherwise>
						</c:choose>
					</span>
					total : ${totalCnt}
				</td>
			</tr>
			<tr>
				<td>
					<table id="boardTable" border="1">
						<tr>
							<td width="80" align="center">Type</td>
							<td width="40" align="center">No</td>
							<td width="400" align="center">Title</td>
						</tr>
						<c:forEach items="${boardList}" var="boardListForEach">
							<tr>
								<td align="center">
									<c:forEach items="${comCodeList}" var="comCodeListForEach">
										<c:choose>
											<c:when test="${comCodeListForEach.codeId eq boardListForEach.boardType}">
										${comCodeListForEach.codeName}
										</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</td>
								<td>${boardListForEach.boardNum}</td>
								<td>
									<a href="<%=rootPath%>/board/${boardListForEach.boardType}/${boardListForEach.boardNum}/boardView.do?pageNo=${pageNo}">${boardListForEach.boardTitle}</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<form class="checkBoxLookUpForm">
						<span style="float: left;"> <input type='checkbox' name='allCheck' value='allCheck' id="allCheckBox" />전체 
								<c:forEach items="${comCodeList}" var="comCodeListCheckBox">
									<input type='checkbox' name='codeId' value='${comCodeListCheckBox.codeId}' id="${comCodeListCheckBox.codeId}" class="OneCheckBox" />${comCodeListCheckBox.codeName}
								</c:forEach> 
							<input id="checkBoxLookUp" type="button" value="조회">
						</span>
					</form>
					<a href="<%=rootPath%>/board/boardWrite.do">글쓰기</a>
					
					<c:choose>
							<c:when test="${userlogininfo ne null}"><a href="" id="logOut"> 로그아웃</a></c:when>
							<c:otherwise></c:otherwise>
					</c:choose>
					
					
				</td>
			</tr>
			<tr>
				<td id="page" align="center">
					<%-- ${pageNo } --%>
					<c:forEach var="i" begin="1" end="${pageNo}">
						  <c:if test=""> </c:if>
							<c:choose>
							    <c:when test="${pageVo.codeId01 eq null && pageVo.codeId02 eq null && pageVo.codeId03 eq null && pageVo.codeId04 eq null}">
									<a href="<%=rootPath%>/board/boardList.do?pageNo=${i}&codeId01=a01&codeId02=a02&codeId03=a03&codeId04=a04">${i}</a>     
							    </c:when>
							    <c:otherwise>
									<a href="<%=rootPath%>/board/boardList.do?pageNo=${i}&codeId01=${pageVo.codeId01}&codeId02=${pageVo.codeId02}&codeId03=${pageVo.codeId03}&codeId04=${pageVo.codeId04}">${i}</a>
							    </c:otherwise>
							</c:choose>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	<div id="afterLookUp"></div>
	<script>

	</script>
</body>
</html>