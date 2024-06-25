package kr.co.nextus.report;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nextus.buylist.BuyListService;
import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;

@Controller
public class ReportController {

	@Autowired
	private ReportService service;
	@Autowired
	private SellerRequestService SRservice;
	@Autowired
	private BuyListService BLservice;




	@PostMapping("/report/insert.do")
	public String insert(Model model, HttpServletRequest request, ReportVO vo) {
		HttpSession sess = request.getSession();
		MemberVO login = (MemberVO) sess.getAttribute("login");
		int r = service.insert(vo, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/selllist/view.do?sellno=" + vo.getSellno());
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}

	@GetMapping("/report.do")
	@RequestMapping("/report")
	public String memberStatus(ReportVO vo,SellerRequestVO vo2,BuyListVO vo3, Model model) {
		model.addAttribute("map", service.list(vo));
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		return "admin/reports/report";
	}
	@RequestMapping("/reportDetailPopup")
	public String reportDetailPopup(ReportVO vo,Model model,@RequestParam("no") int no) {
		model.addAttribute("map", service.list(vo,no));
		return "admin/reports/reportDetailPopup";
	}

	
}
