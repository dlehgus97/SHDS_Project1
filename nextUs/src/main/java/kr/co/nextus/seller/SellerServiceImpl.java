package kr.co.nextus.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.nextus.review.ReviewVO;
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
    public List<ReviewVO> getSellerReviews(int no) {
        return sellerMapper.getSellerReviews(no);
    }
}