package com.sdm.fj.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {

	@Autowired
	AccountDAO aDAO;
	
	@RequestMapping(value = "/loginPage.go", method = RequestMethod.GET)
	public String home() {
		
		return "kmj/login";
	}
	@RequestMapping(value = "/account.reg.do", method = RequestMethod.POST)
	public String register(Account a, HttpServletRequest req) {
		
		aDAO.register(a, req);
		
		return "kmj/login";
	}
	
}
