package kr.co.nextus.selllist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellListMapper {
    SellListVO detail(int no);
    
    
    List<SellListVO> list(SellListVO vo);
    
    //관리자
    int count(SellListVO param);
	List<SellListVO> all(SellListVO vo);
	List<SellListVO> list2(SellListVO vo);
}
