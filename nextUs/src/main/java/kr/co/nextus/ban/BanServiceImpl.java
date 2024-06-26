package kr.co.nextus.ban;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.member.MemberMapper;

@Service
public class BanServiceImpl implements BanService {

	@Autowired
	private BanMapper mapper;
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public Map<String, Object> list(BanVO param, int isSeller) {
		int count = 0;
		if(isSeller==0) {
			count = mapper.countMember(param); // 총개수
		}else {
			count = mapper.countSeller(param); // 총개수
		}
		System.out.println("AAA"+count);
		// 총페이지수
		int totalPage = count / 10;
		if (count % 10 > 0) totalPage++;
		List<BanVO> list;
		
		if(isSeller==0) {
			list = mapper.memberBanList(param); // 멤버밴목록
		}else {
			list = mapper.sellerBanList(param); // 샐러밴목록
		}

		Map<String, Object> map = new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("list", list);

		// 하단에 페이징처리
		int endPage = (int) (Math.ceil(param.getPage() / 10.0) * 10);
		int startPage = endPage - 9;
		if (endPage > totalPage)
			endPage = totalPage;
		boolean isPrev = startPage > 1;
		boolean isNext = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("isPrev", isPrev);
		map.put("isNext", isNext);
		return map;
	}

	@Override
	public boolean add(BanVO vo, List<Integer> membernos) {
		int result = 0;
		for (int m : membernos) {
			vo.setMemberno(m);
			result += mapper.add(vo);
			result += memberMapper.ban(m);
		}
		return result == 0 ? false : true;

	}

	@Override
	public boolean banFree(int no) {
		boolean result;
		System.out.println(33);
		boolean a =  memberMapper.banFree(no);
		System.out.println("CCC"+a);
		boolean b =  mapper.banFree(no);
		System.out.println("ddd"+b);
		result = a && b;
		return result;
	}
}
