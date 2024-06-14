package kr.co.nextus.seller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.sellerrequest.SellerRequestVO;
import kr.co.nextus.selllist.SellListVO;

// MyBatis mapper 인터페이스 정의
@Mapper
public interface SellerMapper {
	// 판매자 정보를 DB에 삽입
	int insertSeller(SellerVO seller);
	
	// 판매자 번호로 판매자 정보를 조회
	SellerVO getSellerByNo(int no);
	
	// 판매자 정보를 업데이트
	int updateSeller(SellerVO seller);
	
	List<SellListVO> getSellerSellList(int no);
	
	List<ReviewVO> getSellerReviews(int no);
	
	//판매자 승인
	int insertSellerByAdmin(SellerRequestVO vo);

}