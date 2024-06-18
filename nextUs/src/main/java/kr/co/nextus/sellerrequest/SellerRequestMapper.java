package kr.co.nextus.sellerrequest;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface SellerRequestMapper {
	
	//쿠폰리스트 출력
	List<SellerRequestVO> list(SellerRequestVO vo);
	int count(SellerRequestVO param);
	int countUnapproved(SellerRequestVO param);
	List<SellerRequestVO> detail(int no);
	int approve(SellerRequestVO vo);
	boolean deny(SellerRequestVO vo);
	
	
}