<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Selecall Checkbox sample</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() { /*Handler For SelectAll Checkbox*/
		$("#selectallchkbox").change(function() {
			$('.tvChkBox').prop("checked", $(this).prop("checked"));
		}); /*Handler For rest of the checkbox*/
		$('.tvChkBox').change(function() {
			if ($('.tvChkBox').length == $('.tvChkBox:checked').length) {
				$("#selectallchkbox").prop("checked", true);
			} else {
				$("#selectallchkbox").prop("checked", false);
			}
		});
	});
</script>
</head>
<table bgcolor="#E9E9E9" border="1">
	<tr>
		<td>
			<B>Selectall Sample</B><BR>
			<BR>
			<table border='1'>
				<tr>
					<th>
						<input type="checkbox" id="selectallchkbox" />
					</th>
					<th>TV Brand</th>
					<th>Rank</th>
				</tr>
				<tr>
					<td>
						<input class="tvChkBox" type="checkbox" id="tvChkBox1" />
					</td>
					<td>Sony</td>
					<td>1</td>
				</tr>
				<tr>
					<td>
						<input class="tvChkBox" type="checkbox" id="tvChkBox2" />
					</td>
					<td>Samsung</td>
					<td>3</td>
				</tr>
				<tr>
					<td>
						<input class="tvChkBox" type="checkbox" id="tvChkBox3" />
					</td>
					<td>LG</td>
					<td>2</td>
				</tr>
				<tr>
					<td>
						<input class="tvChkBox" type="checkbox" id="tvChkBox4" />
					</td>
					<td>Onida</td>
					<td>4</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
