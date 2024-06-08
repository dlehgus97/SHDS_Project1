package kr.co.nextus.notice;

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
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@GetMapping("/notice/index.do")
	public String index(Model model, NoticeVO vo) {
		model.addAttribute("map", service.list(vo));
		return "notice/index";
	}
	
	@GetMapping("/notice/write.do")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("/notice/insert.do")
	public String insert(Model model, HttpServletRequest request, NoticeVO vo) {
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
	
	@GetMapping("/notice/view.do")
	public String view(Model model, NoticeVO vo) {
		model.addAttribute("vo", service.detail(vo, true));
		return "notice/view";
	}
	@GetMapping("/notice/edit.do")
	public String edit(Model model, NoticeVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "notice/edit";
	}
	@PostMapping("/notice/update.do")
	public String update(Model model, HttpServletRequest request, NoticeVO vo, MultipartFile file) {
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

	@GetMapping("/notice/delete.do")
	public String delete(Model model, HttpServletRequest request, NoticeVO vo) {
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
