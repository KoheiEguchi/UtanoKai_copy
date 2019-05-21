<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>歌の削除</title>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<h1 class="space">歌の削除</h1>
			<jsp:include page="../include/msg.jsp" flush="true" />
			<form action="HaikuDelete?id=${id}" method="POST">
				<div class="row">
					<div class="col-md-4 col-xs-1"></div>
					<c:forEach items="${deleteHaiku}" var="haiku">
						<div class="col-md-4 col-xs-10 mr-3 list">
							<div class="row lists">
								<div class="col-2"></div>
								<div class="col-1 text-left">${haiku.strComposeDate} ${haiku.strComposeTime}</div>
								<div class="col-4">
									<p class="text-left py-3 font-weight-bold">${haiku.haiku}</p>
									<p class="text-right">${haiku.composer}</p>
								</div>
								<div class="col-2">${haiku.comment}</div>
								<div class="col-1 text-right">
									<c:if test="${haiku.strGood == 'noGood'}">
										まだ高評価されていません
									</c:if>
									<c:if test="${haiku.strGood != 'noGood'}">
										${haiku.strGood}人から高評価されました
									</c:if>
								</div>
								<div class="col-2"></div>
							</div>
						</div>
					</c:forEach>
					<div class="col-md-4 col-xs-1"></div>
				</div>
				<h3>この歌を<span class="delete">削除</span>しますがよろしいですか？</h3>
				<p class="py-4"><input class="btn btn-danger btn-sm shadow" type="submit" value="削除する(戻せません！)"></p>
				<p><a href="Top"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>
