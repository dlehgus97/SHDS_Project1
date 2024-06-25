package sellerrank.copy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.category.CategoryVO;



@Service
public class SellListServiceImpl implements SellListService {
	
	@Autowired
	private SellListMapper mapper;

	@Override
	public Map<String, Object> list(SellListVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<SellListVO> list = mapper.list(param); // 목록
        
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);
        map.put("categoryno", param.getCategoryno());
        map.put("categoryname", param.getCategoryname());
        System.out.println(param.getCategoryname());
        System.out.println(param.getCategoryno());
        
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
	public String categoryname(int categoryno) {
		String categoryname = mapper.categoryname(categoryno);
		return categoryname;
	}
	
	@Override
	public SellListVO detail(SellListVO vo) {
		SellListVO data = mapper.detail(vo);
		return data;
	}
	// 판매글 등록 - 셀러, 제목, 내용 등
	@Override
    public void insertSellList(SellListVO sellListVO) {
        mapper.insertSellList(sellListVO);
    }
	/*
	// 판매글 등록 - 카테고리
	@Override
	public void registerCategory(CategoryVO categoryVO) {
		mapper.registerCategory(categoryVO);
	}
	// 판매글 등록 - 옵션
    @Override
    public void registerOption(SellListVO sellListVO) {
        mapper.registerOption(sellListVO);
    }
	*/
	
	//관리자
	@Override
	public List<SellListVO> all(SellListVO vo) {
		return mapper.all(vo);
	}

	@Override
	public Map index(SellListVO vo) {
		int totalCount = mapper.count(vo); // 총 게시물 수
		// 총 페이지 수
		int totalPage = totalCount / 10;
		if (totalCount % 10 > 0) totalPage++;
		
		// 시작인덱스
		int startIdx = (vo.getPage() - 1) * 10;
		
		//vo.getPage()가 0이라서 -10부터 검색되는걸 막아봤는데 맞는지는모름
		if(startIdx<0)startIdx=0;
		
		vo.setStartIdx(startIdx); // sql문에 파라미터로 넣어줌
		List<SellListVO> list = mapper.list2(vo); // 목록
		
		
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
	public boolean deleteSelllist(int sellno) {		
		boolean result = mapper.delete(sellno);	
		return result;	
	}		
			

}
