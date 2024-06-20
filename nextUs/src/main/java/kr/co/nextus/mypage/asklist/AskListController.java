package kr.co.nextus.mypage.asklist;

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
public class AskListController {

	@Autowired
	private AskListService service;
	
	@GetMapping("/mypage/asklist.do")
	public String index(Model model, AskListVO vo, HttpSession sess) {
		MemberVO login = (MemberVO)sess.getAttribute("login");
		vo.setWriter(login.getNo());
		model.addAttribute("asklist", service.list(vo));
		return "/mypage/asklist";
	}
	
//	@GetMapping("/qna/write.do")
//	public String write() {
//		return "qna/write";
//	}
//	
//	@PostMapping("/qna/insert.do")
//	public String insert(Model model, HttpServletRequest request, AskListVO vo) {
//		HttpSession sess = request.getSession();
//		MemberVO login = (MemberVO)sess.getAttribute("login");
//		vo.setWriter(login.getNo());
//		int r = service.insert(vo, request);
//		if (r > 0) {
//			model.addAttribute("cmd", "move");
//			model.addAttribute("msg", "정상적으로 저장되었습니다.");
//			model.addAttribute("url", "index.do");
//		} else {
//			model.addAttribute("cmd", "back");
//			model.addAttribute("msg", "등록 오류");
//		}
//		return "common/alert";
//	}
//	
//	@GetMapping("/qna/view.do")
//	public String view(Model model, AskListVO vo) {
//		model.addAttribute("vo", service.detail(vo, true));
//		return "qna/view";
//	}
//	@GetMapping("/qna/edit.do")
//	public String edit(Model model, AskListVO vo) {
//		model.addAttribute("vo", service.detail(vo, false));
//		return "qna/edit";
//	}
//	@PostMapping("/qna/update.do")
//	public String update(Model model, HttpServletRequest request, AskListVO vo, MultipartFile file) {
//		int r = service.update(vo, request);
//		if (r > 0) {
//			model.addAttribute("cmd", "move");
//			model.addAttribute("msg", "정상적으로 수정되었습니다.");
//			model.addAttribute("url", "index.do");
//		} else {
//			model.addAttribute("cmd", "back");
//			model.addAttribute("msg", "등록 오류");
//		}
//		return "common/alert";
//	}
//	@GetMapping("/qna/reply.do")
//	public String reply(Model model, AskListVO vo) {
//		model.addAttribute("vo", service.detail(vo, false));
//		return "qna/reply";
//	}
//	@PostMapping("/qna/reply.do")
//	public String replyProcess(Model model, HttpServletRequest request, AskListVO vo) {
//		HttpSession sess = request.getSession();
//		MemberVO login = (MemberVO)sess.getAttribute("login");
//		vo.setWriter(login.getNo());
//		int r = service.reply(vo, request);
//		if (r > 0) {
//			model.addAttribute("cmd", "move");
//			model.addAttribute("msg", "정상적으로 등록되었습니다.");
//			model.addAttribute("url", "index.do");
//		} else {
//			model.addAttribute("cmd", "back");
//			model.addAttribute("msg", "등록 오류");
//		}
//		return "common/alert";
//	}
//	@GetMapping("/qna/delete.do")
//	public String delete(Model model, HttpServletRequest request, AskListVO vo) {
//		int r = service.delete(vo, request);
//		if (r > 0) {
//			model.addAttribute("cmd", "move");
//			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
//			model.addAttribute("url", "index.do");
//		} else {
//			model.addAttribute("cmd", "back");
//			model.addAttribute("msg", "등록 오류");
//		}
//		return "common/alert";
//	}
}
