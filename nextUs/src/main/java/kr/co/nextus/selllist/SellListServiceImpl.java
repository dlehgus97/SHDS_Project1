package kr.co.nextus.selllist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellListServiceImpl implements SellListService {
	
	@Autowired
	private SellListMapper mapper;

	@Override
	public List<SellListVO> list(SellListVO vo) {
		List<SellListVO> data = mapper.list(vo);
		return data;
	}
	
	@Override
	public SellListVO detail(int no) {
		SellListVO data = mapper.detail(no);
		return data;
	}

}
