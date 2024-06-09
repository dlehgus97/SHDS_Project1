package kr.co.nextus.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.member.MemberVO;

@Controller
public class FAQController {

	@Autowired
	private FAQService service;
	
	@GetMapping("/faq/index.do")
	public String index(Model model, FAQVO vo) {
		model.addAttribute("map", service.list(vo));
		return "faq/index";
	}
	
	@GetMapping("/faq/write.do")
	public String write() {
		return "faq/write";
	}
	
	@PostMapping("/faq/insert.do")
	public String insert(Model model, HttpServletRequest request, FAQVO vo) {
		HttpSession sess = request.getSession();
		MemberVO login = (MemberVO)sess.getAttribute("login");
		int r = service.insert(vo, request);
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
	
	@GetMapping("/faq/view.do")
	public String view(Model model, FAQVO vo) {
		model.addAttribute("vo", service.detail(vo, true));
		return "faq/view";
	}
	@GetMapping("/faq/edit.do")
	public String edit(Model model, FAQVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "faq/edit";
	}
	@PostMapping("/faq/update.do")
	public String update(Model model, HttpServletRequest request, FAQVO vo, MultipartFile file) {
		int r = service.update(vo, request);
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

	@GetMapping("/faq/delete.do")
	public String delete(Model model, HttpServletRequest request, FAQVO vo) {
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
}
