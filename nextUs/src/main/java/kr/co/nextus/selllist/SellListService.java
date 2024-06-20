package kr.co.nextus.selllist;

import java.util.List;
import java.util.Map;


public interface SellListService {
	Map<String, Object> list(SellListVO vo);
	SellListVO detail(SellListVO vo);
	
	//관리자
	List<SellListVO> all(SellListVO vo);
	Map index(SellListVO vo);
	
	boolean deleteSelllist(int sellno);
}
