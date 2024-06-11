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
	
	@RequestMapping("/memberBanManagement")
	public String memberBanManagement() {
		return "admin/memberBanManagement";
	}
	@RequestMapping("/addBanPopup")
	public String addBanPopup() {
		return "admin/addBanPopup";
	}
	@RequestMapping("/saleStatement")
	public String saleStatement() {
		return "admin/saleStatement";
	}
	@RequestMapping("/sellerRegistManagement")
	public String sellerRegistManagement() {
		return "admin/sellerRegistManagement";
	}
	@RequestMapping("/sellerBanManagement")
	public String sellerBanManagement() {
		return "admin/sellerBanManagement";
	}
	@RequestMapping("/couponManagement")
	public String couponManagement() {
		return "admin/couponManagement";
	}
	@RequestMapping("/giveCoupon")
	public String giveCoupon() {
		return "admin/giveCoupon";
	}
	
	@RequestMapping("/productManagement")
	public String productManagement() {
		return "admin/productManagement";
	}
	@RequestMapping("/refundRequest")
	public String refundRequest() {
		return "admin/refundRequest";
	}
	
	
	@RequestMapping("/notice")
	public String notice() {
		return "admin/notice";
	}
	@RequestMapping("/QnA")
	public String QnA() {
		return "admin/QnA";
	}
	@RequestMapping("/FaQ")
	public String FaQ() {
		return "admin//FaQ";
	}
	@RequestMapping("/event")
	public String event() {
		return "admin/event";
	}
	
	
	@RequestMapping("/report")
	public String report() {
		return "admin/report";
	}
	
	
	
}
