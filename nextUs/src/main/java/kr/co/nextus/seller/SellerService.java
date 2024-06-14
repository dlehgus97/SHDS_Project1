package kr.co.nextus.seller;

import java.util.List;

import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.sellerrequest.SellerRequestVO;
import kr.co.nextus.selllist.SellListVO;

// 판매자 관련 로직을 추상화한 서비스 인터페이스

// 서비스 인터페이스 정의
public interface SellerService {
    // 판매자 등록
	boolean registerSeller(SellerVO seller);
    // 판매자 정보 조회
	SellerVO getSellerDetails(int id);
    // 판매자 정보 업데이트
	boolean updateSeller(SellerVO seller);
	// 판매자 판매 상품 가져오기
	List<SellListVO> getSellerSellList(int no);
	// 판매자가 받은 리뷰들 가져오기
	List<ReviewVO> getSellerReviews(int no);
	
	//seller승인
	int registerSellerByAdmin(SellerRequestVO seller);
}