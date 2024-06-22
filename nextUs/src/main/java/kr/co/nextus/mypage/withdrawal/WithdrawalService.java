package kr.co.nextus.mypage.withdrawal;

import kr.co.nextus.member.MemberVO;

public interface WithdrawalService {
	
    void withdrawMember(int memberno);
    int check(MemberVO vo);
}
