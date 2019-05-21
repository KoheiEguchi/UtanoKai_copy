<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>認証用入力欄</title>
</head>
<body>
	<div class="row">
		<div class="col-1"></div>
		<div class="col-10">
			<div class="row py-2">
				<div class="col-md-3 col-xs-1"></div>
				<div class="col-md-2 col-xs-12 font-weight-bold text-left border-bottom border-dark">俳号</div>
				<div class="col-md-4 col-xs-12 text-right border-bottom border-dark">
					<input type="text" name="name" size="20" placeholder="俳号" autofocus>
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
</body>
</html>