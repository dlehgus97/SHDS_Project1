package kr.co.nextus.member;


import java.util.Map;

import kr.co.nextus.qna.QnAVO;



public interface MemberService {
	boolean regist(MemberVO vo);
	int emailCheck(String email);
	MemberVO login(MemberVO vo);
	MemberVO detail(MemberVO vo);
	int update(MemberVO vo);
	
	
	//관리자 페이지에서 동작
	Map<String, Object> list(MemberVO vo);
	Map<String, Object> listAtOnce(MemberVO vo);
}
