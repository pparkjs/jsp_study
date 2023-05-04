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

@WebServlet("/boardView.do")
public class BoardView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boNo = request.getParameter("boNo");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		BoardVO board = service.boardView(boNo);
		// 조회수 처리
		service.boardHit(boNo);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("board", board);
		
		request.getRequestDispatcher("/WEB-INF/views/board/boardview.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
