package kr.co.nextus.mypage.wishlist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WishListMapper {
    
    List<WishListVO> list(WishListVO vo);
    int delete(WishListVO vo);
    int count(WishListVO vo);
    int insert(WishListVO vo);
    
}
