package kr.co.nextus.mypage.refund;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.coupon.CouponVO;


@Mapper
public interface RefundMapper {
	
	int insert(RefundVO vo);
	int update(RefundVO vo);
	int count(RefundVO param);
	List<RefundVO> list(RefundVO param);

}
