package kr.co.nextus.ban;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.member.MemberVO;

@Mapper
public interface BanMapper {

	
	
	//관리자 페이지에서 동작
	List<BanVO> memberBanList(BanVO vo);
	List<BanVO> sellerBanList(BanVO vo);
	int count(BanVO param);
		
	int add(BanVO vo);
}
