<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!--               Masthead
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold">Your Favorite Place for Free Bootstrap Themes</h1>
                        <hr class="divider" />
                    </div>
                </div>
            </div>
        </header> -->
         <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/index.do">Meokmeok</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive" >
                    <ul class="navbar-nav ms-auto my-2 my-lg-0" >
                        <li class="nav-item"><a class="nav-link" href="/about.do">먹먹이란</a></li>
                         <li class="nav-item"><a class="nav-link" href="/main.do">메인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/services.do">서비스</a></li>
                        <li class="nav-item"><a class="nav-link" href="/portfolio.do">제품</a></li>
                        <li class="nav-item"><a class="nav-link" href="/notice.do">공지사항</a></li>
                        <li class="nav-item"><a class="nav-link" href="/pre_register.do">사전신청하기</a></li>
                        <!-- Dropdown -->
                          <!-- 로그인 한/안한 경우 -->
                        <c:choose>
                           <c:when test="${sessionScope.id eq null }"> 
                             <li class="nav-item"><a class="nav-link" href="/login.do">로그인</a></li> 
                           </c:when>
                       		<c:otherwise> 
                           <li class="nav-item dropdown"> 
                               <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">개인정보</a>
                               <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                   <li><a class="dropdown-item" href="/myInfo.do">내정보보기</a></li>
                                   <li><a class="dropdown-item" href="/message.do">쪽지함</a></li>
                                   <li><hr class="dropdown-divider"/></li>
                                   <li><a class="dropdown-item" href="/logout.do">로그아웃</a></li>
                               </ul>
                           </li>                           
                           </c:otherwise>
                        </c:choose>
                        
                        
                    </ul>
                </div>
            </div>
        </nav>