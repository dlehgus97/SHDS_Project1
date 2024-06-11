package kr.co.nextus.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponMapper mapper;

	
	//관리자페이지에서 동작
	//쿠폰 리스트 출력
	@Override
	public Map index(CouponVO vo) {
		int totalCount = mapper.count(vo); // 총 게시물 수
		// 총 페이지 수
		int totalPage = totalCount / 10;
		if (totalCount % 10 > 0) totalPage++;
		
		// 시작인덱스
		int startIdx = (vo.getPage() - 1) * 10;
		
		//vo.getPage()가 0이라서 -10부터 검색되는걸 막아봤는데 맞는지는모름
		if(startIdx<0)startIdx=0;
		
		vo.setStartIdx(startIdx); // sql문에 파라미터로 넣어줌
		System.out.println(1.5);
		List<CouponVO> list = mapper.list(vo); // 목록
		
		
		// 페이징처리
		int endPage = (int)(Math.ceil(vo.getPage()/10.0) * 10); // 끝페이지
		int startPage = endPage - 9; // 시작페이지
		
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true : false;
				
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("list", list); // 모델에 직접 넣어줘도 됨
		
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next );
		
		return map;
	}


	@Override
	public boolean create(CouponVO vo) {
		return mapper.create(vo) == 0 ? false : true;
	}



}
