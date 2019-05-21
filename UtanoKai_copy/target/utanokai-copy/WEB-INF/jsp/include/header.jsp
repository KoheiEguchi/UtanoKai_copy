<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>ヘッダー</title>
</head>
<body>
	<div class="header">
		<c:if test="${name != null}">
			<p class="leftSide">
				<a href="UserDetail?name=${name}"><input class="btn btn-primary shadow" type="button" value="あなたの詳細"></a>
				<c:if test="${name == 'admin'}">
					<a href="UserList"><input class="btn btn-danger shadow" type="button" value="会員"></a>
				</c:if>
			</p>
			<c:if test="${top == null}">
				<p class="rightSide"><a href="Top"><input class="btn btn-info shadow" type="button" value="入り口へ戻る"></a></p>
			</c:if>
			<c:if test="${top != null}">
				<p class="rightSide">
					<a href="#newHaikus"><input class="btn btn-info shadow" type="button" value="最新"></a>
					<a href="#goodHaikus"><input class="btn btn-success shadow" type="button" value="高評価"></a>
					<a href="#description"><input class="btn btn-warning shadow" type="button" value="説明"></a>
				</p>
			</c:if>
		</c:if>
	</div>
</body>
</html>
