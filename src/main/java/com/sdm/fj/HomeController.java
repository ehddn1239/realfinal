package com.sdm.fj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sdm.fj.account.Account;
import com.sdm.fj.account.AccountDAO;
import com.sdm.fj.product.Product;
import com.sdm.fj.product.ProductDAO;

@Controller
public class HomeController {
	@Autowired
	private ProductDAO pDAO;
	@Autowired
	private AccountDAO aDAO;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Product p, HttpServletRequest req) {
		aDAO.loginCheck(req);
		return "index";
	}
	@RequestMapping(value = "/gohome.go", method = RequestMethod.GET)
	public String gohome(Product p, HttpServletRequest req) {
		aDAO.loginCheck(req);
		return "index";
	}
	
	
}
