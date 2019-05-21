<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/origin/userDetail.css">
	<jsp:include page="../include/head.jsp" flush="true" />
	<c:if test="${composerName == null}">
		<title>${name}様の詳細</title>
	</c:if>
	<c:if test="${composerName != null}">
		<title>${composerName}様の詳細</title>
	</c:if>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<div><jsp:include page="../include/title.jsp" flush="true" /></div>
			<jsp:include page="../include/msg.jsp" flush="true" />
			<c:if test="${loginOk == null}">
				<c:if test="${composerName == null}">
					<h2 class="py-4">${name}様の詳細</h2>
				</c:if>
				<c:if test="${composerName != null}">
					<h2 class="py-4">${composerName}様の詳細</h2>
				</c:if>
				<c:forEach items="${userList}" var="user">
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">俳号</div>
								<c:if test="${composerName == null}">
									<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">${name}</div>
								</c:if>
								<c:if test="${composerName != null}">
									<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">${composerName}</div>
								</c:if>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">入会日時</div>
								<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">
									<f:formatDate value="${user.createDate}" pattern="yyyy年M月d日" /> 
									<f:formatDate value="${user.createTime}" pattern="k時m分s秒" />
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">更新日時</div>
								<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">
									<f:formatDate value="${user.updateDate}" pattern="yyyy年M月d日" /> 
									<f:formatDate value="${user.updateTime}" pattern="k時m分s秒" />
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<br>
							<form action="UserDetail?loginOk&name=${name}&greetChange" method="POST">
								<div class="row">
									<div class="col-lg-3 col-xs-1"></div>
									<div class="col-lg-1 col-xs-5 font-weight-bold text-left border-bottom border-dark">ひとこと</div>
									<c:if test="${composerName == null}">
										<div class="col-lg-1 col-xs-5 border-bottom border-dark greetBtn">
											<input class="btn btn-success btn-sm shadow" type="submit" value="書き込む">
										</div>
										<div class="col-lg-4 col-xs-12 text-right border-bottom border-dark">
											<input class="text-right" type="text" name="greet" size="35" value="${user.greet}" placeholder="ご自由にひとことどうぞ">
										</div>
									</c:if>
									<c:if test="${composerName != null}">
										<div class="col-lg-5 col-xs-12 text-right border-bottom border-dark">${user.greet}</div>
									</c:if>
									<div class="col-lg-3 col-xs-1"></div>
								</div>
							</form>
							<br>
						</div>
						<div class="col-1"></div>
					</div>
				</c:forEach>
				<div class="h4 mt-4">これまで詠まれた歌(クリックで開閉)</div>
				<div class="row">
					<div class="col-1"></div>
					<div class="col-10">
						<details>
							<summary class="noIcon">
								<div class="bg-secondary py-1 zoom haikusGenre userHaikus"><h3 class="whiteWord">俳句・川柳</h3></div>
							</summary>
							<div class="row">
								<c:forEach items="${haikuList}" var="haiku" varStatus="listNum">
									<c:if test="${listNum.count % 2 == 0}">
										<div class="col-md-4 col-xs-12 bg-light shadow list">
											<div class="row lists">
												<div class="col-1"></div>
												<div class="col-1">
													<c:if test="${name == 'admin'}">
														<a href="HaikuDelete?id=${haiku.id}&genre=1">
															<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
														</a>
													</c:if>
												</div>
												<div class="col-1 text-left py-3">${haiku.strComposeDate} ${haiku.strComposeTime}</div>
												<div class="col-4">
													<p class="text-left py-3 font-weight-bold">${haiku.haiku}</p>
													<p class="text-right">${haiku.composer}</p>
												</div>
												<div class="col-2">${haiku.comment}</div>
												<div class="col-2">
													<c:if test="${name != haiku.composer}">
														<p class="text-right">
															<object>
																<c:if test="${haiku.strGood == 'noGood'}">
																	まだ<a class="linkGood" href="Good?id=${haiku.id}&genre=1">高評価</a>されていません
																</c:if>
																<c:if test="${haiku.strGood != 'noGood'}">
																	${haiku.strGood}人から<a class="linkGood" href="Good?id=${haiku.id}&genre=1">高評価</a>されました
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
											</div>
										</div>
									</c:if>
									<c:if test="${listNum.count % 2 != 0}">
										<div class="col-md-4 col-xs-12 bg-success shadow list">
											<div class="row lists">
												<div class="col-1"></div>
												<div class="col-1">
													<c:if test="${name == 'admin'}">
														<a href="HaikuDelete?id=${haiku.id}&genre=1">
															<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
														</a>
													</c:if>
												</div>
												<div class="col-1 text-left py-3 whiteWord">${haiku.strComposeDate} ${haiku.strComposeTime}</div>
												<div class="col-4">
													<p class="text-left py-3 font-weight-bold whiteWord">${haiku.haiku}</p>
													<p class="text-right whiteWord">${haiku.composer}</p>
												</div>
												<div class="col-2 whiteWord">${haiku.comment}</div>
												<div class="col-2">
													<c:if test="${name != haiku.composer}">
														<p class="text-right whiteWord">
															<object>
																<c:if test="${haiku.strGood == 'noGood'}">
																	まだ<a class="linkGood" href="Good?id=${haiku.id}&genre=1">高評価</a>されていません
																</c:if>
																<c:if test="${haiku.strGood != 'noGood'}">
																	${haiku.strGood}人から<a class="linkGood" href="Good?id=${haiku.id}&genre=1">高評価</a>されました
																</c:if>
															</object>
														</p>
													</c:if>
													<c:if test="${name == haiku.composer}">
														<c:if test="${haiku.strGood == 'noGood'}">
															<p class="text-right whiteWord">まだ高評価されていません</p>
														</c:if>
														<c:if test="${haiku.strGood != 'noGood'}">
															<p class="text-right whiteWord">${haiku.strGood}人から高評価されました</p>
														</c:if>
													</c:if>
												</div>
												<div class="col-1"></div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</details>
						<details>
							<summary class="noIcon">
								<div class="bg-secondary py-1 zoom haikusGenre userTankas"><h3 class="whiteWord">短歌</h3></div>
							</summary>
							<div class="row">
								<c:forEach items="${tankaList}" var="tanka" varStatus="listNum">
									<c:if test="${listNum.count % 2 == 0}">
										<div class="col-md-4 col-xs-12 bg-light shadow list">
											<div class="row lists">
												<div class="col-1"></div>
												<div class="col-1">
													<c:if test="${name == 'admin'}">
														<a href="HaikuDelete?id=${tanka.id}&genre=2">
															<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
														</a>
													</c:if>
												</div>
												<div class="col-1 text-left py-3">${tanka.strComposeDate} ${tanka.strComposeTime}</div>
												<div class="col-4">
													<p class="text-left py-3 font-weight-bold">${tanka.haiku}</p>
													<p class="text-right">${tanka.composer}</p>
												</div>
												<div class="col-2">${tanka.comment}</div>
												<div class="col-2">
													<c:if test="${name != tanka.composer}">
														<p class="text-right">
															<object>
																<c:if test="${tanka.strGood == 'noGood'}">
																	まだ<a class="linkGood" href="Good?id=${tanka.id}&genre=2">高評価</a>されていません
																</c:if>
																<c:if test="${tanka.strGood != 'noGood'}">
																	${tanka.strGood}人から<a class="linkGood" href="Good?id=${tanka.id}&genre=2">高評価</a>されました
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
											</div>
										</div>
									</c:if>
									<c:if test="${listNum.count % 2 != 0}">
										<div class="col-md-4 col-xs-12 bg-info shadow list">
											<div class="row lists">
												<div class="col-1"></div>
												<div class="col-1">
													<c:if test="${name == 'admin'}">
														<a href="HaikuDelete?id=${tanka.id}&genre=2">
															<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
														</a>
													</c:if>
												</div>
												<div class="col-1 text-left py-3">${tanka.strComposeDate} ${tanka.strComposeTime}</div>
												<div class="col-4">
													<p class="text-left py-3 font-weight-bold">${tanka.haiku}</p>
													<p class="text-right">${tanka.composer}</p>
												</div>
												<div class="col-2">${tanka.comment}</div>
												<div class="col-2">
													<c:if test="${name != tanka.composer}">
														<p class="text-right">
															<object>
																<c:if test="${tanka.strGood == 'noGood'}">
																	まだ<a class="linkGood" href="Good?id=${tanka.id}&genre=2">高評価</a>されていません
																</c:if>
																<c:if test="${tanka.strGood != 'noGood'}">
																	${tanka.strGood}人から<a class="linkGood" href="Good?id=${tanka.id}&genre=2">高評価</a>されました
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
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</details>
						<details>
							<summary class="noIcon">
								<div class="bg-secondary py-1 zoom haikusGenre userChokas"><h3 class="whiteWord">長歌</h3></div>
							</summary>
							<div class="row">
								<c:forEach items="${chokaList}" var="choka" varStatus="listNum">
									<c:if test="${listNum.count % 2 == 0}">
										<div class="col-md-4 col-xs-12 bg-light shadow list">
											<div class="row lists">
												<div class="col-1">
													<c:if test="${name == 'admin'}">
														<a href="HaikuDelete?id=${choka.id}&genre=3">
															<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
														</a>
													</c:if>
												</div>
												<div class="col-1 text-left py-3">${choka.strComposeDate} ${choka.strComposeTime}</div>
												<div class="col-5">
													<p class="text-left py-3 font-weight-bold">${choka.haiku}</p>
													<p class="text-right">${choka.composer}</p>
												</div>
												<div class="col-2">${choka.comment}</div>
												<div class="col-2">
													<c:if test="${name != choka.composer}">
														<p class="text-right">
															<object>
																<c:if test="${choka.strGood == 'noGood'}">
																	まだ<a class="linkGood" href="Good?id=${choka.id}&genre=3">高評価</a>されていません
																</c:if>
																<c:if test="${choka.strGood != 'noGood'}">
																	${choka.strGood}人から<a class="linkGood" href="Good?id=${choka.id}&genre=3">高評価</a>されました
																</c:if>
															</object>
														</p>
													</c:if>
													<c:if test="${name == choka.composer}">
														<c:if test="${choka.strGood == 'noGood'}">
															<p class="text-right">まだ高評価されていません</p>
														</c:if>
														<c:if test="${choka.strGood != 'noGood'}">
															<p class="text-right">${choka.strGood}人から高評価されました</p>
														</c:if>
													</c:if>
												</div>
												<div class="col-1"></div>
											</div>
										</div>
									</c:if>
									<c:if test="${listNum.count % 2 != 0}">
										<div class="col-md-4 col-xs-12 bg-warning shadow list">
											<div class="row lists">
												<div class="col-1">
													<c:if test="${name == 'admin'}">
														<a href="HaikuDelete?id=${choka.id}&genre=3">
															<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
														</a>
													</c:if>
												</div>
												<div class="col-1 text-left py-3">${choka.strComposeDate} ${choka.strComposeTime}</div>
												<div class="col-5">
													<p class="text-left py-3 font-weight-bold">${choka.haiku}</p>
													<p class="text-right">${choka.composer}</p>
												</div>
												<div class="col-2">${choka.comment}</div>
												<div class="col-2">
													<c:if test="${name != choka.composer}">
														<p class="text-right">
															<object>
																<c:if test="${choka.strGood == 'noGood'}">
																	まだ<a class="linkGood" href="Good?id=${choka.id}&genre=3">高評価</a>されていません
																</c:if>
																<c:if test="${choka.strGood != 'noGood'}">
																	${choka.strGood}人から<a class="linkGood" href="Good?id=${choka.id}&genre=3">高評価</a>されました
																</c:if>
															</object>
														</p>
													</c:if>
													<c:if test="${name == choka.composer}">
														<c:if test="${choka.strGood == 'noGood'}">
															<p class="text-right">まだ高評価されていません</p>
														</c:if>
														<c:if test="${choka.strGood != 'noGood'}">
															<p class="text-right">${choka.strGood}人から高評価されました</p>
														</c:if>
													</c:if>
												</div>
												<div class="col-1"></div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</details>
						<details>
							<summary class="noIcon">
								<div class="bg-secondary py-1 zoom haikusGenre userDodoitsus"><h3 class="whiteWord">都々逸</h3></div>
							</summary>
							<div class="row">
								<c:forEach items="${dodoitsuList}" var="dodoitsu" varStatus="listNum">
									<c:if test="${listNum.count % 2 == 0}">
										<div class="col-md-4 col-xs-12 bg-light shadow list">
											<div class="row lists">
												<div class="col-1"></div>
												<div class="col-1">
													<c:if test="${name == 'admin'}">
														<a href="HaikuDelete?id=${dodoitsu.id}&genre=4">
															<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
														</a>
													</c:if>
												</div>
												<div class="col-1 text-left py-3">${dodoitsu.strComposeDate} ${dodoitsu.strComposeTime}</div>
												<div class="col-4">
													<p class="text-left py-3 font-weight-bold">${dodoitsu.haiku}</p>
													<p class="text-right">${dodoitsu.composer}</p>
												</div>
												<div class="col-2">${dodoitsu.comment}</div>
												<div class="col-2">
													<c:if test="${name != dodoitsu.composer}">
														<p class="text-right">
															<object>
																<c:if test="${dodoitsu.strGood == 'noGood'}">
																	まだ<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4">高評価</a>されていません
																</c:if>
																<c:if test="${dodoitsu.strGood != 'noGood'}">
																	${dodoitsu.strGood}人から<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4">高評価</a>されました
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
											</div>
										</div>
									</c:if>
									<c:if test="${listNum.count % 2 != 0}">
										<div class="col-md-4 col-xs-12 bg-danger shadow list">
											<div class="col-1"></div>
												<div class="col-1">
													<c:if test="${name == 'admin'}">
														<a href="HaikuDelete?id=${dodoitsu.id}&genre=4">
															<input class="btn btn-warning shadow deleteHaiku" type="button" value="この歌を削除する">
														</a>
													</c:if>
												</div>
											<div class="col-1 text-left py-3 whiteWord">${dodoitsu.strComposeDate} ${dodoitsu.strComposeTime}</div>
											<div class="col-4">
												<p class="text-left py-3 font-weight-bold whiteWord">${dodoitsu.haiku}</p>
												<p class="text-right whiteWord">${dodoitsu.composer}</p>
											</div>
											<div class="col-2 whiteWord">${dodoitsu.comment}</div>
											<div class="col-2">
													<c:if test="${name != dodoitsu.composer}">
														<p class="text-right whiteWord">
															<object>
																<c:if test="${dodoitsu.strGood == 'noGood'}">
																	まだ<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4">高評価</a>されていません
																</c:if>
																<c:if test="${dodoitsu.strGood != 'noGood'}">
																	${dodoitsu.strGood}人から<a class="linkGood" href="Good?id=${dodoitsu.id}&genre=4">高評価</a>されました
																</c:if>
															</object>
														</p>
													</c:if>
													<c:if test="${name == dodoitsu.composer}">
														<c:if test="${dodoitsu.strGood == 'noGood'}">
															<p class="text-right whiteWord">まだ高評価されていません</p>
														</c:if>
														<c:if test="${dodoitsu.strGood != 'noGood'}">
															<p class="text-right whiteWord">${dodoitsu.strGood}人から高評価されました</p>
														</c:if>
													</c:if>
												</div>
												<div class="col-1"></div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<div class="bg-secondary py-2 haikusGenre"><h2></h2></div>
						</details>
					</div>
					<div class="col-1"></div>
				</div>
			</c:if>
			<c:if test="${myData != null}">
				<h3 class="mt-5">情報の更新</h3>
				<c:if test="${loginOk == null}">
					<p>情報変更</p>
					<form action="UserDetail" method="POST">
						<div class="row">
							<div class="col-1"></div>
							<div class="col-10">
								<div class="row py-2">
									<div class="col-md-3 col-xs-1"></div>
									<div class="col-md-2 col-xs-12 font-weight-bold text-left border-bottom border-dark">俳号</div>
									<div class="col-md-4 col-xs-12 text-right border-bottom border-dark">
										<input type="text" name="name" size="20" placeholder="俳号">
									</div>
									<div class="col-md-3 col-xs-1"></div>
								</div>
								<div class="row py-2">
									<div class="col-md-3 col-xs-1"></div>
									<div class="col-md-2 col-xs-12 font-weight-bold text-left border-bottom border-dark">合言葉(英数字のみ)</div>
									<div class="col-md-4 col-xs-12 text-right border-bottom border-dark">
										<input type="password" name="password" size="20" placeholder="合言葉">
									</div>
									<div class="col-md-3 col-xs-1"></div>
								</div>
							</div>
							<div class="col-1"></div>
						</div>
						<p class="my-4"><input class="btn btn-success btn-lg shadow" type="submit" value="認証"></p>
					</form>	
				</c:if>
				<c:if test="${loginOk != null}">
					<p>新しい情報をお教えください。</p>
					<form action="UserDetail?loginOk&id=${id}" method="POST">
						<jsp:include page="../include/createForm.jsp" flush="true" />
						<p class="my-4"><input class="btn btn-success btn-lg shadow" type="submit" value="変更"></p>
					</form>
				</c:if>
			</c:if>
			<p class="my-4"><a href="Top"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
			<c:if test="${myData != null}">
				<c:if test="${name != 'admin'}">
					<p class="mt-5"><a href="UserDelete"><input class="btn btn-danger shadow" type="button" value="退会"></a></p>
				</c:if>
			</c:if>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>
