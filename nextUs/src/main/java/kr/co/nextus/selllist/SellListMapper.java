package kr.co.nextus.selllist;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.category.CategoryVO;

@Mapper
public interface SellListMapper {
	SellListVO detail(SellListVO vo);
    
	// 판매글 등록
	void insertSellList(SellListVO sellListVO);
	void insertSellListCategory(SellListVO sellListVO);
	void insertBronze(SellListVO sellListVO);
	void insertSilver(SellListVO sellListVO);
	void insertGold(SellListVO sellListVO);
    
    List<SellListVO> list(SellListVO vo);
    
    //관리자
    int count(SellListVO param);
	List<SellListVO> all(SellListVO vo);
	List<SellListVO> list2(SellListVO vo);


	boolean delete(int sellno);
}


