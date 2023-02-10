<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>IP List</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
#pagingDiv{
	width:100%;
	height:30px;
	text-align: center;
}
</style>
<script type="text/javascript">
function linkPage(pageNo){location.href="/main.do?pageNo="+pageNo;}
window.setTimeout('window.location.reload()',5000); //5초마다 자동 새로고침
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="container mt-5">
	<h1>IP list</h1>
	<table class="table table-striped">
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>IP</th>
			<th>기타</th>
		</tr>
		<c:forEach items="${log }" var="l">
			<tr>
				<td>${l.i_no }</td>
				<td>${l.i_title }</td>
				<td>${l.i_ip }</td>
				<td>${l.i_target }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
<c:import url="footer.jsp"/>
      
</body>
</html>