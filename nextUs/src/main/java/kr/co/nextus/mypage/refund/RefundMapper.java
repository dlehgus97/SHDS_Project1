package kr.co.nextus.mypage.refund;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface RefundMapper {
	
	int insert(RefundVO vo);
	int update(RefundVO vo);
	int count(RefundVO param);
	List<RefundVO> list(RefundVO param);
	List<RefundVO> detail(int no);
	boolean refund(int buyno);
	boolean refund2(RefundVO vo);

}
