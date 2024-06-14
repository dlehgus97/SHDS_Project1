package kr.co.nextus.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface CouponMapper {
	
	//쿠폰 생성
	int createCoupon(CouponVO vo);
	
	//쿠폰리스트 출력
	List<CouponVO> list(CouponVO vo);
	List<CouponVO> listAsName(CouponVO vo);
	int count(CouponVO param);

	CouponVO findcou(CouponVO vo);
	
	
}