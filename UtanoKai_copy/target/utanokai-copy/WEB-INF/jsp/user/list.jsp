<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>${genreName}</title>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<jsp:include page="../include/title.jsp" flush="true" />
			<h3>${genreName}</h3>
			<jsp:include page="../include/msg.jsp" flush="true" />
			<div class="row">
				<div class="col-md-2 col-xs-1"></div>
				<div class="col-md-8 col-xs-10">
					<c:if test="${genreName == '俳句・川柳'}">
						<div class="bg-success my-3 py-4"><div class="whiteWord"><jsp:include page="../include/haiku.jsp" flush="true" /></div></div>
					</c:if>
					<c:if test="${genreName == '短歌'}">
						<div class="bg-info my-3 py-4"><jsp:include page="../include/tanka.jsp" flush="true" /></div>
					</c:if>
					<c:if test="${genreName == '長歌'}">
						<div class="bg-warning my-3 py-4"><jsp:include page="../include/choka.jsp" flush="true" /></div>
					</c:if>
					<c:if test="${genreName == '都々逸'}">
						<div class="bg-danger my-3 py-4"><div class="whiteWord"><jsp:include page="../include/dodoitsu.jsp" flush="true" /></div></div>
					</c:if>
				</div>
				<div class="col-md-2 col-xs-1"></div>
			</div>
			<form action="List?genre=${genre}" method="POST">
				<jsp:include page="../include/searchForm.jsp" flush="true" />
			</form>
			<form action="List?genre=${genre}" method="POST">
				<jsp:include page="../include/orderSelect.jsp" flush="true" />
			</form>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<div class="bg-secondary py-1 haikusGenre">
						<h4 class="font-weight-normal whiteWord">${genreName}の一覧(${order})</h4>
					</div>
					<div class="row">
						<c:forEach items="${list}" var="list" varStatus="listNum">
							<c:if test="${listNum.count % 2 == 0}">
								<div class="col-lg-4 col-xs-12 bg-light shadow list zoom">
									<div class="row lists">
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=${genre}">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
										<div class="col-1 text-left py-3">${list.strComposeDate} ${list.strComposeTime}</div>
										<div class="col-5">
											<p class="text-left py-3 font-weight-bold">${list.haiku}</p>
											<p class="text-right">
												<object><a class="linkName" href="UserDetail?name=${list.composer}">${list.composer}</a></object>
											</p>
										</div>
										<div class="col-2">${list.comment}</div>
										<div class="col-2">
											<c:if test="${name != list.composer}">
												<c:if test="${list.strGood == 'noGood'}">
													まだ<a class="linkGood" href="Good?id=${list.id}&genre=${genre}">高評価</a>されていません
												</c:if>
												<c:if test="${list.strGood != 'noGood'}">
													<p class="text-right">
														${list.strGood}人から<a class="linkGood" href="Good?id=${list.id}&genre=${genre}">高評価</a>されました
													</p>
												</c:if>
											</c:if>
											<c:if test="${name == list.composer}">
												<c:if test="${list.strGood == 'noGood'}">
													<p class="text-right">まだ高評価されていません</p>
												</c:if>
												<c:if test="${list.strGood != 'noGood'}">
													<p class="text-right">${list.strGood}人から高評価されました</p>
												</c:if>
											</c:if>
										</div>
										<div class="col-1"></div>
									</div>
								</div>
							</c:if>
							<c:if test="${listNum.count % 2 != 0}">
								<div class="col-lg-4 col-xs-12 bg-danger shadow list zoom">
									<div class="row lists">
										<div class="col-1">
											<c:if test="${name == 'admin'}">
												<a href="HaikuDelete?id=${list.id}&genre=${genre}">
													<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
												</a>
											</c:if>
										</div>
										<div class="col-1 text-left py-3 whiteWord">${list.strComposeDate} ${list.strComposeTime}</div>
										<div class="col-5">
											<p class="text-left py-3 font-weight-bold whiteWord">${list.haiku}</p>
											<p class="text-right">
												<object><a class="linkName" href="UserDetail?name=${list.composer}">${list.composer}</a></object>
											</p>
										</div>
										<div class="col-2 whiteWord">${list.comment}</div>
										<div class="col-2">
											<c:if test="${name != list.composer}">
												<c:if test="${list.strGood == 'noGood'}">
													<p class="text-right whiteWord">
														まだ<a class="linkGood" href="Good?id=${list.id}&genre=${genre}">高評価</a>されていません
													</p>
												</c:if>
												<c:if test="${list.strGood != 'noGood'}">
													<p class="text-right whiteWord">
														${list.strGood}人から<a class="linkGood" href="Good?id=${list.id}&genre=${genre}">高評価</a>されました
													</p>
												</c:if>
											</c:if>
											<c:if test="${name == list.composer}">
												<c:if test="${list.strGood == 'noGood'}">
													<p class="text-right whiteWord">まだ高評価されていません</p>
												</c:if>
												<c:if test="${list.strGood != 'noGood'}">
													<p class="text-right whiteWord">${list.strGood}人から高評価されました</p>
												</c:if>
											</c:if>
										</div>
										<div class="col-1"></div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="bg-secondary py-2 haikusGenre"><h2></h2></div>
				</div>
				<div class="col-1"></div>
			</div>
			<p class="mt-5"><a href="Top"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>
