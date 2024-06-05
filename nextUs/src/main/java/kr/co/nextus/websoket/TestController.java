package kr.co.nextus.websoket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/chat")
	public String chat() {
		return "chat";
	}
}
