package kr.co.nextus.mypage.refund;


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
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;

@Controller
public class RefundController {

	@Autowired
	private RefundService service;
	@Autowired
	private SellerRequestService SRservice;
	@Autowired
	private BuyListService BLservice;

	@PostMapping("/refund/insert.do")
	public String insert(Model model, HttpServletRequest request, RefundVO vo) {

		int r = service.insert(vo, request);
		int n = service.update(vo);
		if (r > 0 && n > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "환불 신청이 완료되었습니다.");
			model.addAttribute("url", "/mypage/orderlist.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}

	@GetMapping("/refundRequest")
	@RequestMapping("/refundRequest")
	public String couponManagement(RefundVO vo, SellerRequestVO vo2, BuyListVO vo3, Model model,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("refundRequstMap", service.list(vo));
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));
			return "admin/refundManagement/refundRequest";
		}else {
			return "common/403";
		}

		
	}

	@RequestMapping("/refundReceipt")
	public String refundReceipt(RefundVO vo, Model model, @RequestParam("no") int no) {
		model.addAttribute("map", service.list(vo, no));
		return "admin/refundManagement/refundReceipt";
	}

	// 환불하기
	@PostMapping("/refund.do")
	public String refund(Model model,RefundVO vo,HttpServletRequest request,
						@RequestParam("buyno") int buyno,
	                    @RequestParam("refundno") int refundno,
	                    @RequestParam("reply") String reply) {

		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			vo.setBuyno(buyno);
		    vo.setRefundno(refundno);
		    vo.setReply(reply);

			model.addAttribute("refund",service.refund(vo));
			model.addAttribute("msg", "환불 완료!");
			return "common/alertThenClose";
		}else {
			return "common/403";
		}

	    
	    
	}
	
	
	//환불상세보기
	@RequestMapping("/refundDetailPopup")
	public String refundDetailPopup(RefundVO vo,Model model,@RequestParam("no") int no,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("map", service.list(vo,no));
			return "admin/refundManagement/refundDetailPopup";
		}else {
			return "common/403";
		}

		
	}

}
