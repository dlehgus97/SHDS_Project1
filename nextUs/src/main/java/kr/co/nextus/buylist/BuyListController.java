package kr.co.nextus.buylist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;

@Controller
public class BuyListController {

	
	
	@Autowired
	private BuyListService service;
	
	@Autowired
	private SellerRequestService SRservice;

	
	@RequestMapping("/sellerSettlement")
	public String sellerSettlement(BuyListVO vo,SellerRequestVO vo2,Model model) {
		model.addAttribute("map", service.list(vo));
		model.addAttribute("sellerRequestMap", SRservice.list(vo2));
		return "admin/adjustManagement/sellerSettlement";
	}
	
}
