package kr.co.nextus.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nextus.event.EventService;
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
	
	@GetMapping("/index.do")
	public String index(Model model, SellListVO vo) {
		model.addAttribute("mainBanner", eventService.mainBanner());
		List<SellListVO> list = sellListService.list(vo);
		model.addAttribute("list", list);
		return "index";
	}
}
