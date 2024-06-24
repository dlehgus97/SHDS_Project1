package kr.co.nextus.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.buylist.BuyListVO;

@Mapper
public interface MemberMapper {

    // 회원 가입
    int regist(MemberVO vo);

    // 이메일 중복 체크
    int emailCheck(String email);

    // 로그인
    MemberVO login(MemberVO vo);

    // 회원 정보 조회
    MemberVO detail(MemberVO vo);

    // 회원 정보 수정
    int update(MemberVO vo);

    // 아이디 찾기
    MemberVO findId(MemberVO vo);

    // 이메일로 회원 정보 조회
    MemberVO findByEmail(String email);

    // 네이버 회원 정보 저장
    int insertMember(MemberVO vo);
    
    int updatePassword(Map map);

   
    //관리자
  	int count(MemberVO param);
  	List<MemberVO> list(MemberVO vo);
  	List<MemberVO> listAtOnce(MemberVO vo);
  	List<MemberVO> memberReportCountList(MemberVO param);
  	List<MemberVO> sellerReportCountList(MemberVO param);
  	int sellerRegist(int no);
  	
  	//제재시 state 1로 바꾸기
  	int ban(int no);

	List<BuyListVO> seven_days_members(MemberVO vo);

	int total_members(MemberVO vo);
	int today_members(MemberVO vo);
}
