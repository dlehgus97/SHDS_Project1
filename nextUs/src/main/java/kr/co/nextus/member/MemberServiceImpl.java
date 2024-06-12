package kr.co.nextus.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public boolean regist(MemberVO vo) {
		
		return mapper.regist(vo) == 0 ? false : true;
	}

	@Override
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return mapper.login(vo);
	}
	
	@Override
	public MemberVO detail(MemberVO vo) {
		return mapper.detail(vo);
	}

	@Override
	public int update(MemberVO vo) {
		return mapper.update(vo);
	}
	
	
	
	//관리자
	@Override
	public Map list(MemberVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<MemberVO> list = mapper.list(param); // 목록
        
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
	
	//10개씩 출력하는게 아니라 한번에 쫘르륵 하게하는거임요ㅋ
	@Override
	public Map listAtOnce(MemberVO param) {

		List<MemberVO> list = mapper.listAtOnce(param);

		Map<String, Object> map = new HashMap<>();

		map.put("list", list);

		
		return map;
	}

}
