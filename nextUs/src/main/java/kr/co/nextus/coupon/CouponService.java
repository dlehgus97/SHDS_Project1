package kr.co.nextus.coupon;


import java.util.List;
import java.util.Map;


public interface CouponService {

	
	//관리자 페이지에서 동작
	//그냥 리스트
	Map<String, Object> list(CouponVO vo);
	//쿠폰별로 뿌린 멤버리스트
	Map<String, Object> listAsName(String name);
	//쿠폰생성
	boolean createCoupon(CouponVO vo, List<String> memberEmails);

	
	//유저용
	List<CouponVO> listToMember(int no);
	void useCoupon(int couponno);
}
