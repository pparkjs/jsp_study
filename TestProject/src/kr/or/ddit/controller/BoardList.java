package kr.or.ddit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.or.ddit.vo.PageVO;

@WebServlet("/boardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberVO mem = (MemberVO)session.getAttribute("member");
		
		if(mem == null) {
			response.sendRedirect("/login.do");
		}else {
			String culPageNum = request.getParameter("page");
			String type = request.getParameter("type");
			String word = request.getParameter("word");
			
			int cpage = 0;
			if(culPageNum == null) {
				culPageNum = "1";
				cpage = Integer.parseInt(culPageNum);
			}else {
				cpage = Integer.parseInt(culPageNum);
			}
			
			if(type == null && word == null) {
				type = "";
				word = "";
			}
			
			IBoardService service = BoardServiceImpl.getInstance();
			PageVO page = service.pageInfo(cpage, type, word);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("stype", type);
			map.put("sword", word);
			map.put("start", page.getStart());
			map.put("end", page.getEnd());
			List<BoardVO> list = service.boardList(map);
			
			request.setAttribute("pageInfo", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/board/boardlist.jsp").forward(request, response);
		}
		
	}

}
