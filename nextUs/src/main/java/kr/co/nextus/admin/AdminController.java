package kr.co.nextus.admin;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.nextus.buylist.BuyListService;
import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.member.MemberService;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;


@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	@Autowired
	private SellerRequestService SRservice;
	@Autowired
	private BuyListService BLservice;
	@Autowired
	private MemberService MBservice;
	
	@RequestMapping("/admin")
	public String admin() {
		
		return "admin/admin";
	}

	


	@PostMapping("/adminLogin")
	@GetMapping("/adminLogin")
	public String adminLogin(@RequestParam("adminID") String adminID, HttpServletRequest request,RedirectAttributes redirectAttributes,
							 @RequestParam("adminPW") String adminPW, Model model,AdminVO vo) {
		vo.setAdminID(adminID);
		vo.setAdminPW(adminPW);
		AdminVO login = service.adminLogin(vo); 
		if(login==null) {
			request.getSession().setAttribute("adminLoggedIn", true);
			return "admin/admin";
			
		}else {
			redirectAttributes.addFlashAttribute("error", "Invalid admin ID or password");
			return "redirect:/adminMain";
		}
	}
	 
	
	@RequestMapping("/adminMain")
	public String adminMain(SellerRequestVO vo, BuyListVO vo2, MemberVO vo3,Model model,HttpServletRequest request) {
		
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("SRnew", SRservice.NEW(vo));
			model.addAttribute("STnew", BLservice.settleNEW(vo2));
			model.addAttribute("RFnew", BLservice.refundNEW(vo2));

			//그래프 그리는 용도
			model.addAttribute("sales",BLservice.seven_days_sales(vo2));
			model.addAttribute("members",MBservice.seven_days_members(vo3));
			return "admin/adminMain";
		}else {
			return "common/403";
		}
	}
	
	

	
	
	
	
	@GetMapping("/notice.do")  // 공지사항 조회
	public String index(Model model, AdminVO vo,SellerRequestVO vo2, BuyListVO vo3,HttpServletRequest request) {

		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			
		}else {
			return "common/403";
		}
		
		
		model.addAttribute("map", service.list(vo));
		
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		return "admin/serviceCenter/notice";
	}
	
	@GetMapping("/notice/adview.do") // 클리하여 들어가보기
	public String view(Model model, AdminVO vo,SellerRequestVO vo2, BuyListVO vo3,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			
		}else {
			return "common/403";
		}
		model.addAttribute("vo", service.detail(vo, true));
		model.addAttribute("SRnew", SRservice.NEW(vo2));
		model.addAttribute("STnew", BLservice.settleNEW(vo3));
		model.addAttribute("RFnew", BLservice.refundNEW(vo3));
		return "admin/serviceCenter/adview";
	}
	
	@GetMapping("/notice/adedit.do")//editㄱㄱ
	public String edit(Model model, AdminVO vo,SellerRequestVO vo2, BuyListVO vo3,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("vo", service.detail(vo, false));
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));
			return "admin/serviceCenter/adedit";
		}else {
			return "common/403";
		}
		
	}
	
    @RequestMapping("/notice/deleteNotice.do") // 삭제하기 버튼 누를시
    public String deleteNotice(@RequestParam("no") int no,HttpServletRequest request) {
    	Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			service.deleteNotice(no);
	        return ("redirect:/notice.do");
		}else {
			return "common/403";
		}
        
    }
    
    @RequestMapping("/notice/register.do") // 등록하기 폼에 넘어가기
    public String registnotice(Model model,SellerRequestVO vo2, BuyListVO vo3,HttpServletRequest request) {
    	Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));
	    	return "admin/serviceCenter/insertnotice";
		}else {
			return "common/403";
		}
    	
    }
    
    @RequestMapping("/notice/insertnotice.do")// 새로운 공지사항 등록하기 위함
    public String insertnotice(@RequestParam("title") String title, @RequestParam("content") String content,HttpServletRequest request) {
    	Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			service.insertnotice(title, content);
	    	return ("redirect:/notice.do");
		}else {
			return "common/403";
		}
        
    }
    
    @PostMapping("/notice/adupdate.do")
	public String update(Model model, AdminVO vo, MultipartFile file,HttpServletRequest request) {
    	Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
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
		}else {
			return "common/403";
		}
		
	}
    
    
    
	
	
	
	
}