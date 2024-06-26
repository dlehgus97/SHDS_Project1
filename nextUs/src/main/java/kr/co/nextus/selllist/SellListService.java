package kr.co.nextus.selllist;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;



public interface SellListService {
	Map<String, Object> list(SellListVO vo);
	
	Map<String, Object> catelist(SellListVO vo);

	
	List<SellListVO> relation(SellListVO vo);
	
	String categoryname(int categoryno);
	
	SellListVO detail(SellListVO vo);
	
	public void insertSellList(SellListVO sellListVO, MultipartFile file, HttpServletRequest request);
	
	// void registerCategory(CategoryVO categoryVO);
	// void registerOption(SellListVO sellListVO);
	
	//관리자
	List<SellListVO> all(SellListVO vo);
	Map index(SellListVO vo);
	
	//조회수순으로 정렬 
	List<SellListVO> listByViews(SellListVO vo);
			
	//조회수 증가 
	void increaseViewCount(int sellno);
	
	boolean deleteSelllist(int sellno);
}
