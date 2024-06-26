package kr.co.nextus.qna;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.buylist.BuyListService;
import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;

@Controller
public class QnAController {

	@Autowired
	private QnAService service;
	@Autowired
	private SellerRequestService SRservice;
	@Autowired
	private BuyListService BLservice;

	
	@GetMapping("/qna/index.do")
	public String index(Model model, QnAVO vo) {
		model.addAttribute("map", service.list(vo));
		return "qna/index";
	}
	
	@GetMapping("/qna/write.do")
	public String write() {
		return "qna/write";
	}
	
	@PostMapping("/qna/insert.do")
	public String insert(Model model, QnAVO vo, HttpSession sess, MemberVO memvo) {
		MemberVO login = (MemberVO) sess.getAttribute("login");
		vo.setWriter(login.getNo());
		int r = service.insert(vo);
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
	
	@GetMapping("/qna/view.do")
	public String view(Model model, QnAVO vo) {
		model.addAttribute("vo", service.detail(vo, true));
		return "qna/view";
	}
	@GetMapping("/qna/edit.do")
	public String edit(Model model, QnAVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "qna/edit";
	}
	@PostMapping("/qna/update.do")
	public String update(Model model, QnAVO vo, MultipartFile file) {
		int r = service.update(vo);
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
	@GetMapping("/qna/reply.do")
	public String reply(Model model, QnAVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "qna/reply";
	}
	@PostMapping("/qna/reply.do")
	public String replyProcess(Model model, QnAVO vo) {
		int r = service.reply(vo);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
	@GetMapping("/qna/delete.do")
	public String delete(Model model, QnAVO vo) {
		int r = service.delete(vo);
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
	
	//----------------------------------------관리자------------------------------------
	
	@GetMapping("/adqna/index.do")
	public String adindex(Model model, QnAVO vo,SellerRequestVO vo2, BuyListVO vo3,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("map", service.list(vo));
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));
			return "adqna/index";
		}else {
			return "common/403";
		}

		
	}
	
	
	@GetMapping("/adqna/view.do")
	public String adview(Model model, QnAVO vo,SellerRequestVO vo2, BuyListVO vo3,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("vo", service.detail(vo, true));
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));
			return "adqna/view";
		}else {
			return "common/403";
		}

		
	}

	@PostMapping("/adqna/answer.do")
	@ResponseBody
	public Map<String, Object> adanswer(@RequestParam("no") int no, @RequestParam("answer") String answer, Model model,
			SellerRequestVO vo2, BuyListVO vo3) {

		Map<String, Object> response = new HashMap<>();
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		Map<String, Object> result = service.answer(no, answer);
		if ((int) result.get("result") > 0) {
			response.put("status", "success");
			response.put("message", "정상적으로 등록되었습니다.");
			response.put("answer_date", result.get("answer_date")); // 답변 작성 시간 추가
		} else {
			response.put("status", "error");
			response.put("message", "등록 오류");
		}

		return response;

	}
	
	@PostMapping("/adqna/delete.do")
	public String addelete(Model model, @RequestParam("no") int no
			,SellerRequestVO vo2, BuyListVO vo3,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			int r = service.addelete(no);
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
		}else {
			return "common/403";
		}

		
	}
	
	
}
