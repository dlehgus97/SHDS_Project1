package kr.co.nextus.ban;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface BanMapper {

	
	
	//관리자 페이지에서 동작
	List<BanVO> memberBanList(BanVO vo);
	List<BanVO> sellerBanList(BanVO vo);
	int countMember(BanVO param);
	int countSeller(BanVO param);
		
	int add(BanVO vo);
	boolean banFree(int no);
}
