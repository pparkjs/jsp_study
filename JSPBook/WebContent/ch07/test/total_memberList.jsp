<%@page import="totaltest.dao.MemberDAO"%>
<%@page import="totaltest.vo.MemberVO"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>대덕인재개발원 JSP</title>
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<%@ include file="/include/header.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@ include file="/include/nav.jsp" %>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">
		                            	Commons-FileUpload를 이용한 파일 업로드
		                            </h6>
                                </div>
									 <% 
									 	MemberVO mem = (MemberVO)request.getAttribute("mem");
										MemberDAO dao = MemberDAO.getInstance();
									 	List<MemberVO> list = dao.getMemberList(); // 회원 리스트 가져옴
					
									 %>
									  <c:set value="<%=list%>" var="list"/>
									 <c:set value="<%=mem.getMem_id() %>" var="memId"/>
                                <div class="card-body">
                                	
									<!-- 
										1. 로그인 성공 후, 넘어왔을때 'a001님! 환영합니다!' 메시지를 출력을 완성해주세요.	
										
										2. 회원목록에 저장되어 있는 회원 모두를 출력해주세요.
										
											________________________________________________________
											
												이미지   		|	회원정보			| 	버튼 
											________________________________________________________
											
															| 아이디 : a001		|
												이미지		| 비밀번호 : 1234		|	[상세정보]
															| 이름 : 박정수			|
															| 성별 : 남자			|
											________________________________________________________
											
											....
											
										3. 회원등록 버튼을 클릭 시, 회원 가입 페이지로 이동하여 회원 등록을 진행할 수 있도록 해주세요.
									 -->
									   <h3>${memId}님! 환영합니다!</h3>
									   	<table border="1">
									   		<tr>
									   			<td>이미지</td>
									   			<td>회원정보</td>
									   			<td>버튼</td>
									   		</tr>
										   <c:forEach items="${list}" var="mem" varStatus="stat">
										   		<tr>
											   		<td><img src="<%=request.getContextPath() %>/resources/sbadmin/img/${mem.getFilename()}" style="width: 150px; height: 150px;"></td>
											   		<td>
												   		아이디 : ${mem.getMem_id()}<br>
												   		비밀번호 : ${mem.getMem_pw()}<br>
												   		이름 : ${mem.getMem_name()}<br>
												   		성별 : ${mem.getMem_sex()}
												   	</td>
												   	<td><a href="#">상세정보</a></td>
										   		</tr>
										   </c:forEach>
									   	</table>
									   <a href="total_signup.jsp">회원등록</a>		  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/include/footer.jsp" %>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>



