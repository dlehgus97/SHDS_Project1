package kr.co.nextus.mypage.withdrawal;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.member.MemberVO;

@Mapper
public interface WithdrawalMapper {
    void updateMemberState(WithdrawalVO withdrawalVO);
    int check(MemberVO vo);
}