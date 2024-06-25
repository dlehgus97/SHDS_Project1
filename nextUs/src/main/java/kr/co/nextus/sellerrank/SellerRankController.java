package kr.co.nextus.sellerrank;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.buylist.BuyListService;
import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.event.EventVO;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.mypage.wishlist.WishListService;
import kr.co.nextus.mypage.wishlist.WishListVO;
import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.selllist.SellListVO;
import kr.co.nextus.selllist.SellListService;
import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;
import kr.co.nextus.review.ReviewService;


@Controller
public class SellerRankController {

	@Autowired
	private SellerRankService service;
				

	
	
}
