<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="연습중." />
        <meta name="author" content="강남" />
        <title>공지사항</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
<!--         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript">
       
         $(function(){
           $(".write").click(function(){
              //alert("글쓰기를 클릭했습니다");
              $("#writeModal").modal("show");
              $("#title").val("");//초기화
              $("#content").val("");
           });
           
          $("#writeAction").click(function(){
                let title = $("#title").val();
                let content = $("#content").val();
                //alert(title + " : " + content);
                if(title.length < 1){
                   alert("제목은 한글자 이상으로 적어주세요.");
                   $("#title").focus();
                   return false;
                }
                else if(title == ""){
                	 alert("제목을 입력해주세요.");
                     $("#title").focus();
                     return false;
                }
                else if(content == ""){
                   alert("내용을 입력해주세요.");
                   $("#content").focus();
                   return false;
                }
              $.post({url : "/write.do",
                    data : {"title" : title, "content": content},
                    dataType : "json"
                 }).done(function(data){
                    //alert(data.result);//{result : 1}
                    if(data.result == 1){
                       alert("저장했습니다.");
                       location.href="/notice.do";
                    }else{
                       alert("저장하지 못했습니다.");
                    }
                 }).fail(function(xhr){
                    alert("통신에 문제가 발생하였습니다.");
                 });
           });
           
           //디테일보기
           $(".detail").click(function(){
              let no = $(this).attr("value"); 
              //alert(no + " : 제목을 클릭했습니다.");
              $.post({
                 url : "/noticeDetailAjax.do",
                 cache : false,
                 data : {"no" : no},
                 dataType: "json"
              }).done(function(data){
            	  let result = data.result;
            	 // alert(result.n_title);
            	 $("#viewModalLabel").text(result.n_title);
            	 $("#n_mname").text(result.member_name);
            	 $("#n_date").text(result.n_date);
            	 $("#n_content").text("");
            	 $("#n_content").append(result.n_content);
	            	 $("#n_content").append(result.auth);
            	 if(result.auth == 1) { //아이디와 글쓴이가 일치할 경우
            		 $(".detailDelete").show();
            		 $(".detailUpdate").show();
            		 $(".detailDelete").val(result.n_no);
            		 $(".detailUpdate").val(result.n_no);
            	 } else { //내 아이디가 아닌경우, 수정/삭제 버튼 안뜨도록 하는 2가지 방법
            		 $(".detailDelete").hide();
            		 $(".detailUpdate").hide();
//             		 $(".detailUpdate").remove();
            	 }
            	 
            	 
            	 $("#detailModal").modal("show");
              }).fail(function(xhr, status, errorThrown){
                 alert("문제가 발생했습니다");
              });
           });
           
           //detailDelete 삭제하기
           $(".detailDelete").click(function(){
        	   //no 생성
        	   let no = $(".detailDelete").val(); 
        	   if(confirm("삭제하시겠습니까?")){
        		   //url 이동
        		   location.href="noticeDel.do?no="+no;
        	   }
           });
           
           //detailUpdate 수정하기
            $(".detailUpdate").click(function(){
            	let no = $(this).attr("value");
            	 var title = $("#viewModalLabel").text();
            	 var content = $("#n_content").text();
            	// alert("수정"+title + content);
            	 
            	$("#detailModal").modal("hide");
            	//값 붙이기 작업
            	$("#update_title").val(title);
            	$(".update_no").val(no);
            	$("#summernote2").val(content);
            	$("#summernote2").css("height","300");
            	
            	$("#updateModal").modal("show");
            });
           
           //updateForm "글수정" 버튼 누르면 백으로 전송시키고, 프론트변경 -> 다시 변경된 값 띄워져 있는 detailModal로 가게 하기
           $(".updateForm").click(function(){
        	 //alert("수정누름");
        	  let no = $(".update_no").val();
        	  let title = $("#update_title").val();
        	  let content = $("#summernote2").val();
        	  //alert(no + ":" +title+ ":"+content)
        	  
        	  //백으로 보내서 수정하게 하기
        	  $.post({
        		 url : "/noticeUpdate.do",
        	  	 data : {"no" : no, "title" : title, "content" : content},
        	  	 dataType : "json"
        	  }).done(function(data){
        		  //alert("정상소통");
        		  if(data.result == 1){
					alert("수정이 완료되었습니다.");  
					 $("#updateModal").modal("hide");
		               //디테일 모달에 값 붙이기
		               $("#viewModalLabel").text(title);
		               $("#n_content").text(""); //내용에<p></p>가 포함되어서 나옴
		               $("#n_content").append(content);
		               //디테일 모달 보이기.
		               $("#detailModal").modal("show");
        		  } else{
        			  alert("문제가 발생했습니다.\n다시 시도해 주세요");
        		  }
        	  }).fail(function(){
        		  alert("실패");
        		  
        	  });
        	  //수정해서 Modal 숨기기
           });
           
           
        });
        </script>
    </head>
    <body>
        <%@ include file="menu2.jsp" %>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
            	<h1>공지사항</h1>
            	<table class="table table-striped">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>날짜</th>
						<th>회원번호</th>
					</tr>
					<c:forEach items="${list }" var="l">
					<tr>
						<td>${l.nno }</td>
						<td class="detail" value="${l.n_no }">${l.n_title }</td>
						<td>${l.n_date }</td>
						<td>${l.member_name }</td>
					</tr>
					</c:forEach>
				</table>
				
