package kr.co.nextus.seller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.report.ReportVO;
import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.sellerrequest.SellerRequestVO;
import kr.co.nextus.selllist.SellListVO;

// 서비스 구현 클래스 정의
@Service
public class SellerServiceImpl implements SellerService {
    
	// SellerMapper 주입
    @Autowired
    private SellerMapper sellerMapper;

    // 판매자 등록 구현
    @Override
    @Transactional
    public boolean registerSeller(SellerVO seller) {
    	// 판매자 정보 삽입 후 성공 여부 반환
        return sellerMapper.insertSeller(seller) > 0;
    }

    // 판매자 정보 조회 구현
    @Override
    public SellerVO getSellerDetails(int no) {
        // 판매자 정보로 판매자 정보 조회
    	return sellerMapper.getSellerByNo(no);
    }

    // 판매자 정보 업데이트 구현
    @Override
    @Transactional
    public boolean updateSeller(SellerVO seller) {
    	// 판매자 정보 업데이트 후 성공 여부 반환
        return sellerMapper.updateSeller(seller) > 0;
    }
    
    @Override
    public List<SellListVO> getSellerSellList(int no) {
        return sellerMapper.getSellerSellList(no);
    }
    
    @Override
    public void deleteSellerSellList(int sellno) {
        sellerMapper.deleteSellerSellList(sellno);
    }
    
    @Override
    public List<ReviewVO> getSellerReviews(int no) {
        return sellerMapper.getSellerReviews(no);
    }
    
    @Override
    public void reportReview(ReportVO report) throws Exception {
        sellerMapper.reportReview(report);
    }
    
    @Override
    public List<BuyListVO> getSellerBuyList(int no){
    	return sellerMapper.getSellerBuyList(no);
    }
    
    @Override
    public boolean updateStatus(Map<String, Object> params) {
        try {
            sellerMapper.updateStatus(params);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

	@Override
	public int registerSellerByAdmin(SellerRequestVO vo) {
		sellerMapper.insertSellerByAdmin(vo);
		return 1;
	}
	
	// 최근 일주일 주문 수, 매출액, 환불 수, 리뷰 수
    @Override
    public List<SellerVO> getOrderAndReviewCountsLastWeek(int no) {
        return sellerMapper.getOrderAndReviewCountsLastWeek(no);
    }
    
	// 미니 헤더
    @Override
    public SellerVO getMiniHeaderData(int no){
    	return sellerMapper.getMiniHeaderData(no);
    }
    
    @Override
    public Integer getSellerState(int memberNo) {
        return sellerMapper.findMemberNo(memberNo);
    }
    
    @Override
    public void registerSeller1(SellerVO vo) {
        sellerMapper.insertSeller1(vo);
    }
}