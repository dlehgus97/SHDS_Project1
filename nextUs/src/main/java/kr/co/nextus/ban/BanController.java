package kr.co.nextus.ban;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nextus.buylist.BuyListService;
import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.report.ReportService;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;



@Controller
public class BanController {
	
	@Autowired
	private BanService service;
	@Autowired
	private ReportService RPservice;
	
	@Autowired
	private SellerRequestService SRservice;
	@Autowired
	private BuyListService BLservice;
	
	@PostMapping("/BAN0.do")
	public String BAN0(BanVO vo,Model model, @RequestParam List<Integer> membernos) {
		model.addAttribute("ban", service.add(vo,membernos));
		model.addAttribute("changeStatus",RPservice.changeStatus(membernos));
		
		model.addAttribute("msg", "제재 성공");
		model.addAttribute("url", "/addBanPopupMember");
		return "common/alert";
	}
	
	@PostMapping("/BAN1.do")
	public String BAN1(BanVO vo,Model model, @RequestParam List<Integer> membernos) {
		model.addAttribute("ban", service.add(vo,membernos));
		model.addAttribute("changeStatus",RPservice.changeStatus(membernos));
		
		model.addAttribute("msg", "제재 성공");
		model.addAttribute("url", "/addBanPopupSeller");
		return "common/alert";
	}
	
	@GetMapping("/memberBanManagement.do")
	@RequestMapping("/memberBanManagement")
	public String memberBanManagement(BanVO vo,SellerRequestVO vo2,BuyListVO vo3, Model model,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("map", service.list(vo,0));
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));
			return "admin/memberManagement/memberBanManagement";
		}else {
			return "common/403";
		}

		
		
	}
	
	@GetMapping("/sellerBanManagement.do")
	@RequestMapping("/sellerBanManagement")
	public String sellerBanManagement(BanVO vo,SellerRequestVO vo2,BuyListVO vo3, Model model,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("map", service.list(vo,1));
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));
			return "admin/sellerManagement/sellerBanManagement";
		}else {
			return "common/403";
		}

	}
	
	// 판매글삭제						
	@RequestMapping(value = "/banFree/{no}", method = RequestMethod.POST)
	@ResponseBody
	public String banFree(@PathVariable("no") int no) {
		try {
			service.banFree(no);
			return "success"; // 성공 시 success 문자열 반환
		} catch (Exception e) {
			return "error"; // 실패 시 error 문자열 반환
		}

	}
	
}
