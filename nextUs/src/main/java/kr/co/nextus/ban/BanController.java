package kr.co.nextus.ban;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class BanController {
	
	@Autowired
	private BanService service;
	
	
	@PostMapping("/BAN.do")
	public String BAN(BanVO vo,Model model, @RequestParam List<Integer> membernos) {
		model.addAttribute("ban", service.add(vo,membernos));
		
		model.addAttribute("msg", "제재 성공");
		model.addAttribute("url", "/addBanPopup");
		return "common/alert";
	}
	
	@GetMapping("/memberBanManagement")
	@RequestMapping("/memberBanManagement")
	public String memberBanManagement(BanVO vo, Model model) {
		model.addAttribute("map", service.list(vo));
		return "admin/memberBanManagement";
	}
}
