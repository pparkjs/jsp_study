<%@page import="ch11.test.BoardRepository"%>
<%@page import="ch11.test.BoardVO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItem"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionBoard_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시글 등록을 처리해주세요.
		> 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 게시글 등록 실패 시, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->
 <%
 	String path = request.getServletContext().getRealPath("/resources/files");
 	File file = new File(path);
 	if(!file.exists()){
 		file.mkdirs();
 	}
 	
 	DiskFileUpload upload = new DiskFileUpload();
 	upload.setFileSizeMax(5 * 1024 * 1024);
 	upload.setSizeThreshold(4096);
 	upload.setRepositoryPath(path);
 	
 	List items = upload.parseRequest(request);
 	Iterator params = items.iterator();
 	
 	Map<String, Object> dataMap = new HashMap<String, Object>();
 	
 	int maxSize = 4 * 1024 * 1024;
 	while(params.hasNext()){
 		FileItem item = (FileItem)params.next();
 		
 		if(item.isFormField()){
 			String name = item.getFieldName(); // 파라미터 이름
 			String value = item.getString("utf-8");
 			dataMap.put(name, value);
 		}else{
 			String fileFieldName = item.getFieldName();
			String fileName = item.getName();	// 저장 파일의 이름
			
			if(!fileName.equals("")){
				String contentType = item.getContentType();
				long fileSize = item.getSize();
				File file1 = new File(path + "/" + fileName);
				item.write(file1);
				fileName.lastIndexOf('.');
				dataMap.put(fileFieldName, fileName);
			}
 		}
 	}
 	BoardRepository rep = BoardRepository.getInstance();
 	
 	int no = rep.getNo();
 	BoardVO vo = new BoardVO();
 	vo.setNo(no);
 	vo.setTitle(dataMap.get("title").toString());
 	vo.setContent(dataMap.get("content").toString());
 	vo.setWriter(dataMap.get("writer").toString());
 	vo.setRegDate(rep.getCurrenTime());
 	vo.setHit(0);
 	vo.setFileName(dataMap.get("fileName").toString());
 	
 	boolean res = rep.addBoard(vo);
 	if(res){
		response.sendRedirect("boardView.jsp?no="+no);
 	}else{
 		response.sendRedirect("exceptionBoard_error.jsp");
 	}
 	
 	
 %>
</body>
</html>