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
	

	
	@GetMapping("/sellerRegistManagement")
	@RequestMapping("/sellerRegistManagement")
	public String couponManagement(SellerRequestVO vo, Model model) {
		model.addAttribute("map", service.list(vo));
		return "admin/sellerRegistManagement";
	}
	
	
	
	
}
