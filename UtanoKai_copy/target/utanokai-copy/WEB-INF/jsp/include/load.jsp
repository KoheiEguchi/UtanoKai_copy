<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>読み込み中</title>
</head>
<body>
	<div id="loading" class="container">
		<jsp:include page="header.jsp" flush="true" />
		<div class="main"></div>
		<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>
</html>
