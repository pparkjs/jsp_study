<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
		                            	input 태그의 기능과 사용법(form)
		                            </h6>
                                </div>
                                <div class="card-body">
                                	<!-- 
                                		1) 아래 형태처럼 데이터를 출력해주세요.
                                		아이디 : 
                                		비밀번호 : 
                                		이름 : 
                                		연락처 : 
                                		이메일 : 
                                		성별 :
                                		취미 : oo, oo, oo
                                		소개 :
                                		
                                		위와 같은 형식으로 출력해주시고,
                                		
                                		2) 아이디, 비밀번호, 이름 중 1개라도 누락했을 경우
                                			다시 ch06_test.jsp로 넘어가 "아이디, 비밀번호, 이름 중 1개의 값이 누락되었습니다"
                                			메시지가 표시될 수 있도록 해주세요.
                                			
                                		3) 테스트 시나리오
                                			1) 정상적으로 데이터를 입력하여 데이터가 넘어가 정상적으로 출력되는걸 확인
                                			2) 아이디 비밀번호 이름 중 1개를 누락 후 전송 시, ch06_test.jsp 페이지에서
                                				"아이디, 비밀번호, 이름 중 1개의 값이 누락되었습니다" 메시지를 확인한다.
                                				
                                		4) 출력은 JSTL과 EL을 이용하여 출력주세요.
                                		
                                	 -->
                                	<%
                                	
                                		request.setCharacterEncoding("utf-8");
                                		String id = request.getParameter("id");
                                	    String pw = request.getParameter("pw");
                                	    String name = request.getParameter("name");
                                	    String phone1 = request.getParameter("phone1");
                                	    String phone2 = request.getParameter("phone2");
                                	    String phone3 = request.getParameter("phone3");
                                	    String gender = request.getParameter("gender");
                                	    String[] hobby = request.getParameterValues("hobby");
                                	    String comment= request.getParameter("comment");
                                	    
                                	    if(id == "" || pw == "" || name == ""){
	                                	    request.setAttribute("none", "아이디, 비밀번호, 이름 중 1개의 값이 누락되었습니다.");
	                                	   	request.getRequestDispatcher("ch06_test.jsp").forward(request, response);
                                	    }
                                	    
                                	%>
                                	 <c:set value="<%=id %>" var="id"/>
                                	 <c:set value="<%=pw %>" var="pw"/>
                                	 <c:set value="<%=name %>" var="name"/>
                                	 <c:set value="<%=phone1 %>" var="phone1"/>
                                	 <c:set value="<%=phone2 %>" var="phone2"/>
                                	 <c:set value="<%=phone3 %>" var="phone3"/>
                                	 <c:set value="<%=gender %>" var="gender"/>
                                	 <c:set value="<%=hobby %>" var="hobby"/>
                                	 <c:set value="<%=comment %>" var="comment"/>
                                	 
                                	 
                                	 아이디 : <c:out value="${id}"/><br>
                                	 비밀번호 : <c:out value="${pw}"/><br>
                                	 이름 : <c:out value="${name}"/><br>
                                	 연락처 : <c:out value="${phone1}"/> -
                                	 <c:out value="${phone2}"/> -
                                	 <c:out value="${phone3}"/><br>
                                	 성별 : <c:out value="${gender}"/><br>
                                	취미 :<c:forEach items="${hobby}" var="hobby" varStatus="stat" >
                                	  		<span>${hobby}</span>
                                	 </c:forEach><br>
                                	 자기소개 : <c:out value="${comment}"/><br>
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