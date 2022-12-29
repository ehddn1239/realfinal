package com.sdm.fj.top;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdm.fj.outer.OuterDAO;

@Controller
public class TopController {
	@Autowired
    private TopDAO TDAO;
	
	@RequestMapping(value = "knitwear.go", method = RequestMethod.GET)
	public String knitwear(HttpServletRequest req) {
		TDAO.getAllTopKnitwear(req);
		
		return "ldw/top/knitwear";
	}
	
	@RequestMapping(value = "shirt.go", method = RequestMethod.GET)
	public String shirt(HttpServletRequest req) {
		TDAO.getAllTopShirt(req);
		
		return "ldw/top/shirt";
	}
	
	@RequestMapping(value = "tShirt.go", method = RequestMethod.GET)
	public String tShirt(HttpServletRequest req) {
		TDAO.getAllTopTshirt(req);
		
		return "ldw/top/tShirt";
	}
	@RequestMapping(value = "dress.go", method = RequestMethod.GET)
	public String padding(HttpServletRequest req) {
		TDAO.getAllTopDress(req);
		
		return "ldw/top/dress";
	}
	
}
