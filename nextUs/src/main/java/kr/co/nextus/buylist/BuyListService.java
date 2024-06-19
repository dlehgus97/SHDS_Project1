package kr.co.nextus.buylist;


import java.util.List;
import java.util.Map;

import kr.co.nextus.coupon.CouponVO;


public interface BuyListService {

	
	//관리자 페이지에서 동작
	Map<String, Object> list(BuyListVO vo);
}
