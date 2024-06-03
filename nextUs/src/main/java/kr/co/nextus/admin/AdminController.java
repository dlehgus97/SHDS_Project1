package kr.co.nextus.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AdminController {

	@GetMapping("/admin/adminMenu")
	public String login() {
		return "/admin/adminMenu";
	}
}
