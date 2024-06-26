package kr.co.nextus.member;

import java.util.HashMap;
import java.util.Map;



public interface MemberService {


    boolean regist(MemberVO vo);

    int emailCheck(String email);

    MemberVO login(MemberVO vo);

    MemberVO detail(MemberVO vo);

    int update(MemberVO vo);

    MemberVO findId(MemberVO vo);

    MemberVO findByEmail(String email);
    
    MemberVO findByEmail2(MemberVO vo);

    boolean checkMemberExist(String email); // 존재하는 회원인지 확인
    
    boolean insertMember(MemberVO member);
    
    void updatePassword(String email, String newPassword);
    
    boolean updateNickname(int no, String nickname);
    
    String getAccessToken(String authorize_code);
    HashMap<String, Object> getUserInfo(String access_Token);
    int processKakaoLogin(HashMap<String, Object> userInfo);
	
	//관리자 페이지에서 동작
	Map<String, Object> list(MemberVO vo);
	Map<String, Object> listAtOnce(MemberVO vo);
	Map<String, Object> reportCountList(MemberVO vo,int isSeller);

	int sellerRegist(int no);

	//adminMain
	Map<String, Object> seven_days_members(MemberVO vo);



	
	
}
