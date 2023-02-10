<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>메인</title>
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
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="container mt-5">
	<h1>main</h1>
	<table class="table table-striped">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>글쓴이</th>
		</tr>
		<c:forEach items="${list }" var="l">
			<tr>
				<td>${l.b_no }</td>
				<td><a href="/detail.do?b_no=${l.b_no }">${l.b_title }</a></td>
				<td>${l.b_date }</td>
				<td>${l.b_read }</td>
				<td>${l.member_no }</td>
			</tr>
		</c:forEach>
	</table>
	 <!-- 페이징 -->
      <div id="pagingDiv">
         <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
      </div>
	</div>
<c:import url="footer.jsp"/>
      
</body>
</html>