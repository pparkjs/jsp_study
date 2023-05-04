package kr.or.ddit.service;

import kr.or.ddit.dao.IMemberDAO;
import kr.or.ddit.dao.MemberDAOImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	private IMemberDAO dao;
	private static IMemberService service;
	
	private MemberServiceImpl() {
		dao = MemberDAOImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public MemberVO memberLogin(MemberVO mem) {
		return dao.memberLogin(mem);
	}

	@Override
	public int memberJoin(MemberVO mem) {
		return dao.memberJoin(mem);
	}

}
