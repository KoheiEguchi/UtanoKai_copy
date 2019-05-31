<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp" flush="true" />
	<title>フッター</title>
</head>
<body>
	<div class="footer">
		<c:if test="${name != null}">
			<p class="leftSide"><a href="Login"><input class="btn btn-warning btn-lg shadow" type="button" value="退室"></a></p>
		</c:if>
		<p class="rightSide"><a href="Forum"><input class="btn btn-light btn-lg shadow" type="button" value="ご意見はこちら"></a></p>
	</div>
</body>
</html>
