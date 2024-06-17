package kr.co.nextus.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {

	
	
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "adminMain";
	}
	@RequestMapping("/adminMenu")
	public String adminMenu() {
		return "admin/adminMenu";
	}
	
	@RequestMapping("/sellerSettlement")
	public String sellerSettlement() {
		return "admin/adjustManagement/sellerSettlement";
	}
	@RequestMapping("/saleStatement")
	public String saleStatement() {
		return "admin/adjustManagement/saleStatement";
	}


	@RequestMapping("/refundRequest")
	public String refundRequest() {
		return "admin/refundManagement/refundRequest";
	}
	
	
	@RequestMapping("/notice")
	public String notice() {
		return "admin/serviceCenter/notice";
	}
	@RequestMapping("/QnA")
	public String QnA() {
		return "admin/serviceCenter/QnA";
	}
	@RequestMapping("/FaQ")
	public String FaQ() {
		return "admin/serviceCenter/FaQ";
	}
	@RequestMapping("/event")
	public String event() {
		return "admin/serviceCenter/event";
	}
	
	
	
	
	
	
}
