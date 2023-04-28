<%@page import="totaltest.vo.MemberVO"%>
<%@page import="totaltest.dao.MemberDAO"%>
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
                                <div class="card-body">
						          <!-- 
										1. 아이디, 비밀번호, 이름, 성별, 프로필 이미지를 입력받고
										  회원가입을 진행해주세요.
										  
										2. 회원가입 진행 경로는 total_signup_process.jsp로 이동하여 회원가입 처리를 완료해주세요.
										
										3. 뒤로가기 버튼을 생성하고, 뒤로가기 버튼을 클릭 시 다시 로그인 화면으로 나갈 수 있도록 해주세요.
									 -->
									 <form action="total_signup_process.jsp" method="post" enctype="multipart/form-data">
									 	아이디 : <input class="mem_id" type="text" name="id"><br>
									 	비밀번호 : <input type="password" name="pw"><br>
									 	이름 : <input type="text" name="name"><br>
									 	성별 : <input type="radio" name="gend" value="남성" checked="checked">남성
									 		<input type="radio" name="gend" value="여성">여성 <br>
									 	프로필 이미지 : <input type="file" name="filename">
									 	<input type="submit" value="가입하기"><br>
									 	<a href="total_signin.jsp">뒤로가기</a>
									 </form>
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



	