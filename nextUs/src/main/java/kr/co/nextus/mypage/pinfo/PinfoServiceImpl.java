package kr.co.nextus.mypage.pinfo;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.event.EventVO;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.mypage.orderlist.OrderListVO;
import kr.co.nextus.notice.NoticeVO;


@Service
public class PinfoServiceImpl implements PinfoService {
	
	@Autowired
	private PinfoMapper mapper;


	@Override
	public MemberVO list(MemberVO vo) {

		return mapper.list(vo); 
	}
	
	@Override
	public int check(MemberVO vo) {

		return mapper.check(vo); 
	}
	
	 @Override
	 public int update(MemberVO vo, MultipartFile file, HttpServletRequest request) {
		 if ("none".equals(request.getParameter("isprofile"))) {
			 	MemberVO data = mapper.list(vo);
				mapper.fileDelete(vo.getNo());
				File f = new File(request.getRealPath("/upload/board/")+data.getProfile_real());
				f.delete();
		 }
		 if (!file.isEmpty()) {
			// 파일명
			String org = file.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = System.currentTimeMillis()+ext;
			// 파일저장
			String path = request.getRealPath("/upload/board/")+real;
			try {
				file.transferTo(new File(path));
			} catch (Exception e) {}
			vo.setProfile_org(org);
			vo.setProfile_real(real);
		}
		 
	     return mapper.update(vo);
	 }

}
