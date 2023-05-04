package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import kr.or.ddit.vo.BoardVO;

public class BoardDAOImpl implements IBoardDAO {
	private static IBoardDAO dao;
	
	private BoardDAOImpl() {}
	
	public static IBoardDAO getInstance() {
		if(dao == null) dao = new BoardDAOImpl();
		return dao;
	}
	
	@Override
	public List<BoardVO> boardList(Map<String, Object> map) {
		SqlSession session = null;
		List<BoardVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("board.boardList", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return list;
	}

	@Override
	public BoardVO boardView(String boardNo) {
		SqlSession session = null;
		BoardVO vo = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("board.boardView", boardNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return vo;
	}

	@Override
	public int boardInsert(BoardVO vo) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("board.boardInsert", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("board.boardUpdate", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}

	@Override
	public int boardDelete(String boardNo) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.delete("board.boardDelete", boardNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}

	@Override
	public int boardHit(String boardNo) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("board.boardHit", boardNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("board.totalCount", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}

}
