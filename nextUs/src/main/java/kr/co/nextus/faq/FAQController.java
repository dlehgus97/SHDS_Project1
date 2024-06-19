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
	public String insert(Model model, FAQVO vo) {

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
	public String update(Model model, FAQVO vo) {
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

	@GetMapping("/faq/delete.do")
	public String delete(Model model, FAQVO vo) {
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
	
	//----------------------------관리자용----------------------------------------
	
	@GetMapping("/adfaq/index.do")
	public String aindex(Model model, FAQVO vo) {
		model.addAttribute("map", service.list(vo));
		return "adfaq/index";
	}
	
	@GetMapping("/adfaq/write.do")
	public String awrite() {
		return "adfaq/write";
	}
	
	@PostMapping("/adfaq/insert.do")
	public String ainsert(Model model, FAQVO vo) {
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
	
	@GetMapping("/adfaq/view.do")
	public String aview(Model model, FAQVO vo) {
		model.addAttribute("vo", service.detail(vo, true));
		return "adfaq/view";
	}
	@GetMapping("/adfaq/edit.do")
	public String aedit(Model model, FAQVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "adfaq/edit";
	}
	@PostMapping("/adfaq/update.do")
	public String aupdate(Model model, FAQVO vo) {
		int r = service.update(vo);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "수정 오류");
		}
		return "common/alert";
	}

	@GetMapping("/adfaq/delete.do")
	public String adelete(Model model, FAQVO vo) {
		System.out.println("FAQVO no: " + vo.getNo());
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "삭제 오류");
		}
		return "common/alert";
	}
	
}
