package kr.co.nextus.member;

import java.util.Map;

public interface MemberService {

    boolean regist(MemberVO vo);

    int emailCheck(String email);

    MemberVO login(MemberVO vo);

    MemberVO detail(MemberVO vo);

    int update(MemberVO vo);

    boolean findid(MemberVO vo);

    MemberVO findByEmail(String email);

    boolean checkMemberExist(String email); // 존재하는 회원인지 확인
    
    boolean insertMember(MemberVO member);
   

    Map index(MemberVO vo); // 관리자 페이지에서 사용하는 메서드
}
