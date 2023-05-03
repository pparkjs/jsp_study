<%@page import="totaltest.vo.MemberVO"%>
<%@page import="totaltest.dao.MemberDAO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String path = request.getServletContext().getRealPath("/resources/images");
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
				String name = item.getFieldName();	// 파라미터 이름
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
					
					dataMap.put(fileFieldName, fileName);
				}
			}
		}
		
		MemberDAO dao = MemberDAO.getInstance();
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(dataMap.get("mem_id").toString());
		vo.setMem_pw(dataMap.get("mem_pw").toString());
		vo.setMem_name(dataMap.get("mem_name").toString());
		vo.setMem_sex(dataMap.get("mem_gender").toString());
		vo.setFilename(dataMap.get("filename").toString());
		
		dao.insertMember(vo);
		response.sendRedirect("./total_signin.jsp");
	%>












