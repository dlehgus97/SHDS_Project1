package kr.co.nextus.selllist;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.category.CategoryVO;

@Mapper
public interface SellListMapper {
	SellListVO detail(SellListVO vo);
    String categoryname(int categoryno);
	
	// 판매글 등록
	void insertSellList(SellListVO sellListVO);
	void insertSellListCategory(SellListVO sellListVO);
	void insertBronze(SellListVO sellListVO);
	void insertSilver(SellListVO sellListVO);
	void insertGold(SellListVO sellListVO);
    
    List<SellListVO> list(SellListVO vo);
    List<SellListVO> relation(SellListVO vo);
    
    //관리자
    int count(SellListVO param);
	List<SellListVO> all(SellListVO vo);
	List<SellListVO> list2(SellListVO vo);
	
	//조회수 순으로 정렬 
	List<SellListVO> listByViews(SellListVO vo); // 추가된 메소드
			
	//조회수 증가 
	void increaseViewCount(@Param("sellno") int sellno);


	boolean delete(int sellno);
}


