<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>상세보기</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
	<!-- Bootstrap Icons-->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
		rel="stylesheet" />
	<!-- Google fonts-->
	<link
		href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
		rel="stylesheet" />
	<link
		href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
		rel="stylesheet" type="text/css" />
	<!-- SimpleLightbox plugin CSS-->
	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
		rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/resources/css/styles.css" rel="stylesheet" />
	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#comment").keyup(function(){
			//alert("!");
			let comment = $(this).val();
			if(comment.length == 0 || comment ==""){
				$("#commentBtn").text("댓글을 입력하세요");
			}else{
				$("#commentBtn").text("저장\n("+comment.length+"/200자)");
			}
			
			if(comment.length > 200){
				//타이핑 못하게 막기
				$(this).val($(this).val().substring(0,200));
				alert("200자 이하로 작성해주세요");
			}
		});
	});
	</script>
</head>
 <style type="text/css">
        
.main {
	width: 100%;
	/* padding: 5px; */
	margin-top: 20px;
	height: calc(100vh - 50px);
	/* background-color: blue; */
	box-sizing: border-box;
}

article {
	margin: 0 auto;
	width: 95%;
	/* padding: 5px; */
	height: auto;
}

.title {
	height: 50px;
	width: 100%;
	line-height: 50px;
	border-bottom: 2px solid gray;
	font-size: x-large;
}

.write {
	height: 30px;
	width: 100%;
}

.writer, .date {
	float: left;
	width: 50%;
	height: 100%;
	background-color: #FAFAFA;
}

.content {
	width: 100%;
	min-height: 300px;
	height: auto;
	border-bottom: 1px solid gray;
	margin-bottom: 5px;
}

</style>
<body id="page-top">
	<%@ include file="menu.jsp"%>
	<!-- Page content-->
        <div class="container">
            <div class="mt-5">
                <div>
					<div class="title">${detail.b_title }</div>
					<div class="write">
						<div class="writer">
							${detail.member_name }
							<c:if test="${detail.member_id eq sessionScope.id}">
								<img alt="del" src="/resources/img/delete.png"
									onclick="del(${detail.b_no})">
								<img alt="update" src="/resources/img/edit.png" id="update">
							</c:if>
						</div>
						<div class="date">${detail.b_date }</div>
					</div>
					<div class="content">${detail.b_content }</div>
				</div>
				<button type="button" class="btn btn-primary" 
				style="margin-bottom:50px; color:black; background-color:white; border:solid black 5px; border-radius:15px; font-weight:bold; float:right;" 
				onclick="location.href='/main.do'">게시판으로</button>
				<!-- 댓글쓰기 창 -->
			<form action="" method="">
				<div class="card mb-2">
				<div class="card-header bg-light">
				        <i class="fa fa-comment fa"></i>  댓글 작성하기
				</div>
				<div class="card-body">
					<ul class="list-group list-group-flush">
					    <li class="list-group-item">
<!-- 						<div class="form-inline mb-2"> -->
<!-- 							<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label> -->
<!-- 							<input type="text" class="form-control ml-2" placeholder="Enter yourId" id="replyId"> -->
<!-- 							<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label> -->
<!-- 							<input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword"> -->
<!-- 						</div> -->
						<textarea class="form-control" id="comment" rows="3"></textarea>
						<button type="button" id="commentBtn" class="btn btn-dark mt-3" onClick="javascript:addReply();">저장</button>
					    </li>
					</ul>
				</div>
				</div>
		 	</form>
				
				
				
				
				
				
				
			</div>
        </div>
	

        <!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2022 - Company Name</div></div>
        </footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>