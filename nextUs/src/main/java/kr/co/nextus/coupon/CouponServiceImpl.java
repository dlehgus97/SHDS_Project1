package kr.co.nextus.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.cart.CartVO;




@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponMapper mapper;

	
	//관리자페이지에서 동작
	//쿠폰 리스트 출력
	@Override
	public Map list(CouponVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<CouponVO> list = mapper.list(param); // 목록
        
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
	public boolean createCoupon(CouponVO vo,List<String> memberEmails) {
		int result=0;
		for(String m : memberEmails) {
			vo.setMemberEmail(m);
			result += mapper.createCoupon(vo);
		}
		return result == 0 ? false : true;
	}


	@Override
	public Map listAsName(CouponVO param,String name) {
		param.setName(name);
		List<CouponVO> list = mapper.listAsName(param);

		Map<String, Object> map = new HashMap<>();

		map.put("list", list);

		
		return map;
	}

	@Override
	public List<CouponVO> listToMember(int no) {
		return mapper.listToMember(no);
	}

}
