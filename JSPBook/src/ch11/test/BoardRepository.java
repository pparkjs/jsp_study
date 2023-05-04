package ch11.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class BoardRepository {
	private static int no = 0;
	private ArrayList<BoardVO> listOfBoard = new ArrayList<BoardVO>();
	private static BoardRepository instance = new BoardRepository();
	
	public static BoardRepository getInstance() {
		return instance;
	}
	
	// 게시판 목록 전체 가져오기
	public ArrayList<BoardVO> selectBoardList(){
		return listOfBoard;
	}
	
	// 게시글 1개 가져오기
	public BoardVO getBoardById(int no) {
		BoardVO bo = null;
		for(BoardVO vo : listOfBoard) {
			if(vo.getNo() == no) {
				bo = listOfBoard.get(vo.getNo()-1);
				break;
			}
		}
		return bo;
	}
	
	// 게시글 삭제
	public void deleteBoard(int no) {
		BoardVO bo = null;
		for(BoardVO vo : listOfBoard) {
			if(vo.getNo() == no) {
				bo = listOfBoard.remove(vo.getNo()-1);
				break;
			}
		}
	}
	
	// 게시글 수정
	public void updateBoard(BoardVO board) {
		BoardVO bo = null;
		for(BoardVO vo : listOfBoard) {
			if(vo.getNo() == board.getNo()) {
				bo = listOfBoard.set(board.getNo()-1, board);
				break;
			}
		}
	}
	
	// 게시글 추가
	public boolean addBoard(BoardVO board) {
		boolean flag = listOfBoard.add(board);
		return flag;
	}
	
	// 게시글 번호 가져오기
	public int getNo() {
		 no = no + 1;
		return no;
	}
	
	// 날짜 출력할때 활용
	public String getCurrenTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(cal.getTime());
	}
}
