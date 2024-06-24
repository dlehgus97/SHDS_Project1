package kr.co.nextus.seller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.report.ReportVO;
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
	
	// 판매자의 판매글 목록 조회
	List<SellListVO> getSellerSellList(int no);
	
	// 판매글 목록에서 판매글 삭제
	void deleteSellerSellList(int sellno);
	
	// 판매자가 받은 리뷰들 조회
	List<ReviewVO> getSellerReviews(int no);
	
	// 판매자가 받은 리뷰 신고
	void reportReview(ReportVO report) throws Exception;
	
	// 판매자의 거래 내역 조회
	List<BuyListVO> getSellerBuyList(int no);
	
	// 판매자가 정산 신청 시 거래 상태 업데이트
	void updateStatus(Map<String, Object> params);
	
	//판매자 승인
	int insertSellerByAdmin(SellerRequestVO vo);
	
	// 최근 일주일 주문 수, 매출액, 환불 수, 리뷰 수
	List<SellerVO> getOrderAndReviewCountsLastWeek(int no);
	
	// 미니 헤더
	SellerVO getMiniHeaderData(int no);
	
	Integer findMemberNo(int memberNo);
	
	void insertSeller1(SellerVO vo);
	
}