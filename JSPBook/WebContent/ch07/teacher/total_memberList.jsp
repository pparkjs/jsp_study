<%@page import="totaltest.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="totaltest.dao.MemberDAO"%>
<%@ page language="java" pageEncoding="UTF-8"%>
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
                        <h1 class="h3 mb-0 text-gray-800">7장 파일업로드</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    	Commons-Fileupload를 이용한 파일 업로드
                                    </h6>
                                </div>
                                <div class="card-body">
                             		<%
										String id = request.getParameter("id");
										MemberDAO dao = MemberDAO.getInstance();
										ArrayList<MemberVO> memberList = dao.getMemberList();
										
										if(id != null){
									%>
										<c:set value="<%=id %>" var="memId"/>
									<%
										}
									%>
									<h3>회원목록</h3>
									<hr/>
									<br/>
									<button type="button" onclick="javascript:location.href='./total_signup.jsp'">회원등록</button><br/>
									<table border="1">
										<thead>
											<tr>
												<th>이미지</th>
												<th>회원정보</th>
												<th>버튼</th>
											</tr>
										</thead>
										<tbody>
											<c:set value="<%=memberList %>" var="list"/>
											<c:choose>
												<c:when test="${empty list }">
													<tr>
														<td colspan="3">조회하실 회원정보가 존재하지 않습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${list }" var="member">
														<tr>
															<td>
																<img style="width:116px;" alt="" 
																src="${pageContext.request.contextPath }/resources/images/${member.filename}">
															</td>
															<td>
																아이디 : ${member.mem_id }<br/>
																비밀번호 : ${member.mem_pw }<br/>
																이름 : ${member.mem_name }<br/>
																성별 : ${member.mem_sex }<br/>
															</td>
															<td>
																<a href="">상세정보</a>
															</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
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
    <script type="text/javascript">
	var idd = "${memId}";
	
	if(idd != null || idd != ""){
		alert(idd + "님! 환영합니다!");
	}
	</script>
</body>
</html>