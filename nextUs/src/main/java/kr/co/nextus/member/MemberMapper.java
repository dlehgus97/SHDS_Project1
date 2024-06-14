package kr.co.nextus.member;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

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
    int findid(MemberVO vo);

    // 이메일로 회원 정보 조회
    MemberVO findByEmail(String email);

    // 네이버 회원 정보 저장
    int insertMember(MemberVO vo);

    // 회원 목록의 총 개수
    int count(MemberVO param);

    // 회원 목록 조회
    List<MemberVO> list(MemberVO vo);

    // 일괄 처리된 회원 목록 조회
    List<MemberVO> listAtOnce(MemberVO vo);

    // 회원 신고 건수 목록 조회
    List<MemberVO> memberReportCountList(MemberVO param);

    // 판매자 신고 건수 목록 조회
    List<MemberVO> sellerReportCountList(MemberVO param);
}
