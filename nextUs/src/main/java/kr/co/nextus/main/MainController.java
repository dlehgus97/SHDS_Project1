package kr.co.nextus.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nextus.category.CategoryService;
import kr.co.nextus.category.CategoryVO;
import kr.co.nextus.event.EventService;
import kr.co.nextus.sellerrank.SellerRankService;
import kr.co.nextus.sellerrank.SellerRankVO;
import kr.co.nextus.selllist.SellListService;
import kr.co.nextus.selllist.SellListVO;

@Controller
public class MainController {
	//배너 띄우는 서비스
	@Autowired
	private EventService eventService;
	//판매글 목록 띄우는 서비스
	@Autowired
	private SellListService sellListService;
	
	@Autowired
	private CategoryService categoryService;
	//판매자 순위
	@Autowired
	private SellerRankService sellerRankService;
	
	@GetMapping({"/index.do","/"})
	public String index(Model model, SellListVO vo, CategoryVO catevo, SellerRankVO sellerrankvo) {
		model.addAttribute("mainBanner", eventService.mainBanner());
		List<CategoryVO> catelist = categoryService.list(catevo);
		List<SellerRankVO> sellerranklist = sellerRankService.list(sellerrankvo);
		
	    // view_cnt 기준 정렬 데이터
	    SellListVO popularVo = new SellListVO();
	    popularVo.setValue(0);
	    popularVo.setOrder("view_cnt");
	    Map<String, Object> popularList = sellListService.list(popularVo);
	    
	    // postdate 기준 정렬 데이터
	    SellListVO recentVo = new SellListVO();
	    recentVo.setValue(0);
	    recentVo.setOrder("postdate");
	    Map<String, Object> recentList = sellListService.list(recentVo);
		
	    model.addAttribute("cate", catelist);
	    model.addAttribute("rank", sellerranklist);
	    model.addAttribute("popularList", popularList.get("list")); // view_cnt 기준 리스트 추가
	    model.addAttribute("recentList", recentList.get("list")); // postdate 기준 리스트 추가
		return "index";
	}
	//신규등록순
	@PostMapping("/index1.do")
	@ResponseBody
	public Map<String, Object> index(Model model, SellListVO vo, @RequestParam("value") int value) {
		vo.setNested(value);
		vo.setDepth(1);
		vo.setOrder("postdate");
		vo.setValue(value);
		Map<String, Object> list = sellListService.list(vo);
	    model.addAttribute("list", list);
		
		
		return list;
	}
	//인기순
	@PostMapping("/index2.do")
	@ResponseBody
	public Map<String, Object> index2(Model model, SellListVO vo, @RequestParam("value") int value) {
		vo.setNested(value);
		vo.setDepth(1);
		vo.setOrder("view_cnt");
		vo.setValue(value);
		Map<String, Object> list = sellListService.list(vo);
	    model.addAttribute("list", list);
		
		
		return list;
	}
}
