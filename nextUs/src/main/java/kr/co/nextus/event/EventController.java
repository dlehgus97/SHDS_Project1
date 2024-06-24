package kr.co.nextus.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.buylist.BuyListService;
import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;

@Controller
public class EventController {

	@Autowired
	private EventService service;
	@Autowired
	private SellerRequestService SRservice;
	@Autowired
	private BuyListService BLservice;
	
	@GetMapping("/event/index.do")
	public String index(Model model, EventVO vo) {
		model.addAttribute("map", service.list(vo));
		return "event/index";
	}
	
	@GetMapping("/event/write.do")
	public String write() {
		return "event/write";
	}
	
	@PostMapping("/event/insert.do")
	public String insert(Model model, HttpServletRequest request, EventVO vo, MultipartFile file) {
		HttpSession sess = request.getSession();
		MemberVO login = (MemberVO)sess.getAttribute("login");
		int r = service.insert(vo, file, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
	
	@GetMapping("/event/view.do")
	public String view(Model model, EventVO vo) {
		model.addAttribute("vo", service.detail(vo, true));
		return "event/view";
	}
	@GetMapping("/event/edit.do")
	public String edit(Model model, EventVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "event/edit";
	}
	@PostMapping("/event/update.do")
	public String update(Model model, HttpServletRequest request, EventVO vo, MultipartFile file) {
		int r = service.update(vo, file, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}

	@GetMapping("/event/delete.do")
	public String delete(Model model, HttpServletRequest request, EventVO vo, MultipartFile file) {
		int r = service.delete(vo, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
	
	
	//-------------------------------------------------------관리자----------------------------------------------
	
	@GetMapping("/adevent/index.do")
	public String adindex(Model model, EventVO vo,SellerRequestVO vo2, BuyListVO vo3) {
		model.addAttribute("map", service.list(vo));
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		return "adevent/index";
	}
	
	@GetMapping("/adevent/write.do")
	public String adwrite(Model model,SellerRequestVO vo2, BuyListVO vo3) {
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		return "adevent/write";
	}
	
	@PostMapping("/adevent/insert.do")
	public String adinsert(Model model, HttpServletRequest request, EventVO vo, MultipartFile file
			,SellerRequestVO vo2, BuyListVO vo3) {
		HttpSession sess = request.getSession();
		MemberVO login = (MemberVO)sess.getAttribute("login");
		int r = service.insert(vo, file, request);
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
	
	@GetMapping("/adevent/view.do")
	public String adview(Model model, EventVO vo,SellerRequestVO vo2, BuyListVO vo3
) {
		model.addAttribute("vo", service.detail(vo, true));
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		return "adevent/view";
	}
	@GetMapping("/adevent/edit.do")
	public String adedit(Model model, EventVO vo,SellerRequestVO vo2, BuyListVO vo3
) {
		model.addAttribute("vo", service.detail(vo, false));
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		return "adevent/edit";
	}
	@PostMapping("/adevent/update.do")
	public String adupdate(Model model, HttpServletRequest request, EventVO vo, MultipartFile file
			,SellerRequestVO vo2, BuyListVO vo3) {
		int r = service.update(vo, file, request);
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}

	@GetMapping("/adevent/delete.do")
	public String addelete(Model model, HttpServletRequest request, EventVO vo, MultipartFile file
			,SellerRequestVO vo2, BuyListVO vo3) {
		int r = service.delete(vo, request);
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
}
