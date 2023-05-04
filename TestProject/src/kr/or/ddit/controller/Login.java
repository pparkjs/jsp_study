package kr.or.ddit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberVO mem = new MemberVO();
		
		mem.setMem_id(id);
		mem.setMem_pw(pw);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		MemberVO vo = service.memberLogin(mem);
		
		if(vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", vo);
			response.sendRedirect(request.getContextPath() + "/boardList.do");
		}else {
			response.sendRedirect(request.getContextPath() + "/login.do?error=1");
		}
		
	}

}
