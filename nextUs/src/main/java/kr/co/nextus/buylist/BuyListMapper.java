package kr.co.nextus.buylist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BuyListMapper {
	List<BuyListVO> list(BuyListVO vo);
	int count(BuyListVO param);
	void insert(List<BuyListVO> vos);

	boolean settle(int buyno);

	int Countsettle(BuyListVO vo);

	int Countrefund(BuyListVO vo);
	List<BuyListVO> seven_days_sales(BuyListVO vo);
}