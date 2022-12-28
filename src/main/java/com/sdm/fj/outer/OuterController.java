package com.sdm.fj.outer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdm.fj.ProductDAO;

@Controller
public class OuterController {
	@Autowired
    private OuterDAO ODAO;
	@RequestMapping(value = "/padding.go", method = RequestMethod.GET)
	public String padding(HttpServletRequest req) {
		ODAO.getAllOuterPadding(req);
		return "ldw/outer/padding";
	}
	@RequestMapping(value = "/padding.do", method = RequestMethod.GET)
	public String paddingDo(HttpServletRequest req) {
		
		
		return "ldw/outer/padding";
	}
	
	@RequestMapping(value = "jacket.go", method = RequestMethod.GET)
	public String jacket() {
		
		return "ldw/outer/jacket";
	}
	
	@RequestMapping(value = "coat.go", method = RequestMethod.GET)
	public String coat() {
		
		return "ldw/outer/coat";
	}
	
	@RequestMapping(value = "fieldjJacket.go", method = RequestMethod.GET)
	public String fieldJacket() {
		
		return "ldw/outer/fieldJacket";
	}
}
