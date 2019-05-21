<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp" flush="true" />
	<title>検索用入力欄</title>
</head>
<body>
	<div class="row">
		<div class="col-1"></div>
		<div class="col-10">
			<div class="row py-3">
				<div class="col-md-3 col-xs-1"></div>
				<div class="col-md-2 col-xs-12 font-weight-bold text-left border-bottom border-dark">作者の俳号で検索</div>
				<div class="col-md-4 col-xs-12 text-right border-bottom border-dark">
					<input type="text" name="name" size="20" placeholder="調べたい俳号">
				</div>
				<div class="col-md-3 col-xs-1"></div>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
	<p><input class="btn btn-success btn-lg shadow" type="submit" value="探す"></p>
</body>
</html>
