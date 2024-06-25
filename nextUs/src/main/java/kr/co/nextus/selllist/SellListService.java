package kr.co.nextus.selllist;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.category.CategoryVO;


public interface SellListService {
	Map<String, Object> list(SellListVO vo);
	
	String categoryname(int categoryno);
	
	SellListVO detail(SellListVO vo);
	
	public void insertSellList(SellListVO sellListVO, MultipartFile file, HttpServletRequest request);
	
	// void registerCategory(CategoryVO categoryVO);
	// void registerOption(SellListVO sellListVO);
	
	//관리자
	List<SellListVO> all(SellListVO vo);
	Map index(SellListVO vo);
	
	boolean deleteSelllist(int sellno);
}
