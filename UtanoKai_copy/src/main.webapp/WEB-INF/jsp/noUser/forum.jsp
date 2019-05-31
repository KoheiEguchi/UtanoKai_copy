<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/display/head.jsp" flush="true" />
	<title>ご意見投稿</title>
</head>
<body>
	<jsp:include page="../include/display/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/display/header.jsp" flush="true" />
		<div class="main">
			<h1 class="mt-4">ご意見投稿</h1>
			<jsp:include page="../include/display/msg.jsp" flush="true" />
			<c:if test="${name == 'admin'}">
				<div class="row">
					<c:forEach items="${forumList}" var="forum">
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
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-6 col-xs-10">
									<a href="ForumBAN?id=${forum.id}"><input class="btn btn-danger shadow" type="button" value="この投稿を削除する"></a>
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<br>
						</div>
						<div class="col-1"></div>
					</c:forEach>
				</div>
			</c:if>
			<c:if test="${name != 'admin'}">
				<p class="py-2">何かご意見がございましたら下よりご連絡ください。</p>
				<form action="Forum" method="POST">
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="row py-2">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-2 col-xs-12 font-weight-bold text-left border-bottom border-dark">お名前</div>
								<div class="col-md-4 col-xs-12 text-right border-bottom border-dark">
									<input type="text" name="name" size="30" placeholder="お名前をお教えください(任意)" autofocus>
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<div class="row py-2">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-1 col-xs-12 font-weight-bold text-left border-bottom border-dark">本文</div>
								<div class="col-md-5 col-xs-12 text-right border-bottom border-dark">
									<textarea class="forumArea" name="comment" cols="46" rows="10" placeholder="ご意見をお書きください"></textarea>
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
						</div>
					</div>
					<p class="my-4"><input class="btn btn-success btn-lg shadow" type="submit" value="投稿"></p>
				</form>
			</c:if>
			<c:if test="${name == null}">
				<p class="py-4"><a href="Login"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
			</c:if>
			<c:if test="${name != null}">
				<p class="py-4"><a href="Top"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
			</c:if>
		</div>
		<jsp:include page="../include/display/footer.jsp" flush="true" />
	</div>
</body>
</html>