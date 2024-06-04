package kr.co.nextus.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {

	@RequestMapping("/adminMain")
	public String adminMain(Model model) {
		return "adminMain";
	}
	@RequestMapping("/sellerSettlement")
	public String sellerSettlement(Model model) {
		return "admin/sellerSettlement";
	}
	@RequestMapping("/memberStatus.do")
	public String memberStatus(Model model) {
		return "admin/memberStatus";
	}
	
}
