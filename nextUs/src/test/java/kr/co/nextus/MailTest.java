package kr.co.nextus;

import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.nextus.util.SendMail;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(classes = {config.MvcConfig.class})
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@WebAppConfiguration
public class MailTest {
	@Autowired
	JavaMailSenderImpl mailSender;
	
	@Test
	public void sendmail() throws Exception{
//		MimeMessage msg = mailSender.createMimeMessage();
//        MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "utf-8");
//
//        msgHelper.setFrom("dlehgus97@gmail.com");
//        msgHelper.setTo("dlehgus97@gmail.com");
//        msgHelper.setSubject("title");
//        msgHelper.setText("content".toString());
//
//        // 메일 전송
//        mailSender.send(msg);
		SendMail.sendMail("dlehgus97@naver.com", "dlehgus97@gmail.com", "title", "content");
	}
}
