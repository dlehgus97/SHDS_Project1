package kr.co.nextus.selllist;

import java.util.List;
import java.util.Map;

import kr.co.nextus.category.CategoryVO;


public interface SellListService {
	Map<String, Object> list(SellListVO vo);
	
	String categoryname(int categoryno);
	
	SellListVO detail(SellListVO vo);
	
	void insertSellList(SellListVO sellListVO);
	
	// void registerCategory(CategoryVO categoryVO);
	// void registerOption(SellListVO sellListVO);
	
	//관리자
	List<SellListVO> all(SellListVO vo);
	Map index(SellListVO vo);
	
	boolean deleteSelllist(int sellno);
}
