package kr.co.nextus.mypage.pinfo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.member.MemberVO;


public interface PinfoService {
	
	MemberVO list(MemberVO vo);
	
	int check(MemberVO vo);

	int update(MemberVO vo, MultipartFile file, HttpServletRequest request);

}
