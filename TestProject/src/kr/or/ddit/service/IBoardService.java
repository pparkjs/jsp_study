package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PageVO;

public interface IBoardService {
	
	//게시글 목록 가져오기
	public List<BoardVO> boardList(Map<String, Object> map);
	
	// 전체 게시글 개수
	public int totalCount(Map<String, Object> map);
	
	//게시글 상세보기
	public BoardVO boardView(String boardNo);
	
	//게시글 등록하기
	public int boardInsert(BoardVO vo);
	
	//게시글 수정하기
	public int boardUpdate(BoardVO vo);
	
	//게시글 삭제하기
	public int boardDelete(String boardNo);
	
	//조회수 증가
	public int boardHit(String boardNo);
	
	//페이지 처리
	public PageVO pageInfo(int culPageNum, String type, String word);
	
}
