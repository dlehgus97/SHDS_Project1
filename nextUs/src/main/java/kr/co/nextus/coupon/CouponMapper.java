package kr.co.nextus.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;



@Mapper
public interface CouponMapper {
	
	//쿠폰 생성
	int createCoupon(CouponVO vo);
	
	//쿠폰리스트 출력
	List<CouponVO> list(CouponVO vo);
	List<CouponVO> listAsName(String name);
	int count(CouponVO param);
	
	
	//유저에게 보여주기 위함
	List<CouponVO> listToMember(int no);
	void useCoupon(int couponno);
}