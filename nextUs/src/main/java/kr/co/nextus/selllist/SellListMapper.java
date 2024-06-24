package kr.co.nextus.selllist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.category.CategoryVO;

@Mapper
public interface SellListMapper {
	SellListVO detail(SellListVO vo);
    
	// 판매글 등록
	void insertSellList(SellListVO sellListVO);
	//void registerCategory(CategoryVO categoryVO);
	//void registerOption(SellListVO sellListVO);
    
    List<SellListVO> list(SellListVO vo);
    
    //관리자
    int count(SellListVO param);
	List<SellListVO> all(SellListVO vo);
	List<SellListVO> list2(SellListVO vo);


	boolean delete(int sellno);
}
