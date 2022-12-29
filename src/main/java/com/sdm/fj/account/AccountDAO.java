package com.sdm.fj.account;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
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

	public void login(Account a, HttpServletRequest req) {
		String id = req.getParameter("a_id");
		String pw = req.getParameter("a_pw");
		Account aa = ss.getMapper(AccountMapper.class).login(a);
		
		if (aa != null) {
			if (aa.getA_pw().equals(pw)) {
				req.getSession().setAttribute("loginAccount", aa);
				req.getSession().setMaxInactiveInterval(60 * 10);
				System.out.println("로그인  성공");
			} else {
				System.out.println("로그인 실패(비밀번호 오류)");
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
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
	
	
}