package kr.co.nextus.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	// 가입
	int regist(MemberVO vo);
	// 이메일 중복체크
	int emailCheck(String email);
	// 로그인
	MemberVO login(MemberVO vo);
	// 회원정보 조회
	MemberVO detail(MemberVO vo);
	// 회원정보 수정
	int update(MemberVO vo);
	//아이디 찾기
	int findid(MemberVO vo);
	
	//관리자
	int count(MemberVO param);
	List<MemberVO> list(MemberVO vo);
	List<MemberVO> listAtOnce(MemberVO vo);
	List<MemberVO> reportCountList(MemberVO vo);
}
