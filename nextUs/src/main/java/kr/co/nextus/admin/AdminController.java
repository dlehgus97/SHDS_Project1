package kr.co.nextus.admin;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nextus.member.MemberVO;


@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "adminMain";
	}
	
	@RequestMapping("/sellerSettlement")
	public String sellerSettlement() {
		return "admin/adjustManagement/sellerSettlement";
	}
	@RequestMapping("/saleStatement")
	public String saleStatement() {
		return "admin/adjustManagement/saleStatement";
	}


	@RequestMapping("/refundRequest")
	public String refundRequest() {
		return "admin/refundManagement/refundRequest";
	}
	
	
	
	
	
	@GetMapping("/notice.do")  // 공지사항 조회
	public String notice(Model model) {
		List<AdminVO> list = service.Listview();
		model.addAttribute("list", list);
		return "admin/serviceCenter/notice";
	}
	
    @RequestMapping("/deleteNotice.do")
    public String deleteNotice(@RequestParam("no") int no) {
        service.deleteNotice(no);
        return ("redirect:/notice.do");
    }
    
    @RequestMapping("/register.do")
    public String registnotice() {
        return "admin/serviceCenter/insertnotice";
    }
    
    @RequestMapping("/insertnotice.do")
    public String insertnotice(@RequestParam("title") String title, @RequestParam("content") String content) {
        service.insertnotice(title, content);
    	return ("redirect:/notice.do");
    }
    
    
    
    
    
	
	@RequestMapping("/QnA")
	public String QnA() {
		return "admin/serviceCenter/QnA";
	}
	@RequestMapping("/FaQ")
	public String FaQ() {
		return "admin/serviceCenter/FaQ";
	}
	@RequestMapping("/event")
	public String event() {
		return "admin/serviceCenter/event";
	}
	
	
	
	
	
	
}
