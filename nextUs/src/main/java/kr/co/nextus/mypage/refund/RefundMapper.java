package kr.co.nextus.mypage.refund;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface RefundMapper {
	
	int insert(RefundVO vo);
	int update(RefundVO vo);

}
