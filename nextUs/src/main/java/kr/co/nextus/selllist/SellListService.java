package kr.co.nextus.selllist;

import java.util.List;

public interface SellListService {
	List<SellListVO> list(SellListVO vo);
	SellListVO detail(int no);
}
