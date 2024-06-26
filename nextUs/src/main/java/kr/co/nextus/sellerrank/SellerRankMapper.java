package kr.co.nextus.sellerrank;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.category.CategoryVO;

@Mapper
public interface SellerRankMapper {
	List<SellerRankVO> list1(SellerRankVO vo);
	List<SellerRankVO> list2(SellerRankVO vo);
	List<SellerRankVO> list3(SellerRankVO vo);
	List<SellerRankVO> list4(SellerRankVO vo);

}
