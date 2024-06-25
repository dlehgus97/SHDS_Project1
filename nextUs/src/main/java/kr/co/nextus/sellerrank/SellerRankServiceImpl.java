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
	public List<SellerRankVO> list(SellerRankVO vo) {

        return mapper.list(vo); // 목록
	}
}
