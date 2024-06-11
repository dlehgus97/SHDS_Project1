package kr.co.nextus.selllist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellListMapper {
    List<SellListVO> list(SellListVO vo);
    SellListVO detail(int no);
}
