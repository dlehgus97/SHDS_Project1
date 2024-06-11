package kr.co.nextus.member;


import java.util.Map;



public interface MemberService {
	boolean regist(MemberVO vo);
	int emailCheck(String email);
	MemberVO login(MemberVO vo);
	MemberVO detail(MemberVO vo);
	int update(MemberVO vo);
	
	
	//관리자 페이지에서 동작
	Map index(MemberVO vo);
}
