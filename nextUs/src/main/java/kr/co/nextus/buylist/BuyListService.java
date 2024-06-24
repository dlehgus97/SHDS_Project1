package kr.co.nextus.buylist;


import java.util.List;
import java.util.Map;


public interface BuyListService {

	void insert(List<BuyListVO> vos);
	//관리자 페이지에서 동작
	Map<String, Object> list(BuyListVO vo);

	boolean settle(int buyno);

	int settleNEW(BuyListVO vo);
	int refundNEW(BuyListVO vo);
	
	//adminMain
	Map<String, Object> seven_days_sales(BuyListVO vo);

}
