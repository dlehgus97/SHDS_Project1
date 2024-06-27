package kr.co.nextus.mypage.pinfo;

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

import kr.co.nextus.event.EventVO;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.notice.NoticeService;
import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.selllist.SellListVO;
import kr.co.nextus.selllist.SellListService;
import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.review.ReviewService;


@Controller
public class PinfoController {

	@Autowired
	private PinfoService pinfoService;
	
	//현재 정보 불러오기
	@GetMapping("/mypage/pinfo.do")
	
	public String pinfo(Model model, MemberVO vo, HttpSession sess) {
		
		MemberVO login = (MemberVO)sess.getAttribute("login");
		
		vo.setNo(login.getNo());
		model.addAttribute("member", pinfoService.list(vo));
		
		return "/mypage/pinfo";
	}
	
	//입력한 비밀번호가 일치하는지 확인하기
	@PostMapping("/pinfo/checkpwd.do")
    @ResponseBody
	public String check(@RequestParam("pwd") String pwd, MemberVO vo, HttpSession sess) {
		System.out.println("들어옴");
		MemberVO login = (MemberVO)sess.getAttribute("login");
		vo.setNo(login.getNo());
		vo.setPwd(pwd);
		int r = pinfoService.check(vo);
		System.out.println(r);
		System.out.println(vo);
		return r > 0 ? "success" : "error";
	}
	
	@PostMapping("/pinfo/update.do")
	public String update(MemberVO vo, Model model, HttpSession sess, MultipartFile file, HttpServletRequest request) {
		MemberVO login = (MemberVO)sess.getAttribute("login");
		vo.setNo(login.getNo());
		int r = pinfoService.update(vo, file, request);
		String msg = "";
		String url = "/mypage/pinfo.do";
		if (r == 1) {
			msg = "정상적으로 수정되었습니다.";
			sess.setAttribute("login", vo);
		} else if (r == 0) {
			msg = "정상적으로 수정되었습니다.";
			vo.setProfile_org(login.getProfile_org());
			vo.setProfile_real(login.getProfile_real());
			sess.setAttribute("login", vo);
		} else {
			msg = "수정 오류";
		}
		sess.setAttribute("login", vo);
		System.out.println(vo);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/alert";
	}
	
	
	
	
	
	
	//개인정보 수정
//	@PostMapping("/member/update.do")
//	public String update(MemberVO vo, Model model) {
//		int r = pinfoService.update(vo);
//		String msg = "";
//		String url = "edit.do";
//		if (r > 0) {
//			msg = "정상적으로 수정되었습니다.";
//		} else {
//			msg = "수정 오류";
//		}
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
//		return "common/alert";
//	}
	
}
