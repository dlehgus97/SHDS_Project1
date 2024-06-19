package kr.co.nextus.ban;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;



@Controller
public class BanController {
	
	@Autowired
	private BanService service;
	@Autowired
	private SellerRequestService SRservice;
	
	@PostMapping("/BAN0.do")
	public String BAN0(BanVO vo,Model model, @RequestParam List<Integer> membernos) {
		model.addAttribute("ban", service.add(vo,membernos));
		
		model.addAttribute("msg", "제재 성공");
		model.addAttribute("url", "/addBanPopupMember");
		return "common/alert";
	}
	
	@PostMapping("/BAN1.do")
	public String BAN1(BanVO vo,Model model, @RequestParam List<Integer> membernos) {
		model.addAttribute("ban", service.add(vo,membernos));
		
		model.addAttribute("msg", "제재 성공");
		model.addAttribute("url", "/addBanPopupSeller");
		return "common/alert";
	}
	
	@GetMapping("/memberBanManagement.do")
	@RequestMapping("/memberBanManagement")
	public String memberBanManagement(BanVO vo,SellerRequestVO vo2, Model model) {
		model.addAttribute("map", service.list(vo,0));
		model.addAttribute("sellerRequestMap", SRservice.list(vo2));
		return "admin/memberManagement/memberBanManagement";
	}
	
	@GetMapping("/sellerBanManagement.do")
	@RequestMapping("/sellerBanManagement")
	public String sellerBanManagement(BanVO vo,SellerRequestVO vo2, Model model) {
		model.addAttribute("map", service.list(vo,1));
		model.addAttribute("sellerRequestMap", SRservice.list(vo2));
		return "admin/sellerManagement/sellerBanManagement";
	}
}
