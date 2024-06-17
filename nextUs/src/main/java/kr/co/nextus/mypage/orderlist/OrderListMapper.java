package kr.co.nextus.mypage.orderlist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderListMapper {
    
    List<OrderListVO> list(OrderListVO vo);
    
    int count(OrderListVO vo);
    
    int update(OrderListVO vo);
    
}
