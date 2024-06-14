package kr.co.nextus.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {

    @Autowired
    private MemberService service; // MemberService 주입 설정 필요

    @GetMapping("/member/login.do")
    public void login() {

    }

    @PostMapping("/member/login.do")
    public String login(Model model, MemberVO vo, HttpSession sess) {
        MemberVO login = service.login(vo);
        if (login == null) {
            model.addAttribute("msg", "이메일 비밀번호를 확인하세요.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        } else {
            sess.setAttribute("login", login);
            return "redirect:/index.do";
        }
    }

    @GetMapping("/member/logout.do")
    public String logout(HttpSession sess, Model model) {
        sess.invalidate();
        model.addAttribute("msg", "로그아웃되었습니다.");
        model.addAttribute("url", "/index.do");
        return "common/alert";
    }

    @ResponseBody
    @GetMapping("/member/emailCheck.do")
    public int emailCheck(String email) {
        return service.emailCheck(email);
    }

    @GetMapping("/member/regist.do")
    public String regist() {
        // 회원가입 폼 페이지로 이동
        return "member/join";
    }

    @PostMapping("/member/insert.do")
    public String regist(MemberVO vo, Model model) {
        if (service.regist(vo)) {
            model.addAttribute("msg", "정상적으로 가입되었습니다.");
            model.addAttribute("url", "/index.do");
            return "common/alert";
        } else {
            model.addAttribute("msg", "가입 오류");
            model.addAttribute("url", "/member/regist.do");
            return "common/alert";
        }
    }

    @GetMapping("/member/edit.do")
    public String edit(HttpSession sess, Model model) {
        MemberVO uv = (MemberVO) sess.getAttribute("login");
        model.addAttribute("vo", service.detail(uv));
        return "member/edit";
    }


    @PostMapping("/member/update.do")
    public String update(MemberVO vo, Model model) {
        int r = service.update(vo);
        String msg = "";
        String url = "edit.do";
        if (r > 0) {
            msg = "정상적으로 수정되었습니다.";
        } else {
            msg = "수정 오류";
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        return "common/alert";
    }
 
	
	@GetMapping("/member/search.do")
	public String search() {
		// 찾기 폼 
		return "member/search";
	}
	
	
	@GetMapping("/member/idsearch.do")
	public String findid() {
		// 아이디 찾기 폼
		return "member/idsearch";
	}
	@PostMapping("/member/findid.do")
	public String findId(MemberVO vo, Model model) {
		if (service.findid(vo)) {
			model.addAttribute("msg", "아이디는  입니다.");
			model.addAttribute("url", "/index.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "가입 오류");
			model.addAttribute("url", "/member/idsearch.do");
			return "common/alert";
		}
	}
	
	@GetMapping("/member/pwdsearch.do")
	public String pwdSearch() {
		// 비밀번호 찾기 폼
		return "member/pwdsearch";
	}
	
	@GetMapping("/member/callback")
	public String callBack() {
	    return "member/callback";
	}


    @PostMapping("/member/loginCallback")
    @ResponseBody
    public String loginCallback(String email,MemberVO vo, HttpSession sess) {
        // 이메일로 기존 회원 존재 여부 확인
        if (service.checkMemberExist(email)) {
            MemberVO login = service.findByEmail(email);
            sess.setAttribute("login", login);
            return "true";
        } else {
            // 기존 회원이 아니라면 회원 정보 저장
            vo.setEmail(email);                  
            if (service.insertMember(vo)) {
                sess.setAttribute("login", vo);
                return "true";
            } else {
                return "false";
            }
        }
    }
  	
    
    @GetMapping("/member/registCheck")
    @ResponseBody
    public String registCheck(String email) {
    	return service.checkMemberExist(email)+"";
    }

    // 관리자에서 하는 것입니다요

	
	// 관리자에서하는겁니다요
	@GetMapping("/memberStatus.do")
	@RequestMapping("/memberStatus")
	public String memberStatus(MemberVO vo, Model model) {
		model.addAttribute("map", service.list(vo));
		return "admin/memberManagement/memberStatus";
	}
	
	@RequestMapping("/addBanPopupMember")
	public String addBanPopupMember(MemberVO vo, Model model) {
		model.addAttribute("map", service.reportCountList(vo,0));
		return "admin/memberManagement/addBanPopupMember";
	}
	
	@RequestMapping("/addBanPopupSeller")
	public String addBanPopupSeller(MemberVO vo, Model model) {
		model.addAttribute("map", service.reportCountList(vo,1));
		return "admin/sellerManagement/addBanPopupSeller";
	}
}
