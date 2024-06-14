package kr.co.nextus.mypage.orderdetail;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDetailMapper {
    
    OrderDetailVO list(OrderDetailVO vo);
    
}
