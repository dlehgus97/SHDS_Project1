package kr.co.nextus.sellerrequest;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;




@Controller
public class SellerRequestController {

	@Autowired
	private SellerRequestService service;
	

	
	@GetMapping("/sellerRequestManagement")
	@RequestMapping("/sellerRequestManagement")
	public String sellerRequestManagement(SellerRequestVO vo, Model model) {
		model.addAttribute("sellerRequestMap", service.list(vo));
		return "admin/sellerManagement/sellerRequestManagement";
	}
	

	
	@RequestMapping("/sellerRequestPopup")
	public String sellerRequestPopup(SellerRequestVO vo,Model model,@RequestParam("no") int no) {
		model.addAttribute("map", service.list(vo,no));
		return "admin/sellerManagement/sellerRequestPopup";
	}
	
	
	
	@PostMapping("/requestApprove.do")
	public String requestApprove(SellerRequestVO vo,Model model,
									@RequestParam(name = "memberno")int memberno,
									@RequestParam(name = "bank")String bank,
									@RequestParam(name = "account")String account) {
		vo.setBank(bank);
		vo.setAccount(account);
		model.addAttribute("sellerRequest", service.approve(vo,memberno));
		
		model.addAttribute("msg", "승인 완료!");
		return "common/alertThenClose";
	}
	
	@PostMapping("/requestDeny.do")
	public String requestDeny(SellerRequestVO vo,Model model, @RequestParam(name = "memberno")int memberno) {
		model.addAttribute("sellerRequest", service.deny(vo,memberno));
		
		model.addAttribute("msg", "승인을 거부했습니다");
		return "common/alertThenClose";
	}
}
