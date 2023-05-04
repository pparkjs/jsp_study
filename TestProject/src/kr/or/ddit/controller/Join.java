package kr.or.ddit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/join.do")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		MemberVO mem = new MemberVO();
		
		mem.setMem_id(id);
		mem.setMem_pw(pw);
		mem.setMem_name(name);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		int result = service.memberJoin(mem);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/login.do?res="+result);
		}else {
			request.setAttribute("mem", mem);
			request.getRequestDispatcher(request.getContextPath() + "/join.do").forward(request, response);
		}
	}

}
