package kr.co.nextus.admin;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {

	
	
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "adminMain";
	}
	@RequestMapping("/sellerSettlement")
	public String sellerSettlement() {
		return "admin/sellerSettlement";
	}
	@RequestMapping("/memberStatus.do")
	public String memberStatus() {
		return "admin/memberStatus";
	}
	@RequestMapping("/memberBanManagement.do")
	public String memberBanManagement() {
		return "admin/memberBanManagement";
	}
	@RequestMapping("/addBanPopup.do")
	public String addBanPopup() {
		return "admin/addBanPopup";
	}
	
	
	
	
	
	
	
	
}
