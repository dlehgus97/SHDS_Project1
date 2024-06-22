package kr.co.nextus.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper; // MemberMapper 주입

    @Override
    public boolean regist(MemberVO vo) {
        return mapper.regist(vo) == 1; // 가입 성공 여부 반환
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

    @Override
    public MemberVO findId(MemberVO vo) {
    	return mapper.findId(vo);
         // 결과가 null이 아니면 true 반환
    }

    @Override
    public MemberVO findByEmail(String email) {
        return mapper.findByEmail(email);
    }

    @Override
    public boolean checkMemberExist(String email) {
        // 실제 데이터베이스에서 회원을 조회하여 존재하는지 확인
        // 예시로 직접 구현한 메서드 호출
        return mapper.findByEmail(email)==null ? false : true;
    } 
    
    public boolean insertMember(MemberVO vo) {
        try {
        	mapper.insertMember(vo);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
	@Override
	public int sellerRegist(int no) {
		mapper.sellerRegist(no);
		return 1;
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

	//제재내역추가할때 누적신고횟수 보여주는놈
	@Override
	public Map<String, Object> reportCountList(MemberVO param,int isSeller) {
		List<MemberVO> list;
		if(isSeller==0) {
			list=mapper.memberReportCountList(param);
		}else {
			list=mapper.sellerReportCountList(param);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}

    @Override
    public void updatePassword(String email, String newPassword) {
    	Map<String, String> map = new HashMap<>();
    	map.put("pwd", newPassword);
    	map.put("email", email);
        mapper.updatePassword(map);
    }
	
}
