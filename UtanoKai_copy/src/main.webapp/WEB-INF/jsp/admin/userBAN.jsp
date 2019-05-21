<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>強制退会</title>
</head>
<body>
	<jsp:include page="../include/load.jsp" flush="true" />
	<div id="loaded" class="container">
		<jsp:include page="../include/header.jsp" flush="true" />
		<div class="main">
			<h1 class="space">強制退会</h1>
			<jsp:include page="../include/msg.jsp" flush="true" />
			<form action="UserBAN?id=${id}" method="POST">
				<c:forEach items="${banUser}" var="user">
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="row">
								<div class="col-md-3 col-xs-1"></div>
								<div class="col-md-3 col-xs-12 font-weight-bold text-left border-bottom border-dark">俳号</div>
								<div class="col-md-3 col-xs-12 text-right border-bottom border-dark">${user.name}</div>
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
						</div>
						<div class="col-1"></div>
					</div>
					<br>
				</c:forEach>
				<h3>この会員を<span class="h1 text-danger font-weight-bold">退会</span>させますがよろしいですか？</h3>
				<p class="py-5"><input class="btn btn-danger btn-sm shadow" type="submit" value="退会させる(戻せません！)"></p>
				<p><a href="UserList"><input class="btn btn-info shadow" type="button" value="会員一覧に戻る"></a></p>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>
</body>
</html>