<!-- 				 	<div style="text-align:center; width:100%; height:30px; font-size:large; color:red;"> -->
<!-- 						페이징이 들어갈 div //위에서 pagination쓰겠다고 선언! "http://egovframework.gov/ctl/ui" 를 맨위에 추가  -->
<%-- 						<ui:pagination paginationInfo = "${paginationInfo}" type="image"  jsFunction="linkPage"/> --%>
<!-- 					</div> -->
	
				<c:if test="${sessionScope.id ne null }">
					<button class="btn btn-primary write" id="write" >글쓰기</button>
				</c:if>
            </div>
            
            
            <!-- 수정 Modal -->
			<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">공지사항 글수정</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
<!-- 			        <form action="/noticeUpdate.do" method="post"> -->
			      <div class="modal-body">
			           <input class="form-control" type="text" id="update_title" name="title" style="margin-bottom: 10px" required="required">
			           <input type="hidden" class="update_no" name="no" required="required">
			           <textarea class="form-control" id="summernote2" name="content" required="required">문제가 발생했습니다</textarea>
			      </div>
			      <div class="modal-footer">        
			        <button type="submit" class="btn btn-primary updateForm">글수정</button>
			        <button type="button" class="btn btn-secondary updateClose" data-bs-dismiss="modal">닫기</button>
			      </div>
<!-- 			        </form> -->
			    </div>
			  </div>
			</div>
            
            <!-- 상세보기 Modal -->
			<div class="modal fade" id="detailModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="viewModalLabel">데이터가 없습니다.</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <div class="row" style="height: 30px; padding-bottom:40px; border-bottom: 1px #dee2e6 solid;">
			           <div class="col">
			              <div id="n_mname">데이터가 없습니다.</div>
			           </div>
			           <div class="col">
			              <button type="button" class="btn btn-primary btn-sm detailUpdate" style="float:right; ">수정</button>
			              <button type="button" class="btn btn-danger btn-sm detailDelete" style="float:right; margin-right:5px;">삭제</button>
			           </div>
			           <div class="col">
			              <div id="n_date">데이터가 없습니다.</div>
			           </div>
			        </div>
			        <div class="row" style="padding-top:10px; min-height: 500px; overflow-y: auto;">
			           <div class="col" id="n_content"><h1>문제가 발생했습니다. 다시 시도하세요.</h1></div>
			        </div>
			      </div>
			      <div class="modal-footer">        
			        <button type="button" class="btn btn-secondary updateClose" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>


            <!-- 글쓰기 Modal -->
			<div class="modal fade" id="writeModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <!-- data-bs-backdrop="static" :바깥창 누르면 창이 꺼짐 -->
			  <div class="modal-dialog modal-lg modal-dialog-centered">
			  <!-- modal-lg: 큰모달, modal-dialog-centered:중앙에 위치 -->
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">공지사항 글쓰기</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
<!-- 			      	 <form action="/write.do" method="post" > -->


			         <div id="form">
			            <div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label">제목</label>
						  <input type="text" class="form-control" id="title" name="title" >
						</div>
			           
						<div class="mb-3">
						  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
						  <textarea class="form-control" id="content" name="content" rows="3"></textarea>
						</div>
<!-- 			           <button type="submit" class="btn btn-primary" >글쓰기</button> -->
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				        <button type="submit" class="btn btn-primary" id="writeAction">저장하기</button>
				    </div>
<!-- 				        </form> -->


			      </div>
			    </div>
			  </div>
			</div>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
    </body>
</html>
