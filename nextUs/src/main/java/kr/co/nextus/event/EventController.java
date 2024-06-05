package kr.co.nextus.event;

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
public class EventController {

	@Autowired
	private EventService service;
	
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
}
