package kr.or.ddit.dao;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDAO {
	
	// 회원 로그인 확인 메서드
	public MemberVO memberLogin(MemberVO mem);
	
	// 회원가입  메서드
	public int memberJoin(MemberVO mem);
	
}
