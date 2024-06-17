package kr.co.nextus.sellerrequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.nextus.member.MemberMapper;
import kr.co.nextus.seller.SellerMapper;




@Service
public class SellerRequestServiceImpl implements SellerRequestService {

	@Autowired
	private SellerRequestMapper mapper;
	@Autowired
	private SellerMapper sellerMapper;
	@Autowired
	private MemberMapper MemberMapper;

	
	//관리자페이지에서 동작
	// 리스트 출력
	@Override
	public Map list(SellerRequestVO param) {

		int count = mapper.count(param); // 총개수

        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<SellerRequestVO> list = mapper.list(param); // 목록
        
        int countUnapproved = mapper.countUnapproved(param);
       
        Map<String, Object> map = new HashMap<>();
        map.put("countUnapproved",countUnapproved);
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
	public Map<String, Object> list(SellerRequestVO param, int no) {
		param.setNo(no);
        List<SellerRequestVO> list = mapper.detail(param); // 목록
        
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        

		return map;
	}


	@Override
	@Transactional
	public int approve(SellerRequestVO vo, int memberno) {
		int result = 0;
		vo.setNo(memberno);

		  try {
		        result += mapper.approve(vo);
		        System.out.println("AAA"+"1");
		        result += sellerMapper.insertSellerByAdmin(vo);
		        System.out.println("AAA"+"2");
		        result += MemberMapper.sellerRegist(memberno);
		        System.out.println("AAA"+"3");

		    } catch (Exception e) {
		        // 예외 처리 로직
		        e.printStackTrace(); // 예외 상황 로깅 등
		        result = 0; // 예외 발생 시 결과 초기화 또는 특정 값으로 설정
		    }
		  System.out.println(result);
		  return result;
	}
	
	@Override
	public boolean deny(SellerRequestVO vo, int no) {
		boolean result = false;
		vo.setNo(no);
		result = mapper.deny(vo);
		return result;
	}




}
