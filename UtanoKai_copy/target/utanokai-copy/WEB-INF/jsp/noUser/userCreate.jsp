<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>入会</title>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<h1 class="mt-4">はじめまして</h1>
			<jsp:include page="../include/msg.jsp" flush="true" />
			<p class="py-2">俳号と合言葉をお作りください。</p>
			<form action="UserCreate" method="POST">
				<jsp:include page="../include/createForm.jsp" flush="true" />
				<p class="my-4"><input class="btn btn-success btn-lg shadow" type="submit" value="入会"></p>
			</form>
			<p class="py-4"><a href="Login"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>
