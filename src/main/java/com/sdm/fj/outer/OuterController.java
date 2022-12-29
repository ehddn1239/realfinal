package com.sdm.fj.outer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OuterController {
	@Autowired
    private OuterDAO ODAO;
	@RequestMapping(value = "/padding.go", method = RequestMethod.GET)
	public String padding(HttpServletRequest req) {
		ODAO.getAllOuterPadding(req);
		return "ldw/outer/padding";
	}
	
	@RequestMapping(value = "coat.go", method = RequestMethod.GET)
	public String coat(HttpServletRequest req) {
		ODAO.getAllOuterCoat(req);
		return "ldw/outer/coat";
	}
	
	@RequestMapping(value = "fieldjJacket.go", method = RequestMethod.GET)
	public String fieldJacket(HttpServletRequest req) {
		ODAO.getAllOuterFieldJacket(req);
		return "ldw/outer/fieldJacket";
	}
}
