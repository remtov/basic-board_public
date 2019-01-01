<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	String rootPath = request.getContextPath();
	String uri = request.getRequestURI();
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script src="<%=rootPath%>/resources/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	var $j = jQuery.noConflict();
</script>
<body>

<a href="https://docs.google.com/spreadsheets/d/1am79hyguzcChrCsgzk_iek3EBAGwnKLkfimWKSrYcYk/edit#gid=0" style="position:fixed; right:0px; bottom:0px;">작업용테스트문서</a>



</body>
</html>