package com.sdm.fj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdm.fj.account.AccountDAO;

@Controller
public class HomeController {
	@Autowired
	private ProductDAO pDAO;
	@Autowired
	private AccountDAO aDAO;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Product p, HttpServletRequest req) {
		return "index1";
	}
	
	@RequestMapping(value = "allProduct.go", method = RequestMethod.GET)
	public String allProduct(Product p, HttpServletRequest req) {
		pDAO.getAllProducts(p, req);
		return "ldw/All/allProduct";
	}
	
	@RequestMapping(value = "/productReg.go", method = RequestMethod.GET)
	public String product() {
		return "productReg";
	}
	
	@RequestMapping(value = "/reg.products.do", method = RequestMethod.POST)
	public String regProduct(Product p, HttpServletRequest req) {
		pDAO.regProducts(p,req);
		pDAO.getAllProducts(p, req);
		return "productReg";
	}
	
}
