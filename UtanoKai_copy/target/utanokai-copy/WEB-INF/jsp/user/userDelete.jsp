<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>退会</title>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<h1 class="mt-5">退会の確認</h1>
			<jsp:include page="../include/msg.jsp" flush="true" />
			<h2 class="py-3">本当に<span class="h1 text-danger font-weight-bold">退会</span>されますか？</h2>
			<form action="UserDelete" method="POST">
				<p class="py-5"><input class="btn btn-danger btn-sm shadow" type="submit" value="退会する(元に戻せません！)"></p>
				<p><a href="Top"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>