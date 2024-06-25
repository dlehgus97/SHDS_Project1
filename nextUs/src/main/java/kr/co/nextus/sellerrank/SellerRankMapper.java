package kr.co.nextus.sellerrank;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.category.CategoryVO;

@Mapper
public interface SellerRankMapper {
	List<SellerRankVO> list(SellerRankVO vo);

}
