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
	
	
	
	
}
