package kr.co.nextus.mypage.refund;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;

@Controller
public class RefundController {

	@Autowired
	private RefundService service;
	@Autowired
	private SellerRequestService SRservice;

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
	public String couponManagement(RefundVO vo, SellerRequestVO vo2, Model model) {
		model.addAttribute("refundRequstMap", service.list(vo));
		model.addAttribute("sellerRequestMap", SRservice.list(vo2));
		return "admin/refundManagement/refundRequest";
	}

	@RequestMapping("/refundReceipt")
	public String refundReceipt(RefundVO vo, Model model, @RequestParam("no") int no) {
		model.addAttribute("map", service.list(vo, no));
		return "admin/refundManagement/refundReceipt";
	}

}
