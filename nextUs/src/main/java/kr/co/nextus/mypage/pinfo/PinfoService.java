package kr.co.nextus.mypage.pinfo;

import java.util.List;
import java.util.Map;

import kr.co.nextus.member.MemberVO;


public interface PinfoService {
	
	MemberVO list(MemberVO vo);
	
	int check(MemberVO vo);

	int update(MemberVO vo);

}
