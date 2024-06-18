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
import org.springframework.web.multipart.MultipartFile;

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
	public String index(Model model, AdminVO vo) {
		model.addAttribute("map", service.list(vo));
		return "admin/serviceCenter/notice";
	}
	
	@GetMapping("/notice/adview.do") // 클리하여 들어가보기
	public String view(Model model, AdminVO vo) {
		model.addAttribute("vo", service.detail(vo, true));
		return "admin/serviceCenter/adview";
	}
	
	@GetMapping("/notice/adedit.do")//editㄱㄱ
	public String edit(Model model, AdminVO vo) {
		model.addAttribute("vo", service.detail(vo, false));
		return "admin/serviceCenter/adedit";
	}
	
    @RequestMapping("/notice/deleteNotice.do") // 삭제하기 버튼 누를시
    public String deleteNotice(@RequestParam("no") int no) {
        service.deleteNotice(no);
        return ("redirect:/notice.do");
    }
    
    @RequestMapping("/notice/register.do") // 등록하기 폼에 넘어가기
    public String registnotice() {
        return "admin/serviceCenter/insertnotice";
    }
    
    @RequestMapping("/notice/insertnotice.do")// 새로운 공지사항 등록하기 위함
    public String insertnotice(@RequestParam("title") String title, @RequestParam("content") String content) {
        service.insertnotice(title, content);
    	return ("redirect:/notice.do");
    }
    
    @PostMapping("/notice/adupdate.do")
	public String update(Model model, AdminVO vo, MultipartFile file) {
		int r = service.update(vo);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "../notice.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
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
