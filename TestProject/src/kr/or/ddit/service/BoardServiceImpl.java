package kr.or.ddit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.BoardDAOImpl;
import kr.or.ddit.dao.IBoardDAO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PageVO;

public class BoardServiceImpl implements IBoardService {
	 private IBoardDAO dao;
	 private static IBoardService service;
	 
	 private BoardServiceImpl() {
		 dao = BoardDAOImpl.getInstance();
	 }
	 
	 public static IBoardService getInstance() {
		 if(service == null) service = new BoardServiceImpl();
		 return service;
	 }
	 
	@Override
	public List<BoardVO> boardList(Map<String, Object> map) {
		return dao.boardList(map);
	}

	@Override
	public BoardVO boardView(String boardNo) {
		return dao.boardView(boardNo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return dao.boardUpdate(vo);
	}

	@Override
	public int boardDelete(String boardNo) {
		return dao.boardDelete(boardNo);
	}
	

	@Override
	public int boardHit(String boardNo) {
		return dao.boardHit(boardNo);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}
	
	public PageVO pageInfo(int culPageNum, String type, String word) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", type);
		map.put("sword", word);
		int count = this.totalCount(map);
		
		//전체 페이지 수 구하기
		int totalPage = (int)Math.ceil((double)count/ PageVO.getPerList());
		
		//start, end 구하기
		int start = (culPageNum - 1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1; 		
		
		if(end > count) end = count; // end 개수가 최대를 넘어가 버리면  end 를 전체 개수로 설정
		
		//시작 페이지와 끝페이지
		int perPage = PageVO.getPerPage(); // 한화면에 보이는 페이지 수 4개
		int startPageNum = ((culPageNum - 1) / perPage * perPage ) + 1; // (curPageNum - 1 ) / perPage는 0.xx나오면 다 0나옴
		int endPageNum = startPageNum + perPage - 1;
		
		if(endPageNum > totalPage) endPageNum = totalPage; // end페이지 개수가 전체 페이지 개수를 넘어가면  end페이지를 전체 페이지개수로 설정
		
		PageVO vo = new PageVO();
		vo.setCulPageNum(culPageNum);
		vo.setStart(start);
		vo.setEnd(end);
		vo.setTotalPageNum(totalPage);
		vo.setStartPageNum(startPageNum);
		vo.setEndPageNum(endPageNum);
		vo.setStype(type);
		vo.setSword(word);
		return vo;
	}

}
