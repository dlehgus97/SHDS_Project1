package kr.co.nextus.buylist;


import java.util.Map;


public interface BuyListService {

	
	//관리자 페이지에서 동작
	Map<String, Object> list(BuyListVO vo);

	boolean settle(int buyno);

	int settleNEW(BuyListVO vo);
	int refundNEW(BuyListVO vo);
}
