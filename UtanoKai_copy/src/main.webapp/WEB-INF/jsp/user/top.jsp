<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/origin/top.css">
	<jsp:include page="../include/display/head.jsp" flush="true" />
	<title>ようこそ</title>
</head>
<body>
	<jsp:include page="../include/display/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/display/header.jsp" flush="true" />
		<div class="main">
			<jsp:include page="../include/display/title.jsp" flush="true" />
			<jsp:include page="../include/display/msg.jsp" flush="true" />
			<div class="py-4">
				<h3>ようこそ ${name}様</h3>
				<p class="mt-3"><a href="Compose"><input class="btn btn-success btn-lg shadow" type="button" value="新たに詠む"></a></p>
			</div>
			<jsp:include page="../include/description/topDesc.jsp" flush="true" />
			
			<!-- ここから最新の歌一覧 -->
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<div id="newHaikus" class="py-4"></div>
					<div class="bg-secondary py-2 haikusGenre"><h3 class="whiteWord">最新の歌</h3></div>
					<div class="row tops">
						<div class="col-md-6 col-xs-12 order-md-2 bg-success shadow list zoom">
							<a class="linkMenuHaiku whiteHover" href="List?genre=1">
								<div class="col-2 h3 font-weight-normal">俳句・川柳</div>
								<c:forEach items="${newHaiku}" var="haiku">
									<div class="col-1 text-left py-3">${haiku.strComposeDate} ${haiku.strComposeTime}</div>
									<div class="col-2 text-left py-3 font-weight-bold">${haiku.haiku}</div>
									<div class="col-1 text-right mb-4">
										<object><a class="linkName" href="UserDetail?name=${haiku.composer}">${haiku.composer}</a></object>
									</div>
									<div class="col-3 mobileHidden">${haiku.comment}</div>
									<div class="col-2">
										<c:if test="${name != haiku.composer}">
											<p class="text-right">
												<object>
													<c:if test="${haiku.strGood == 'noGood'}">
														まだ<a class="linkGood" href="Good?id=${haiku.id}&genre=1&top=top">高評価</a>されていません
													</c:if>
													<c:if test="${haiku.strGood != 'noGood'}">
														${haiku.strGood}人から<a class="linkGood" href="Good?id=${haiku.id}&genre=1&top=top">高評価</a>されました
													</c:if>
												</object>
											</p>
										</c:if>
										<c:if test="${name == haiku.composer}">
											<c:if test="${haiku.strGood == 'noGood'}">
												<p class="text-right">まだ高評価されていません</p>
											</c:if>
											<c:if test="${haiku.strGood != 'noGood'}">
												<p class="text-right">${haiku.strGood}人から高評価されました</p>
											</c:if>
										</c:if>
									</div>
									<div class="col-1"></div>
								</c:forEach>
							</a>
						</div>
						<div class="col-md-6 col-xs-12 order-md-1 bg-info shadow list zoom">
							<a class="linkMenuTanka blackHover" href="List?genre=2">
								<div class="col-2 h3 font-weight-normal">短歌</div>
								<c:forEach items="${newTanka}" var="tanka">
									<div class="col-1 text-left py-3">${tanka.strComposeDate} ${tanka.strComposeTime}</div>
									<div class="col-2 text-left py-3 font-weight-bold">${tanka.haiku}</div>
									<div class="col-1 text-right mb-4">
										<object><a class="linkName" href="UserDetail?name=${tanka.composer}">${tanka.composer}</a></object>
									</div>
									<div class="col-3 mobileHidden">${tanka.comment}</div>
									<div class="col-2">
										<c:if test="${name != tanka.composer}">
											<p class="text-right">
												<object>
													<c:if test="${tanka.strGood == 'noGood'}">
														まだ<a class="linkGood" href="Good?id=${tanka.id}&genre=2&top=top">高評価</a>されていません
													</c:if>
													<c:if test="${tanka.strGood != 'noGood'}">
														${tanka.strGood}人から<a class="linkGood" href="Good?id=${tanka.id}&genre=2&top=top">高評価</a>されました
													</c:if>
												</object>
											</p>
										</c:if>
										<c:if test="${name == tanka.composer}">
											<c:if test="${tanka.strGood == 'noGood'}">
												<p class="text-right">まだ高評価されていません</p>
											</c:if>
											<c:if test="${tanka.strGood != 'noGood'}">
												<p class="text-right">${tanka.strGood}人から高評価されました</p>
											</c:if>
										</c:if>
									</div>
									<div class="col-1"></div>
								</c:forEach>
							</a>
						</div>
					</div>
					<div class="row tops">
						<div class="col-md-6 col-xs-12 order-md-2 bg-warning shadow list zoom">
							<a class="linkMenuSedoka blackHover" href="List?genre=3">
								<div class="col-2 h3 font-weight-normal">旋頭歌</div>
								<c:forEach items="${newSedoka}" var="sedoka">
									<div class="col-1 text-left py-3">${sedoka.strComposeDate} ${sedoka.strComposeTime}</div>
									<div class="col-2 text-left py-3 font-weight-bold">${sedoka.haiku}</div>
									<div class="col-1 text-right mb-4">
										<object><a class="linkName" href="UserDetail?name=${sedoka.composer}">${sedoka.composer}</a></object>
									</div>
									<div class="col-3 mobileHidden">${sedoka.comment}</div>
									<div class="col-2">
										<c:if test="${name != sedoka.composer}">
											<p class="text-right">
												<object>
													<c:if test="${sedoka.strGood == 'noGood'}">
														まだ<a class="linkGood" href="Good?id=${sedoka.id}&genre=3&top=top">高評価</a>されていません
													</c:if>
													<c:if test="${sedoka.strGood != 'noGood'}">
														${sedoka.strGood}人から<a class="linkGood" href="Good?id=${sedoka.id}&genre=3&top=top">高評価</a>されました
													</c:if>
												</object>
											</p>
										</c:if>
										<c:if test="${name == sedoka.composer}">
											<c:if test="${sedoka.strGood == 'noGood'}">
												<p class="text-right">まだ高評価されていません</p>
											</c:if>
											<c:if test="${sedoka.strGood != 'noGood'}">
												<p class="text-right">${sedoka.strGood}人から高評価されました</p>
											</c:if>
										</c:if>
									</div>
									<div class="col-1"></div>
								</c:forEach>
							</a>
						</div>
						<div class="col-md-6 col-xs-12 order-md-1 bg-danger shadow list zoom">
							<a class="linkMenuDodoitsu whiteHover" href="List?genre=4">
								<div class="col-2 h3 font-weight-normal">都々逸</div>
								<c:forEach items="${newDodoitsu}" var="dodoitsu">
									<div class="col-1 text-left py-3">${dodoitsu.strComposeDate} ${dodoitsu.strComposeTime}	</div>
									<div class="col-2 text-left py-3 font-weight-bold">${dodoitsu.haiku}</div>
									<div class="col-1 text-right mb-4">
										<object><a class="linkName" href="UserDetail?name=${dodoitsu.composer}">${dodoitsu.composer}</a></object>
									</div>
									<div class="col-3 mobileHidden">${dodoitsu.comment}</div>
									<div class="col-2">
										<c:if test="${name != dodoitsu.composer}">
											<p class="text-right">
												<object>
													<c:if test="${dodoitsu.strGood == 'noGood'}">
														まだ<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4&top=top">高評価</a>されていません
													</c:if>
													<c:if test="${dodoitsu.strGood != 'noGood'}">
														${dodoitsu.strGood}人から<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4&top=top">高評価</a>されました
													</c:if>
												</object>
											</p>
										</c:if>
										<c:if test="${name == dodoitsu.composer}">
											<c:if test="${dodoitsu.strGood == 'noGood'}">
												<p class="text-right">まだ高評価されていません</p>
											</c:if>
											<c:if test="${dodoitsu.strGood != 'noGood'}">
												<p class="text-right">${dodoitsu.strGood}人から高評価されました</p>
											</c:if>
										</c:if>
									</div>
									<div class="col-1"></div>
								</c:forEach>
							</a>
						</div>
					</div>
					<div class="bg-secondary py-3 haikusGenre"></div>
					<!-- ここまで最新の歌一覧 -->
					<div id="goodHaikus" class="py-4"></div>
					<!-- ここから高評価の歌一覧 -->
					<div class="bg-secondary py-2 haikusGenre"><h3 class="whiteWord">評価の高い歌</h3></div>
					<div class="bg-success py-2 haikusGenre"><h3 class="whiteWord">俳句・川柳</h3></div>
					<div class="row">
						<c:forEach items="${goodHaiku}" var="haiku">
							<div class="col-md-4 col-xs-12 py-4 goodHaiku shadow list zoom">
								<div class="row">
									<a class="linkMenuHaiku blackHover" href="List?genre=1">
										<div class="col-2"></div>
										<div class="col-1 text-left py-3">${haiku.strComposeDate} ${haiku.strComposeTime}</div>
										<div class="col-2 text-left py-3 font-weight-bold">${haiku.haiku}</div>
										<div class="col-1 text-right">
											<object><a class="linkName" href="UserDetail?name=${haiku.composer}">${haiku.composer}</a></object>
										</div>
										<div class="col-3 mobileHidden">${haiku.comment}</div>
										<div class="col-2">
											<c:if test="${name != haiku.composer}">
												<p class="text-right">
													<object>
														<c:if test="${haiku.strGood == 'noGood'}">
															まだ<a class="linkGood" href="Good?id=${haiku.id}&genre=1&top=top">高評価</a>されていません
														</c:if>
														<c:if test="${haiku.strGood != 'noGood'}">
															${haiku.strGood}人から<a class="linkGood" href="Good?id=${haiku.id}&genre=1&top=top">高評価</a>されました
														</c:if>
													</object>
												</p>
											</c:if>
											<c:if test="${name == haiku.composer}">
												<c:if test="${haiku.strGood == 'noGood'}">
													<p class="text-right">まだ高評価されていません</p>
												</c:if>
												<c:if test="${haiku.strGood != 'noGood'}">
													<p class="text-right">${haiku.strGood}人から高評価されました</p>
												</c:if>
											</c:if>
										</div>
										<div class="col-1"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="bg-success py-3 haikusGenre"></div>
					<div class="bg-info py-2 haikusGenre"><h3>短歌</h3></div>
					<div class="row">
						<c:forEach items="${goodTanka}" var="tanka">
							<div class="col-md-4 col-xs-12 py-4 goodTanka shadow list zoom">
								<div class="row">
									<a class="linkMenuTanka blackHover" href="List?genre=2">
										<div class="col-2"></div>
										<div class="col-1 text-left py-3">${tanka.strComposeDate} ${tanka.strComposeTime}</div>
										<div class="col-2 text-left py-3 font-weight-bold">${tanka.haiku}</div>
										<div class="col-1 text-right">
											<object><a class="linkName" href="UserDetail?name=${tanka.composer}">${tanka.composer}</a></object>
										</div>
										<div class="col-3 mobileHidden">${tanka.comment}</div>
										<div class="col-2">
											<c:if test="${name != tanka.composer}">
												<p class="text-right">
													<object>
														<c:if test="${tanka.strGood == 'noGood'}">
															まだ<a class="linkGood" href="Good?id=${tanka.id}&genre=2&top=top">高評価</a>されていません
														</c:if>
														<c:if test="${tanka.strGood != 'noGood'}">
															${tanka.strGood}人から<a class="linkGood" href="Good?id=${tanka.id}&genre=2&top=top">高評価</a>されました
														</c:if>
													</object>
												</p>
											</c:if>
											<c:if test="${name == tanka.composer}">
												<c:if test="${tanka.strGood == 'noGood'}">
													<p class="text-right">まだ高評価されていません</p>
												</c:if>
												<c:if test="${tanka.strGood != 'noGood'}">
													<p class="text-right">${tanka.strGood}人から高評価されました</p>
												</c:if>
											</c:if>
										</div>
										<div class="col-1"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="bg-info py-3 haikusGenre"></div>
					<div class="bg-warning py-2 haikusGenre"><h3>旋頭歌</h3></div>
					<div class="row">
						<c:forEach items="${goodSedoka}" var="sedoka">
							<div class="col-md-4 col-xs-12 py-4 goodSedoka shadow list zoom">
								<div class="row">
									<a class="linkMenuSedoka blackHover" href="List?genre=3">
										<div class="col-2"></div>
										<div class="col-1 text-left py-3">${sedoka.strComposeDate} ${sedoka.strComposeTime}</div>
										<div class="col-2 text-left py-3 font-weight-bold">${sedoka.haiku}</div>
										<div class="col-1 text-right">
											<object><a class="linkName" href="UserDetail?name=${sedoka.composer}">${sedoka.composer}</a></object>
										</div>
										<div class="col-3 mobileHidden">${sedoka.comment}</div>
										<div class="col-2">
											<c:if test="${name != sedoka.composer}">
												<p class="text-right">
													<object>
														<c:if test="${sedoka.strGood == 'noGood'}">
															まだ<a class="linkGood" href="Good?id=${sedoka.id}&genre=3&top=top">高評価</a>されていません
														</c:if>
														<c:if test="${sedoka.strGood != 'noGood'}">
															${sedoka.strGood}人から<a class="linkGood" href="Good?id=${sedoka.id}&genre=3&top=top">高評価</a>されました
														</c:if>
													</object>
												</p>
											</c:if>
											<c:if test="${name == sedoka.composer}">
												<c:if test="${sedoka.strGood == 'noGood'}">
													<p class="text-right">まだ高評価されていません</p>
												</c:if>
												<c:if test="${sedoka.strGood != 'noGood'}">
													<p class="text-right">${sedoka.strGood}人から高評価されました</p>
												</c:if>
											</c:if>
										</div>
										<div class="col-1"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="bg-warning py-3 haikusGenre"></div>
					<div class="bg-danger py-2 haikusGenre"><h3 class="whiteWord">都々逸</h3></div>
					<div class="row">
						<c:forEach items="${goodDodoitsu}" var="dodoitsu">
							<div class="col-md-4 col-xs-12 py-4 goodDodoitsu shadow list zoom">
								<div class="row">
									<a class="linkMenuDodoitsu blackHover" href="List?genre=4">
										<div class="col-2"></div>
										<div class="col-1 text-left py-3">${dodoitsu.strComposeDate} ${dodoitsu.strComposeTime}</div>
										<div class="col-2 text-left py-3 font-weight-bold">${dodoitsu.haiku}</div>
										<div class="col-1 text-right">
											<object><a class="linkName" href="UserDetail?name=${dodoitsu.composer}">${dodoitsu.composer}</a></object>
										</div>
										<div class="col-3 mobileHidden">${dodoitsu.comment}</div>
										<div class="col-2">
											<c:if test="${name != dodoitsu.composer}">
												<p class="text-right">
													<object>
														<c:if test="${dodoitsu.strGood == 'noGood'}">
															まだ<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4&top=top">高評価</a>されていません
														</c:if>
														<c:if test="${dodoitsu.strGood != 'noGood'}">
															${dodoitsu.strGood}人から<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4&top=top">高評価</a>されました
														</c:if>
													</object>
												</p>
											</c:if>
											<c:if test="${name == dodoitsu.composer}">
												<c:if test="${dodoitsu.strGood == 'noGood'}">
													<p class="text-right">まだ高評価されていません</p>
												</c:if>
												<c:if test="${dodoitsu.strGood != 'noGood'}">
													<p class="text-right">${dodoitsu.strGood}人から高評価されました</p>
												</c:if>
											</c:if>
										</div>
										<div class="col-1"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="bg-danger py-3 haikusGenre"></div>
					<div class="bg-secondary py-3 haikusGenre"></div>
				</div>
				<div class="col-1"></div>
			</div>
			<!-- ここまで高評価の歌一覧 -->
			
			<p class="mt-5"><a href="Compose"><input class="btn btn-success btn-lg shadow" type="button" value="新たに詠む"></a></p>
			<div id="description" class="my-2"></div>
			<br>
			<br>
			<div class="row">
				<div class="col-md-2 col-xs-1"></div>
				<div class="col-md-8 col-xs-10">
					<ul class="nav nav-tabs">
						<li class="nav-item w-25 itemHaiku">
							<a href="#haiku" class="nav-link active navHaiku" data-toggle="tab">
								俳<span class="mobileHidden">句</span>・川<span class="mobileHidden">柳とは？</span>
							</a>
						</li>
						<li class="nav-item w-25 itemTanka">
							<a href="#tanka" class="nav-link navTanka" data-toggle="tab">
								短歌<span class="mobileHidden">とは？</span>
							</a>
						</li>
						<li class="nav-item w-25 itemSedoka">
							<a href="#sedoka" class="nav-link navSedoka" data-toggle="tab">
								旋頭歌<span class="mobileHidden">とは？</span>
							</a>
						</li>
						<li class="nav-item w-25 itemDodoitsu">
							<a href="#dodoitsu" class="nav-link navDodoitsu" data-toggle="tab">
								都々逸<span class="mobileHidden">とは？</span>
							</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="haiku" class="tab-pane py-4 active haikuTab"><jsp:include page="../include/description/haiku.jsp" flush="true" /></div>
						<div id="tanka" class="tab-pane py-4 tankaTab"><jsp:include page="../include/description/tanka.jsp" flush="true" /></div>
						<div id="sedoka" class="tab-pane py-4 sedokaTab"><jsp:include page="../include/description/sedoka.jsp" flush="true" /></div>
						<div id="dodoitsu" class="tab-pane py-4 dodoitsuTab"><jsp:include page="../include/description/dodoitsu.jsp" flush="true" /></div>
					</div>
				</div>
				<div class="col-md-2 col-xs-1"></div>
			</div>
			<p class="my-5"><a href="UserDetail?name=${name}"><input class="btn btn-primary shadow" type="button" value="あなたの詳細"></a></p>
			<c:if test="${name == 'admin'}">
				<p class="py-5"><a href="UserList"><input class="btn btn-danger shadow" type="button" value="会員一覧"></a></p>
			</c:if>
			<p class="my-5"><a href="Login"><input class="btn btn-warning shadow" type="button" value="退室"></a></p>
		</div>
		<jsp:include page="../include/display/footer.jsp" flush="true" />
	</div>
</body>
</html>