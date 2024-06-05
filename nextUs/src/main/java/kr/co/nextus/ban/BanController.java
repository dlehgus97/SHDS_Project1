package kr.co.nextus.ban;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class BanController {
	
	@Autowired
	private BanService service;
	
	@GetMapping("/banMember.do")
	public String banMember(Model model, BanVO vo) {
		boolean r = service.add(vo);
		if (r == false) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
}
