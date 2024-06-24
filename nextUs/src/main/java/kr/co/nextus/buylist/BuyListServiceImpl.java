package kr.co.nextus.buylist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class BuyListServiceImpl implements BuyListService {

	@Autowired
	private BuyListMapper mapper;
	
	@Override
	public Map<String, Object> list(BuyListVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<BuyListVO> list = mapper.list(param); // 목록
        
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);
        
        // 하단에 페이징처리
        int endPage = (int)(Math.ceil(param.getPage()/10.0)*10);
        int startPage = endPage - 9;
        if (endPage > totalPage) endPage = totalPage;
        boolean isPrev = startPage > 1;
        boolean isNext = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("isPrev", isPrev);
		map.put("isNext", isNext);
		return map;
	}

	@Override
	public boolean settle(int buyno) {
		boolean result = mapper.settle(buyno);
		return result;
	}

	
	@Override
	public int settleNEW(BuyListVO vo) {
		int Countsettle = mapper.Countsettle(vo);
		return Countsettle;
	}

	@Override
	public int refundNEW(BuyListVO vo) {
		int Countrefund = mapper.Countrefund(vo);
		return Countrefund;
	}

	
	@Override
	public void insert(List<BuyListVO> vos) {
		mapper.insert(vos);
	}
	
	//adminMain
	@Override
	public Map<String, Object> seven_days_sales(BuyListVO vo) {
		List<BuyListVO> list = mapper.seven_days_sales(vo);
		List<BuyListVO> MVP = mapper.MVP(vo);
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("seven_days_sales", list);
		map.put("total_sales",  mapper.total_sales(vo));
		map.put("today_sales",  mapper.today_sales(vo));
		map.put("MVP", MVP);
		return map;
	}


}
