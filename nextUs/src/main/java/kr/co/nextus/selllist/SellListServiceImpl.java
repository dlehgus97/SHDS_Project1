package kr.co.nextus.selllist;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public List<SellListVO> relation(SellListVO vo) {
		return mapper.relation(vo);
		
	}
	
	@Override
	public String categoryname(int categoryno) {
		String categoryname = mapper.categoryname(categoryno);
		return categoryname;
	}
	
	//조회수 증가 
		@Override
		public void increaseViewCount(int sellno) {
			 mapper.increaseViewCount(sellno);
			 }
		
	
		@Override
	    public SellListVO detail(SellListVO vo) {
	        SellListVO data = mapper.detail(vo);
	        if (data != null) {
	            // 판매 상품 조회 시 조회수 증가 처리
	            increaseViewCount(data.getSellno());
	        }
	        return data;
	    }
		
		@Override
	    public List<SellListVO> listByViews(SellListVO vo) {
	        return mapper.listByViews(vo); // 추가된 메소드 구현
	    }
		
	// 판매글 등록 - 셀러, 제목, 내용 등
	@Override
	public void insertSellList(SellListVO sellListVO, MultipartFile file, HttpServletRequest request) {
	    if (!file.isEmpty()) {
	        try {
	            // 파일명
	            String org = file.getOriginalFilename();
	            String ext = org.substring(org.lastIndexOf("."));
	            String real = System.currentTimeMillis() + ext;

	            // 파일 저장 경로 설정 (ServletContext를 이용하여 절대 경로 설정)
	            ServletContext servletContext = request.getServletContext();
	            String uploadPath = servletContext.getRealPath("/upload/thumbnail");
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdirs(); // 디렉토리가 없으면 생성
	            }

	            // 파일 저장
	            File dest = new File(uploadDir, real);
	            file.transferTo(dest);

	            // SellListVO에 파일 정보 설정
	            sellListVO.setThumbnail_org(org);
	            sellListVO.setThumbnail_real(real);
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new RuntimeException("File upload error: " + e.getMessage());
	        }
	    }

	    // SellListVO를 DB에 저장
	    mapper.insertSellList(sellListVO);
	    
	    int sellno = sellListVO.getSellno();
	    
	    // 카테고리 삽입
        sellListVO.setSellno(sellno); // sellno를 SellListVO에 설정
        mapper.insertSellListCategory(sellListVO);
        mapper.insertBronze(sellListVO);
        mapper.insertSilver(sellListVO);
        mapper.insertGold(sellListVO);
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
