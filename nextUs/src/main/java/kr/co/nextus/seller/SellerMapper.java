package kr.co.nextus.seller;

import org.apache.ibatis.annotations.Mapper;

// MyBatis mapper 인터페이스 정의
@Mapper
public interface SellerMapper {
	// 판매자 정보를 DB에 삽입
	int insertSeller(SellerVO seller);
	
	// 판매자 번호로 판매자 정보를 조회
	SellerVO getSellerByNo(int no);
	
	// 판매자 정보를 업데이트
	int updateSeller(SellerVO seller);
}