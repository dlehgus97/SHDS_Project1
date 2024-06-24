package kr.co.nextus.mypage.withdrawal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nextus.member.MemberVO;

@Controller
public class WithdrawalController {

    @Autowired
    private WithdrawalService withdrawalService;

    // 회원 탈퇴 페이지 보여주기
    @GetMapping("/mypage/withdrawal.do")
    public String showWithdrawalPage() {
        return "mypage/withdrawal";
    }

    // 회원 탈퇴 처리
    @PostMapping("/mypage/withdrawal.do")
    public String withdraw(@RequestParam("password") String password, HttpSession session, Model model) {
        MemberVO login = (MemberVO) session.getAttribute("login");

        // 비밀번호 일치 여부 확인
        MemberVO vo = new MemberVO();
        vo.setNo(login.getNo());
        vo.setPwd(password);

        int count = withdrawalService.check(vo);

        if (count != 1) {
        	model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
            model.addAttribute("url", "/mypage/withdrawal.do");
            return "common/alert";
        }

        withdrawalService.withdrawMember(login.getNo());
        
        model.addAttribute("msg", "회원탈퇴 처리 되었습니다.");
        model.addAttribute("url", "/index.do");
        session.invalidate(); // 세션 무효화
        return "common/alert";
        
    }
}
