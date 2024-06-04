package kr.co.nextus.member;

public interface MemberService {
	boolean regist(MemberVO vo);
	int emailCheck(String email);
	MemberVO login(MemberVO vo);
	MemberVO detail(MemberVO vo);
	int update(MemberVO vo);
}
