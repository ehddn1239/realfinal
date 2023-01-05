package com.sdm.fj.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Service;

@Service
public class AccountDAO {

	@Autowired
	private SqlSession ss;
	


	public void register(Account a, HttpServletRequest req) {
		
		String id = req.getParameter("a_id");
		String pw = req.getParameter("a_pw");
		String nickname = req.getParameter("a_nickname");
		String addr= req.getParameter("a_addr");
		String email = req.getParameter("a_email");
		String phone = req.getParameter("a_phone");
		
		a.setA_id(id);
		a.setA_pw(pw);
		a.setA_nickname(nickname);
		a.setA_addr(addr);
		a.setA_email(email);
		a.setA_phone(phone);
		
		
		if(ss.getMapper(AccountMapper.class).register(a) == 1) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("DB등록 실패");
		}
		
		
	}

	public void login(Account a, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String id = req.getParameter("a_id");
		String pw = req.getParameter("a_pw");
		Account aa = ss.getMapper(AccountMapper.class).login(a);
		res.setContentType("text/html; utf-8");
		PrintWriter out = res.getWriter();
		
		if (aa != null) {
			if (aa.getA_pw().equals(pw)) {
				req.getSession().setAttribute("loginAccount", aa);
				req.getSession().setMaxInactiveInterval(60 * 10);
				System.out.println("로그인  성공");
			} else {
				out.println("<script language ='javascript'>");
				out.println("alert('비밀번호가 틀렸습니다');");
				out.println("location.href='gohome.go';");
				out.println("</script>");
				out.flush();
				
				System.out.println("로그인 실패(비밀번호 오류)");
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
			out.println("<script language ='javascript'>");
			out.println("alert('아이디가 틀렸습니다');");
			out.println("location.href='gohome.go';");
			out.println("</script>");
			out.flush();
			System.out.println("로그인 실패(아이디 오류)");
		}
	}
	
	public boolean loginCheck(HttpServletRequest req) {
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		if (a != null) {
			req.setAttribute("loginCheck", 0);
			return true;
		}
		req.setAttribute("loginCheck", 1);
		return false;
	}
	public void logout(HttpServletRequest req) {
		req.getSession().invalidate();
	}

	public String checkID(Account a, HttpServletRequest req) {
		
		String aaa = a.getA_id();
		System.out.println("aaa는? "+aaa);
		int aa = ss.getMapper(AccountMapper.class).checkId(a);
		
		if(aa == 0) {
			return "N";
		}
		return "Y";
		
	}

	public void findPw(HttpServletResponse response, Account a) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		Account ck = ss.getMapper(AccountMapper.class).findPW(a);
		PrintWriter out = response.getWriter();
		// 가입된 아이디와 이메일이 일치하는게 없다면 
		if(ck.getA_id().isEmpty()) {
			out.print("등록되지 않은 아이디 혹은 이메일 입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			a.setA_pw(pw);
			// 비밀번호 변경
			if(ss.getMapper(AccountMapper.class).changePW(a)>0) {
				// 비밀번호 변경 메일 발송
				sendEmail(a, "findpw");
				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
			}else {
				out.print("이메일로 임시 비밀번호를 발송을 실패 하였습니다.");
				out.close();
			}
			
		}
	}
	
	
	private void sendEmail(Account a, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com //구글 smtp.gmail.com
		String hostSMTPid = "gmlwhd43@gmail.com"; //서버 이메일 쓰기 (보내는 사람)
		String hostSMTPpwd = "wxrlicuhmwjztclt"; //서버 이메일 비번
		
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "SDMProject@naver.com";
		String fromName = "프로젝트이름";			
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += a.getA_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += a.getA_pw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = a.getA_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587 //구글은 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	
	
}
