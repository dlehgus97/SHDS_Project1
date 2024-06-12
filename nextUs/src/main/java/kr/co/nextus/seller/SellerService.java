package kr.co.nextus.seller;

// 판매자 관련 로직을 추상화한 서비스 인터페이스

// 서비스 인터페이스 정의
public interface SellerService {
    // 판매자 등록
	boolean registerSeller(SellerVO seller);
    // 판매자 정보 조회
	SellerVO getSellerDetails(int id);
    // 판매자 정보 업데이트
	boolean updateSeller(SellerVO seller);
}