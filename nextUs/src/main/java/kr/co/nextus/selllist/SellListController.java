package kr.co.nextus.selllist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SellListController {

	@Autowired
	private SellListService service;
	
	@GetMapping("/selllist/index.do")
	public String index(Model model, SellListVO vo) {
		List<SellListVO> list = service.list(vo);
		model.addAttribute("list", list);
		return "selllist/index";
	}
	
	@GetMapping("/selllist/view.do")
	public String detail(Model model, @RequestParam("no") int no) {
		SellListVO detail = service.detail(no);
		model.addAttribute("vo", detail);
		return "/selllist/view";
	}
}
