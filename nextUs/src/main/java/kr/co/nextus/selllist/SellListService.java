package kr.co.nextus.selllist;

import java.util.List;
import java.util.Map;


public interface SellListService {
	List<SellListVO> list(SellListVO vo);
	SellListVO detail(int no);
	
	//관리자
	List<SellListVO> all(SellListVO vo);
	Map index(SellListVO vo);
}
