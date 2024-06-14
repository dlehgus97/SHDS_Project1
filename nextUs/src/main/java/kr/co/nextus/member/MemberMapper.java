package kr.co.nextus.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    int regist(MemberVO vo); // 회원 가입

    int emailCheck(String email); // 이메일 중복 체크

    MemberVO login(MemberVO vo); // 로그인

    MemberVO detail(MemberVO vo); // 회원 정보 조회

    int update(MemberVO vo); // 회원 정보 수정

    int findid(MemberVO vo); // 아이디 찾기

    MemberVO findByEmail(String email); // 이메일로 회원 정보 조회
    
    int insertMember(MemberVO vo);

    int count(MemberVO param); // 회원 목록의 총 개수

    List<MemberVO> list(MemberVO vo); // 회원 목록 조회
}
