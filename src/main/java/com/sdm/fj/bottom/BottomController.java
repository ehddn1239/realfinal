package com.sdm.fj.bottom;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BottomController {
	
	@Autowired
	private BottomDAO bDAO;

	@RequestMapping(value = "/bottom.pants.go", method = RequestMethod.GET)
	public String pantsGo(HttpServletRequest req) {
		
		bDAO.getAllPants(req);
		 
		return "sh/bottom/pants";
	}
	
	@RequestMapping(value = "/bottom.denim.go", method = RequestMethod.GET)
	public String denimGo(HttpServletRequest req) {
		 
		return "sh/bottom/denim";
	}
	
	@RequestMapping(value = "/bottom.skirt.go", method = RequestMethod.GET)
	public String skirtGo(HttpServletRequest req) {
		 
		return "sh/bottom/skirt";
	}
	
	@RequestMapping(value = "/bottom.shorts.go", method = RequestMethod.GET)
	public String shortsGo(HttpServletRequest req) {
		 
		return "sh/bottom/shorts";
	}
	
}
