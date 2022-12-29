package com.sdm.fj.etc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EtcController {

	@Autowired
	private EtcDAO eDAO;
	
	@RequestMapping(value = "/etc.accessory.go", method = RequestMethod.GET)
	public String pantsGo(HttpServletRequest req) {
		
		eDAO.getAllAccessory(req);
		 
		return "sh/etc/acc";
	}
	
	@RequestMapping(value = "/etc.bag.go", method = RequestMethod.GET)
	public String bagGo(HttpServletRequest req) {
		
		eDAO.getAllBag(req);
		 
		return "sh/etc/bag";
	}
	
	@RequestMapping(value = "/etc.shoes.go", method = RequestMethod.GET)
	public String shoesGo(HttpServletRequest req) {
		
		eDAO.getAllShoes(req);
		 
		return "sh/etc/shoes";
	}
}
