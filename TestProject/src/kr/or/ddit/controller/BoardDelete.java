package kr.or.ddit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.BoardServiceImpl;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/boardDelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberVO mem = (MemberVO)session.getAttribute("member");
		
		if(mem == null) {
			response.sendRedirect("/login.do");
		}else {
			String boNo = request.getParameter("boNo");
			
			IBoardService service = BoardServiceImpl.getInstance();
			
			int result = service.boardDelete(boNo);
			
			response.sendRedirect(request.getContextPath() + "/boardList.do");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
