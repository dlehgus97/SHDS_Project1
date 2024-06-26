package kr.co.nextus.sellerrank;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.category.CategoryVO;



@Service
public class SellerRankServiceImpl implements SellerRankService {
	
	@Autowired
	private SellerRankMapper mapper;

	@Override
	public List<SellerRankVO> list1(SellerRankVO vo) {

        return mapper.list1(vo); // 목록
	}
	
	@Override
	public List<SellerRankVO> list2(SellerRankVO vo) {

        return mapper.list2(vo); // 목록
	}
	
	@Override
	public List<SellerRankVO> list3(SellerRankVO vo) {

        return mapper.list3(vo); // 목록
	}
	
	@Override
	public List<SellerRankVO> list4(SellerRankVO vo) {

        return mapper.list4(vo); // 목록
	}
}
