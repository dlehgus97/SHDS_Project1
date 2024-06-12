package kr.co.nextus.selllist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SellListController {

	@Autowired
	private SellListService service;
	
	@GetMapping("/selllist/view.do")
	public String detail(Model model, @RequestParam("no") int no) {
		SellListVO detail = service.detail(no);
		model.addAttribute("vo", detail);
		return "/selllist/view";
	}
	
	
	//관리자
	@GetMapping("/productManagement.do")
	public String List(SellListVO vo, Model model) {
		model.addAttribute("selllist", service.index(vo));
		return "admin/productManagement";
	}
	@RequestMapping("/productManagement")
	public String productManagement(SellListVO vo, Model model) {
		System.out.println(1);
		model.addAttribute("selllist", service.index(vo));
		System.out.println(2);
		return "admin/productManagement";
	}
	
}
