<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<link rel="stylesheet" type="text/css" href="css/origin/userList.css">
	<title>会員一覧</title>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<jsp:include page="../include/title.jsp" flush="true" />
			<h2>会員一覧</h2>
			<jsp:include page="../include/msg.jsp" flush="true" />
			<form action="UserList" method="POST">
				<jsp:include page="../include/searchForm.jsp" flush="true" />
			</form>
			<form action="UserList?userOrder" method="POST">
				<div class="row py-4">
					<div class="col-md-5 col-xs-1"></div>
					<div class="col-md-2 col-xs-10">
						<select class="form-control" name="order">
							<option value="old">古い順</option>
							<option value="new">新しい順</option>
						</select>
						<p><input class="btn btn-primary shadow mt-2" type="submit" value="並び替え"></p>
					</div>
					<div class="col-md-5 col-xs-1"></div>
				</div>
			</form>
			<div class="bg-secondary py-1">
				<h4 class="font-weight-normal whiteWord">会員の一覧(${order})</h4>
			</div>
			<c:forEach items="${userList}" var="list">
				<div class="my-4">
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">俳号</div>
								<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">${list.name}</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">入会日時</div>
								<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">
									<f:formatDate value="${list.createDate}" pattern="yyyy年M月d日" /> 
									<f:formatDate value="${list.createTime}" pattern="k時m分s秒" />
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">更新日時</div>
								<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">
									<f:formatDate value="${list.updateDate}" pattern="yyyy年M月d日" /> 
									<f:formatDate value="${list.updateTime}" pattern="k時m分s秒" />
								</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-1 col-xs-12 font-weight-bold text-left border-bottom border-dark">ひとこと</div>
								<div class="col-md-5 col-xs-12 text-right border-bottom border-dark">${list.greet}</div>
								<div class="col-md-3 col-xs-1"></div>
							</div>
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<c:if test="${list.id != 1}">
									<div class="col-md-6 col-xs-10">
										<a href="UserBAN?id=${list.id}"><input class="btn btn-danger shadow" type="button" value="この会員を退会させる"></a>
									</div>
								</c:if>
								<c:if test="${list.id == 1}"><div class="col-md-6 col-xs-10"></div></c:if>
								<div class="col-md-3 col-xs-1"></div>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</c:forEach>
			<p class="mt-5"><a href="Top"><input class="btn btn-info shadow" type="button" value="戻る"></a></p>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>
