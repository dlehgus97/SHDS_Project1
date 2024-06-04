package kr.co.nextus;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.nextus.reply.ReplyMapper;
import kr.co.nextus.reply.ReplyVO;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
public class ReplyTest {
	
	@Autowired
	ReplyMapper mapper;
	
	@Test
	public void regist() {
		for (int i=0; i<100; i++) {
			ReplyVO vo = new ReplyVO();
			vo.setTitle("제목"+i);
			vo.setContent("내용"+i);
			mapper.insert(vo);
			mapper.updateGno(vo.getNo());
		}
	}
	
	@Test
	public void updateGno() {
		mapper.updateGno(1);
	}
	
	@Test
	public void reply() {
		ReplyVO vo = new ReplyVO();
		vo.setGno(100);
		vo.setOno(0);
		vo.setNested(0);
		vo.setTitle("100번의 답변");
		vo.setContent("100번의 답변");
		
		// ono 수정
		mapper.updateOno(vo);
		
		vo.setOno(vo.getOno()+1);
		vo.setNested(vo.getNested()+1);
		mapper.insert(vo);
	}
	
	@Test
	public void list() {
		ReplyVO vo = new ReplyVO();
		vo.setPage(2);
		vo.setSearchType("all");
		vo.setSearchWord("1");
		List<ReplyVO> list = mapper.list(vo);
//		for (ReplyVO v : list) {
//			System.out.println(v);
//		}
		list.stream().forEach(v -> System.out.println(v));
	}
	
}
