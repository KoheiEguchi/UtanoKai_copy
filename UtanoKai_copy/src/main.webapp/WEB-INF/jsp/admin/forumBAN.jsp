<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/display/head.jsp" flush="true" />
	<title>投稿削除</title>
</head>
<body>
	<jsp:include page="../include/display/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/display/header.jsp" flush="true" />
		<div class="main">
			<h1 class="mt-4">投稿削除</h1>
			<jsp:include page="../include/display/msg.jsp" flush="true" />
			<form action="ForumBAN?id=${id}" method="POST">
				<c:forEach items="${banComment}" var="forum">
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-2 col-xs-4 font-weight-bold text-left border-bottom border-dark">投稿日時</div>
								<div class="col-md-4 col-xs-6 font-weight-bold text-left border-bottom border-dark">
									<f:formatDate value="${forum.commentDate}" pattern="yyyy年M月d日" /> 
									<f:formatDate value="${forum.commentTime}" pattern="k時m分s秒" />
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-2 col-xs-4 font-weight-bold text-left border-bottom border-dark">お名前</div>
								<div class="col-md-4 col-xs-6 font-weight-bold text-left border-bottom border-dark">${forum.name}</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-2 col-xs-4 font-weight-bold text-left border-bottom border-dark">本文</div>
								<div class="col-md-4 col-xs-6 font-weight-bold text-left border-bottom border-dark">${forum.comment}</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<br>
						</div>
						<div class="col-1"></div>
					</div>
				</c:forEach>
				<h3>この投稿を<span class="h1 text-danger font-weight-bold">削除</span>しますがよろしいですか？</h3>
				<p class="py-5"><input class="btn btn-danger btn-sm shadow" type="submit" value="削除する(戻せません！)"></p>
				<p><a href="Forum"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
			</form>
		</div>
		<jsp:include page="../include/display/footer.jsp" flush="true" />
	</div>
</body>
</html>