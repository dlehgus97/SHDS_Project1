package kr.co.nextus.review;

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

@Controller
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	@PostMapping("/review/insert.do")
	public String insert(Model model, HttpServletRequest request, ReviewVO vo) {
		HttpSession sess = request.getSession();
		MemberVO login = (MemberVO)sess.getAttribute("login");
		int r = service.insert(vo, request);
		int n = service.update(vo, request);
		//셀러에 업데이트 해주는게 필요함
		System.out.println("셀러에 업데이트");
		service.updateSeller(vo);
		System.out.println("셀러에 업데이트");
		int m = service.updateisreview(vo);
		if (r > 0 && n > 0 && m > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/selllist/view.do?sellno="+vo.getSellno()+"#reviews");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
	
	@PostMapping("/review/delete.do")
    @ResponseBody
	public String delete(@RequestParam("reviewno") int reviewno, @RequestParam("sellno") int sellno, HttpServletRequest request, ReviewVO vo) {
		vo.setSellno(sellno);
		System.out.println(vo.getNo());
		int r = service.delete(reviewno);
		int n = service.update(vo, request);
		return r > 0 ? "success" : "fail";
	}
}
