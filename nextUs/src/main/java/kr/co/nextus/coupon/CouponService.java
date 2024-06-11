package kr.co.nextus.coupon;


import java.util.Map;



public interface CouponService {

	boolean create(CouponVO vo);
	//관리자 페이지에서 동작
	
	Map index(CouponVO vo);
}
