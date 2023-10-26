package com.bskrec.common.mail;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bskrec.help.service.HelpService;

@Controller
@EnableAsync
@RequestMapping(value = "/find")
public class MailController {
	@Autowired
	private MailService mailService;
	@Autowired
	private HelpService helpService;
	//아이디 찾기or비밀번호 찾기를 하면 이메일로 보내줌
	@RequestMapping(value = "/sendMail.do", method = RequestMethod.POST)
	public void sendSimpleMail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		StringBuffer sb = new StringBuffer();
		String email1 = (String)request.getParameter("email1");
		String email2 = (String)request.getParameter("email2");
		String sendMail = email1+"@"+email2;
		String id = (String)request.getParameter("member_id");
		String name = (String)request.getParameter("member_name");
		String pw = (String)request.getParameter("member_pw");
		//인증번호 
		int min = 100000;
		int max = 999999;
		int nansu =(int)(Math.random()*(max-min+1))+min;
		
		sb.append("<html><body>");
		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
		sb.append("<h1>"+"bskrec"+"</h1><br>");
		sb.append("<hr>");
		if(id!=null&&!id.equals("")) {
			sb.append("아래의 아이디를 확인해주세요.<br><br>");
			sb.append("회원 아이디: "+id);
		}
		if(pw!=null&&!pw.equals("")){
			sb.append("아래의 비밀번호를 확인해주세요.<br><br>");
			sb.append("회원 비밀번호: "+pw);
		}
		sb.append("</body></html>");
		String str = sb.toString();
		//mailService.sendMail("during4277@naver.com", "요청하신 인증번호를 알려드립니다.", str);
		mailService.sendMail(sendMail, "요청하신 인증번호를 알려드립니다.", str);
	}
}
