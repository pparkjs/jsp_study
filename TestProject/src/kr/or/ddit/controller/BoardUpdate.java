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
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/boardUpdate.do")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberVO mem = (MemberVO)session.getAttribute("member");
		
		if(mem == null) {
			response.sendRedirect("/login.do");
		}else {
			request.getRequestDispatcher("/WEB-INF/views/board/boardupdate.jsp").forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int boNo = Integer.parseInt(request.getParameter("boNo"));
		BoardVO vo = new BoardVO();
		
		vo.setBo_title(title);
		vo.setBo_content(content);
		vo.setBo_no(boNo);
		IBoardService service = BoardServiceImpl.getInstance();
		
		service.boardUpdate(vo);
		
		response.sendRedirect(request.getContextPath() + "/boardView.do?boNo=" + boNo);
	}

}
