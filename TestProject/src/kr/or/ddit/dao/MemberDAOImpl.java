package kr.or.ddit.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import kr.or.ddit.vo.MemberVO;

public class MemberDAOImpl implements IMemberDAO {
	
	private static IMemberDAO dao;
	
	private MemberDAOImpl() {}
	
	public static IMemberDAO getInstance() {
		if(dao == null) dao = new MemberDAOImpl();
		return dao;
	}
	
	@Override
	public MemberVO memberLogin(MemberVO mem) {
		SqlSession session = null;
		MemberVO vo = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("member.memberLogin", mem);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return vo;
	}

	@Override
	public int memberJoin(MemberVO mem) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("member.memberJoin", mem);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}

}
