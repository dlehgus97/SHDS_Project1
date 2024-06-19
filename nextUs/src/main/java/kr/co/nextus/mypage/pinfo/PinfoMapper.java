package kr.co.nextus.mypage.pinfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.member.MemberVO;

@Mapper
public interface PinfoMapper {
    
	MemberVO list(MemberVO vo);
	int check(MemberVO vo);
	int update(MemberVO vo);

}
