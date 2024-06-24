package kr.co.nextus.seller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.report.ReportVO;
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
	// 판매글 목록에서 판매글 삭제
	void deleteSellerSellList(int sellno);
	// 판매자가 받은 리뷰들 가져오기
	List<ReviewVO> getSellerReviews(int no);
	// 판매자가 받은 리뷰 신고
	void reportReview(ReportVO report) throws Exception;
	// 판매자의 거래 내역들 가져오기
	List<BuyListVO> getSellerBuyList(int no);
	// 판매자가 정산 신청 시 거래 상태 업데이트
    boolean updateStatus(Map<String, Object> params);
	
	//seller승인
	int registerSellerByAdmin(SellerRequestVO seller);
	
    List<SellerVO> getOrderAndReviewCountsLastWeek(int no);
	// 미니 헤더
    SellerVO getMiniHeaderData(int no);
    
    Integer getSellerState(int memberNo);
    
    void insertSellerReq(SellerVO vo, MultipartFile file, HttpServletRequest request);
    List<SellerRequestVO> reqList(int no);
}