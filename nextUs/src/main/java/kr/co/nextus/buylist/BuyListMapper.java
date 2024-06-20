package kr.co.nextus.buylist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface BuyListMapper {
	

	
	List<BuyListVO> list(BuyListVO vo);

	int count(BuyListVO param);

	boolean settle(int buyno);
	
}