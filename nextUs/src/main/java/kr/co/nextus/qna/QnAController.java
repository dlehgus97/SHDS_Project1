package kr.co.nextus.qna;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class QnAController {

	@Autowired
	private QnAService service;
	
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
	public String insert(Model model, QnAVO vo) {
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
	public String adindex(Model model, QnAVO vo) {
		model.addAttribute("map", service.list(vo));
		return "adqna/index";
	}
	
	
	@GetMapping("/adqna/view.do")
	public String adview(Model model, QnAVO vo) {
		model.addAttribute("vo", service.detail(vo, true));
		return "adqna/view";
	}

	@PostMapping("/adqna/answer.do")
	@ResponseBody
	public Map<String, Object> adanswer(@RequestParam("no") int no, @RequestParam("answer") String answer) {
	    Map<String, Object> response = new HashMap<>();
	    
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
	public String addelete(Model model, @RequestParam("no") int no) {
		int r = service.addelete(no);
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
