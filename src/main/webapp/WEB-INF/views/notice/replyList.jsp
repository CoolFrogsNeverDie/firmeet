<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<table style="width:700px">
	<c:forEach var="row" items="${rlist }">
		<tr>
			<td>
				${row.memberId }${row.replyDate }
			<br>
				${row.replyContent }
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>