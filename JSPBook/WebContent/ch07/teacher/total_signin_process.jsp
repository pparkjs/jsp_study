<%@page import="totaltest.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="totaltest.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 로그인 페이지에서 전송한 아이디, 비밀번호를 받는다.
	String id = request.getParameter("id");
	String pw =request.getParameter("pw");
	
	// 2. 전달받은 아이디, 비밀번호에 해당하는 내 정보가 있는지 없는지 체크
	// - 회원 데이터 전부를 요청해야한다.
	// - 회원 데이터 전부와 전달받은 아이디, 비밀번호를 비교한다.
	// - 회원 데이터 전부를 가져오기 위해 DAO한테 요청
	// - DAO 인스턴스가 필요하다.
	// - DAO 인스턴스를 통해 회원 데이터 전부를 가져오기 위한 기능 요청
	MemberDAO dao = MemberDAO.getInstance();				// DAO 인스턴스 얻어오기
	ArrayList<MemberVO> memberList = dao.getMemberList();	// DAO 인스턴스에서 회원 전체 들고오기
	
	// 회원전체와 전달받은 아이디, 비밀번호를 비교
	if(memberList.size() > 0){	// 회원 목록 데이터가 존재
		// '회원정보가 존재할때? 존재하지 않을때?' 에 해당하는 스위칭
		boolean flag = false;	// 존재하지 않을때
		for(MemberVO memberVO : memberList){
			// 일치하는 회원정보가 존재할 때
			if(id.equals(memberVO.getMem_id()) && pw.equals(memberVO.getMem_pw())){
				flag = true;	// 회원정보가 존재!
				break;				
			}
		}
		
		if(flag){	// 회원정보가 존재
			response.sendRedirect("./total_memberList.jsp?id="+id);
		}else{		// 회원정보가 존재하지 않을때
			request.getRequestDispatcher("./total_signin.jsp?error=1").forward(request, response);
		}
	}else{						// 회원 목록 데이터가 존재하지 않음.
		// 에러 처리를 해야한다.
		request.getRequestDispatcher("./total_signin.jsp?error=1").forward(request, response);
	}
%>













