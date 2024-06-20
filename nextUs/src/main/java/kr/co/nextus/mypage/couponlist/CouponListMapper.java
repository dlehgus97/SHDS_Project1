package kr.co.nextus.mypage.couponlist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.qna.QnAVO;

@Mapper
public interface CouponListMapper {

	List<CouponListVO> list(CouponListVO vo);

}
