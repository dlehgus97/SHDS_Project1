package kr.co.nextus.seller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.selllist.SellListVO;

// HTTP 요청 처리하여 판매자 관련 작업을 수행하는 컨트롤러

@Controller
@RequestMapping("/seller")
public class SellerController {
    
    @Autowired
    private SellerService sellerService;

    // 판매자 프로필 페이지를 보여주는 메서드
    @GetMapping("/sellerProfile/{no}")
    public String showProfilePage(@PathVariable int no, Model model) {
        // 판매자 번호로 판매자 정보 조회
        SellerVO seller = sellerService.getSellerDetails(no); 
        // 모델에 판매자 정보 추가
        model.addAttribute("seller", seller);
       
        // 판매자가 판매 중인 상품 조회
        List<SellListVO> sellList = sellerService.getSellerSellList(no);
        // 모델에 판매자 상품 정보 추가
        model.addAttribute("sellList", sellList);
        
        // 판매자가 받은 리뷰들 조회
        List<ReviewVO> sellerReviews = sellerService.getSellerReviews(no);
        model.addAttribute("sellerReviews", sellerReviews);
        
        // profile.jsp로 반환 (뷰의 경로)
        return "seller/sellerProfile";
    }
    
    // 판매자의 거래 내역 페이지를 보여주는 메서드
    @GetMapping("/sellerBuyList")
    public String showOrderManagementPage(HttpSession sess, Model model) {
    	MemberVO login = (MemberVO) sess.getAttribute("login");
    	if (login == null || login.getSeller() != 1) {
            // 로그인되지 않았거나 판매자가 아닌 경우 접근 불가
            model.addAttribute("msg", "접근 권한이 없습니다.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        }

        int sellerNo = login.getNo(); // 로그인된 판매자의 번호
        List<BuyListVO> buyList = sellerService.getSellerBuyList(sellerNo);
        model.addAttribute("buyList", buyList);

        // Mini Header 데이터를 모델에 추가
        SellerVO miniHeaderData = sellerService.getMiniHeaderData(sellerNo);
        model.addAttribute("miniHeaderData", miniHeaderData);
        
        return "seller/sellerBuyList";
    }
    
	// 판매자가 정산 신청 시 거래 상태 업데이트
    @PostMapping("/updateStatus")
    public String updateStatus(@RequestParam int buyno, @RequestParam int status, HttpSession sess, Model model) {
        MemberVO login = (MemberVO) sess.getAttribute("login");
        if (login == null || login.getSeller() != 1) {
            model.addAttribute("msg", "접근 권한이 없습니다.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        }

        int sellerNo = login.getNo();
        Map<String, Object> params = new HashMap<>();
        params.put("buyno", buyno);
        params.put("status", status);

        boolean success = sellerService.updateStatus(params);
        if (success) {
            return "redirect:/seller/sellerBuyList";
        } else {
            model.addAttribute("msg", "상태 업데이트에 실패했습니다.");
            model.addAttribute("url", "/seller/sellerBuyList");
            return "common/alert";
        }
    }
    
    // 판매자의 판매글 관리 페이지를 보여주는 메서드
    @GetMapping("/selllistManagement")
    public String showSellListManagementPage(HttpSession sess, Model model) {
    	MemberVO login = (MemberVO) sess.getAttribute("login");
    	if (login == null || login.getSeller() != 1) {
            // 로그인되지 않았거나 판매자가 아닌 경우 접근 불가
            model.addAttribute("msg", "접근 권한이 없습니다.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        }

        int sellerNo = login.getNo(); // 로그인된 판매자의 번호
        List<SellListVO> sellList = sellerService.getSellerSellList(sellerNo);
        model.addAttribute("sellList", sellList);

        // Mini Header 데이터를 모델에 추가
        SellerVO miniHeaderData = sellerService.getMiniHeaderData(sellerNo);
        model.addAttribute("miniHeaderData", miniHeaderData);
        
        return "seller/selllistManagement";
    }
    
    // 판매자의 리뷰 관리 페이지를 보여주는 메서드
    @GetMapping("/sellerReviews")
    public String showSellerReviews(HttpSession sess, Model model) {
        MemberVO login = (MemberVO) sess.getAttribute("login");
        if (login == null || login.getSeller() != 1) {
            // 로그인되지 않았거나 판매자가 아닌 경우 접근 불가
            model.addAttribute("msg", "접근 권한이 없습니다.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        }

        int sellerNo = login.getNo(); // 로그인된 판매자의 번호
        // 여기에서 sellerService를 통해 리뷰 데이터를 가져오는 코드를 작성
        List<ReviewVO> sellerReviews = sellerService.getSellerReviews(sellerNo);
        model.addAttribute("sellerReviews", sellerReviews);

        // Mini Header 데이터를 모델에 추가
        SellerVO miniHeaderData = sellerService.getMiniHeaderData(sellerNo);
        model.addAttribute("miniHeaderData", miniHeaderData);
        
        return "seller/sellerReviews";
    }
    
    // 판매자의 판매자 정보 수정 페이지를 보여주는 메서드
    @GetMapping("/sellerEdit")
    public String showSellerEdit(HttpSession sess, Model model) {
    	MemberVO login = (MemberVO) sess.getAttribute("login");
        if (login == null || login.getSeller() != 1) {
            // 로그인되지 않았거나 판매자가 아닌 경우 접근 불가
            model.addAttribute("msg", "접근 권한이 없습니다.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        }
    	
        int sellerNo = login.getNo(); // 로그인된 판매자의 번호
        // 판매자 번호로 판매자 정보 조회
        SellerVO seller = sellerService.getSellerDetails(sellerNo);
        // 모델에 판매자 정보 추가
        model.addAttribute("seller", seller);

        // sellerEdit.jsp로 반환 (뷰의 경로)
        return "seller/sellerEdit";
    }
    
    // 판매자 정보를 업데이트하는 메서드
    @PostMapping("/update")
    public String updateSeller(SellerVO seller, HttpSession sess, Model model) {
    	 MemberVO login = (MemberVO) sess.getAttribute("login");
         if (login == null || login.getSeller() != 1) {
             // 로그인되지 않았거나 판매자가 아닌 경우 접근 불가
             model.addAttribute("msg", "접근 권한이 없습니다.");
             model.addAttribute("url", "/member/login.do");
             return "common/alert";
         }

         int sellerNo = login.getNo();
         seller.setNo(sellerNo); // 로그인된 판매자의 번호를 설정

         boolean success = sellerService.updateSeller(seller);
         if (success) {
             // 성공 시 성공 페이지로 리다이렉트
             return "redirect:/seller/selllistManagement";
         } else {
             // 실패 시 에러 메시지를 모델에 추가하고 상세 정보 페이지로 이동
             model.addAttribute("error", "Seller update failed.");
             return "seller/sellerEdit";
         }
    }
    
    @GetMapping("/register")
    public String showRegisterForm() {
    	// 판매자 등록 폼으로 이동
        return "seller/register";
    }

    // 판매자 등록을 처리하는 메서드
    @PostMapping("/register")
    public String registerSeller(SellerVO seller, Model model) {
        // 판매자 등록
    	boolean success = sellerService.registerSeller(seller);
        if (success) {
        	// 성공 시 성공 페이지로 리다이렉트
            return "redirect:/seller/success";
        } else {
        	// 실패 시 에러 메시지를 모델에 추가하고 등록 폼으로 이동
            model.addAttribute("error", "Seller registration failed.");
            return "seller/register";
        }
    }
    
    // 판매자의 주간 지표 페이지를 보여주는 메서드
    @GetMapping("/sellerWeeklyMetrics")
    public String getSellerWeeklyMetrics(HttpSession sess, Model model) {
    	MemberVO login = (MemberVO) sess.getAttribute("login");
    	if (login == null || login.getSeller() != 1) {
            // 로그인되지 않았거나 판매자가 아닌 경우 접근 불가
            model.addAttribute("msg", "접근 권한이 없습니다.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        }

        int sellerNo = login.getNo(); // 로그인된 판매자의 번호
        
        List<SellerVO> orderCounts = sellerService.getOrderAndReviewCountsLastWeek(sellerNo);
        model.addAttribute("orderCounts", orderCounts);
        
        // Mini Header 데이터를 모델에 추가
        SellerVO miniHeaderData = sellerService.getMiniHeaderData(sellerNo);
        model.addAttribute("miniHeaderData", miniHeaderData);

        return "seller/sellerWeeklyMetrics";
    }

    // 판매자 상세 정보를 보여주는 메서드
    @GetMapping("/detail/{no}")
    public String getSellerDetails(@PathVariable int no, Model model) {
        // 판매자 번호로 판매자 정보 조회
    	SellerVO seller = sellerService.getSellerDetails(no);
        // 모델에 판매자 정보 추가
    	model.addAttribute("seller", seller);
    	// 판매자 상세 정보 페이지로 이동
        return "seller/detail";
    }
}