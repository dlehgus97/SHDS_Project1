package kr.co.nextus.member;


import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nextus.report.ReportService;
import kr.co.nextus.report.ReportVO;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;
import kr.co.nextus.util.SendMail;


@Controller

public class MemberController {


    @Autowired
    private MemberService service; // MemberService 주입 설정 필요

    @Autowired
    private ReportService reportservice;
    
    @Autowired
    private SellerRequestService SRservice;
    
    Map<String, String> verifyMap = new HashMap<>();
    
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
        } else if (login.getState() == 1) {
            model.addAttribute("msg", "정지 회원입니다. 로그인이 제한됩니다.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        } else if (login.getState() == 2) {
            model.addAttribute("msg", "탈퇴된 회원입니다. 로그인이 제한됩니다.");
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


    //아이디 찾기 
    @PostMapping("/member/findid.do")
    public String findId(MemberVO vo, Model model) {
        if (service.findId(vo) != null && service.findId(vo).getEmail() != null) {
            model.addAttribute("msg", "아이디는 " + service.findId(vo).getEmail() + " 입니다."); // 찾은 아이디 추가
            model.addAttribute("url", "/member/login.do");
        } else {
            model.addAttribute("msg", "존재하지 않는 회원 정보입니다.");
            model.addAttribute("url", "/member/login.do");
        }
        return "common/alert";
    }

  //비밀번호 인증 이메일 전송
    @PostMapping("/member/findAuth.do")
    @ResponseBody
    public Map<String, Object> findAuth(@RequestParam String email, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        // 사용자가 작성한 이메일과 일치하는 회원을 찾습니다.
        MemberVO isUser = service.findByEmail(email);

        if (isUser != null) {
            Random r = new Random();
            int num = 100000 + r.nextInt(900000); // 6자리 랜덤 인증번호 생성
            // 세션에 인증번호와 이메일 저장
            session.setAttribute("verificationCode", String.valueOf(num));
            session.setAttribute("userEmail", email);
            // 이메일 주소가 일치하면 이메일을 보냅니다.
            if (isUser.getEmail().equals(email)) {
                String from = "dlehgus97@naver.com"; // 발신자 이메일
                String to = isUser.getEmail(); // 수신자 이메일
                String subject = "[NEXTUS] 비밀번호 변경 인증 이메일입니다.";
                StringBuilder content = new StringBuilder();
                content.append(String.format("안녕하세요 %s님\n", isUser.getName()));
                content.append(String.format("NEXTUS 비밀번호 찾기(변경) 인증번호는 %d입니다.", num));

                try {
                    // SendMail 클래스를 사용하여 메일 전송
                    SendMail.sendMail(from, to, subject, content.toString());
                    // 성공적으로 메일을 보낸 경우
                    map.put("status", true);
                } catch (Exception e) {
                    // 메일 전송 실패 시 처리
                    map.put("status", false);
                    map.put("error", "메일 전송 중 오류가 발생했습니다. 다시 시도해주세요.");
                }
            } else {
                // 이메일 주소가 일치하지 않는 경우 처리
                map.put("status", false);
                map.put("error", "입력하신 이메일과 일치하는 회원 정보가 없습니다.");
            }
        } else {
            // 회원이 존재하지 않는 경우 처리
            map.put("status", false);
            map.put("error", "존재하지 않는 회원 정보입니다.");
        }
        return map;
    }


    @PostMapping("/member/verifyCode.do")
    @ResponseBody
    public Map<String, Object> verifyCode(@RequestParam String email, @RequestParam String code, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        String sessionEmail = (String) session.getAttribute("userEmail");
        String sessionCode = (String) session.getAttribute("verificationCode");

        if (sessionEmail != null && sessionCode != null && sessionEmail.equals(email) && sessionCode.equals(code)) {
            map.put("status", true);
        } else {
            map.put("status", false);
            map.put("error", "인증 코드가 올바르지 않습니다.");
        }
        return map;
    }
    
    @PostMapping("/changePassword.do")
    @ResponseBody
    public Map<String, Object> changePassword(@RequestParam String newPassword, @RequestParam String userEmail) {
        Map<String, Object> map = new HashMap<>();
        
        // 여기서는 간단히 userEmail을 HttpSession에서 가져온 것으로 가정합니다.
        // 실제로는 세션에 사용자 정보가 저장되는 방식에 따라 다를 수 있습니다.
        
        // 예시로 간단하게 비밀번호를 업데이트하는 로직을 작성합니다.
        // 실제로는 이 부분에 데이터베이스에서 비밀번호 업데이트를 수행하는 로직이 들어가야 합니다.
        if (userEmail != null && !newPassword.isEmpty()) {
            // updatePassword(userEmail, newPassword); // 이런 식으로 실제 DB에 저장된 비밀번호를 업데이트합니다.
            
            // 업데이트 성공 시
        	service.updatePassword(userEmail, newPassword);
            map.put("status", true);
        } else {
            map.put("status", false);
            map.put("error", "비밀번호를 변경하는 도중 오류가 발생했습니다.");
        }
        
        return map;
    }
    
    @GetMapping("/member/changePassword.do")
    public String showChangePasswordPage() {
        return "member/changepwd"; // 비밀번호 변경 페이지의 뷰 이름
    }

    @GetMapping("/member/pwdsearch.do")
    public String pwdSearch() {
        // 비밀번호 찾기 폼
        return "member/pwdsearch";
    }

    //단순 콜백용
    @GetMapping("/member/callback")
    public String callBack() {
        return "member/navercallback";
    }

    //네이버 로그인 콜백
    @PostMapping("/member/loginCallback")
    @ResponseBody
    public String loginCallback(String email, MemberVO vo, HttpSession sess) {
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

//    @GetMapping("/member/registCheck")
//    @ResponseBody
//    public String registCheck(String email) {
//        return service.checkMemberExist(email) + "";
//    }

    // 관리자에서하는겁니다요
    @GetMapping("/memberStatus.do")
    @RequestMapping("/memberStatus")
    public String memberStatus(MemberVO vo, SellerRequestVO vo2,Model model) {
        model.addAttribute("map", service.list(vo));
        model.addAttribute("sellerRequestMap", SRservice.list(vo2));
        return "admin/memberManagement/memberStatus";
    }

    @RequestMapping("/addBanPopupMember")
    public String addBanPopupMember(MemberVO vo,ReportVO vo2, Model model) {
        model.addAttribute("map", service.reportCountList(vo, 0));
        return "admin/memberManagement/addBanPopupMember";

    }
    
    @RequestMapping(value = "/loadReportDetails", method = RequestMethod.GET)
    @ResponseBody
    public List<ReportVO> loadReportDetails(@RequestParam("email") String email,Model model) {
        // 이메일을 기준으로 신고 내역을 조회하는 서비스 호출
        List<ReportVO> reportDetails = reportservice.list(email);
        return reportDetails;
    }
    
    @RequestMapping("/addBanPopupSeller")
    public String addBanPopupSeller(MemberVO vo, Model model) {
        model.addAttribute("map", service.reportCountList(vo, 1));
        return "admin/sellerManagement/addBanPopupSeller";
    }
}

