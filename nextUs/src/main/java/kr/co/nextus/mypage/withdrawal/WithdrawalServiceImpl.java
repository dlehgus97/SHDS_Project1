package kr.co.nextus.mypage.withdrawal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.member.MemberVO;

@Service
public class WithdrawalServiceImpl implements WithdrawalService {

    @Autowired
    private WithdrawalMapper mapper;

    @Override
    public void withdrawMember(int memberno) {
        WithdrawalVO withdrawalVO = new WithdrawalVO();
        withdrawalVO.setMemberno(memberno);
        withdrawalVO.setState(2); // 탈퇴 상태로 변경
        mapper.updateMemberState(withdrawalVO);
    }
    
    @Override
	public int check(MemberVO vo) {

		return mapper.check(vo); 
	}
	
}