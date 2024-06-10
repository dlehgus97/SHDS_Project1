package kr.co.nextus.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.nextus.event.EventService;

@Controller
public class MainController {
	@Autowired
	private EventService eventService;
	
	@GetMapping("/index.do")
	public String index(Model model) {
		model.addAttribute("mainBanner", eventService.mainBanner());
		return "index";
	}
	
}
