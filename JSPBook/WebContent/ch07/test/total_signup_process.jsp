<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="totaltest.dao.MemberDAO"%>
<%@page import="totaltest.vo.MemberVO"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
										1. 회원가입 폼에서 넘겨받은 일반 데이터, 파일 데이터를 전달받아서
										일반데이터와 파일명을 저장하여 회원 객체 하나를 저장 후 , 회원 목록에 해당하는 리스트에 저장하여
										목록 페이지에서  리스트 데이터를 활용할 수 있도록 해주세요.
										- DAO, VO 활용
										
										2. 회원가입이 완료되면, total_signin.jsp로 이동하여 로그인을 진행할 수 있도록 해주세요.
									 -->
									 <%
									 	request.setCharacterEncoding("UTF-8");
									 	MemberVO vo = new MemberVO();
									 	
									 	// 내가 사용중인 프로젝트의 contextPath 경로(JSPBook/resources/images 경로)
									 	// 이클립스상에서의 폴더 경로가 아닌 이클립스에서 만들어낸 프로젝트가 배포되서 생성되는 배포 경로가 되겠다!
									 	String fileUploadPath = request.getServletContext().getRealPath("/resources/images"); 
									 	
										File tempFile = new File(fileUploadPath);
                                	 	if(!tempFile.exists()){
                                	 		tempFile.mkdirs();
                                	 	}
                                	 	
                                	 	DiskFileUpload upload = new DiskFileUpload();
                                	 	
                                	 	upload.setSizeMax(5 * 1024 * 1024); // 업로드 할 파일의 최대 크기(byte)
                                	 	upload.setSizeThreshold(4096); 		// 메모리상에 저장할 최대 크기(byte)
                                	 	upload.setRepositoryPath(fileUploadPath); //업로드된 파일을 임시로 저장할 경로
                                	 	
                                	 	List items = upload.parseRequest(request);
                                	 	Iterator params = items.iterator();
                                	 	
                                	 	
//                                 	 	Map<String, Object> dataMap = new HashMap<>();
                                	 	int maxSize = 4 * 1024 * 1024; // 파일 업로드 시 1개의 파일 당 사이즈 (최대 사이즈)
                                	 	
                                	 	while(params.hasNext()){
                                	 		FileItem fileItem = (FileItem) params.next();
                                	 		
                                	 		if(! fileItem.isFormField()){
                                	 			String fileFieldName = fileItem.getFieldName();
                                	 			String fileName = fileItem.getName(); // 파일 이름
                                	 			String contentType = fileItem.getContentType();
                                	 			long fileSize = fileItem.getSize();
                                	 			
                                	 			File file = new File(fileUploadPath + "/" +  fileName);
                                	 			if(maxSize < fileSize){
                                	 				//파일 크기 초과
                                	 			}else{
                                	 				fileItem.write(file); //업로드
                                	 			}
                                	 			
//                                 	 			dataMap.put(fileFieldName, fileName);
                                	 			vo.setFilename(fileName); //파일 이름 저장
                                	 			
                                	 		}else{
                                	 			String name = fileItem.getFieldName(); //파라미터 이름 가져옴
                                	 			String value = fileItem.getString("UTF-8");
//                                 	 			dataMap.put(name, value);
                                	 			if(name.equals("id")){
                                	 				vo.setMem_id(value);
                                	 			}
                                	 			if(name.equals("pw")){
                                	 				vo.setMem_pw(value);
                                	 			}
                                	 			if(name.equals("name")){
                                	 				vo.setMem_name(value);
                                	 			}
                                	 			if(name.equals("gend")){
                                	 				vo.setMem_sex(value);
                                	 			}
                                	 		}
                                	 	}
                                	 	
                                	 	MemberDAO dao = MemberDAO.getInstance();
                                	 	
                                	 	dao.insertMember(vo); //가입 정보 삽입
                                	 	
                                	 	response.sendRedirect("total_signin.jsp");
									 %>
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
