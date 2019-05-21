<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="head.jsp" flush="true" />
	<title>連絡</title>
</head>
<body>
	<c:if test="${msg != null}">
		<div class="alert alert-danger text-center rounded-0 alert-dismissible fade show">
			${msg}<button class="close" data-dismiss="alert">&times;</button>
		</div>
	</c:if>
</body>
</html>
