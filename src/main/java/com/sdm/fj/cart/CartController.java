package com.sdm.fj.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdm.fj.account.AccountDAO;
import com.sdm.fj.product.Product;
import com.sdm.fj.product.ProductDAO;

@Controller
public class CartController {

	@Autowired
	private CartDAO cDAO;
	@Autowired
	private AccountDAO aDAO;
	@Autowired
	private ProductDAO pDAO;
	
	@RequestMapping(value = "/add.cart", method = RequestMethod.GET)
	public String addCart(Product p,CartDTO cart, HttpServletRequest req) {
	cDAO.addcart(p,cart,req);
	cDAO.getAllCart(cart, req);
		
		
		return "sh/cart";
	}
	
	@RequestMapping(value = "/go.cart", method = RequestMethod.GET)
	public String goCart(CartDTO cart, HttpServletRequest req) {
	aDAO.loginCheck(req);
	cDAO.getAllCart(cart, req);
		
		
		return "sh/cart";
	}

	
		@RequestMapping(value = "/delete.cart.do", method = RequestMethod.GET)
	public String deleteCart(CartDTO c, HttpServletRequest req) {
	aDAO.loginCheck(req);
	cDAO.deleteCart(c,req);
	cDAO.getAllCart(c, req);
		
		return "sh/cart";
	}
		@RequestMapping(value = "/delete.cart.allDo", method = RequestMethod.GET)
		public String deleteCartAll(CartDTO c, HttpServletRequest req) {
		aDAO.loginCheck(req);
		cDAO.deleteCartAll(c,req);
		cDAO.getAllCart(c, req);
			
			return "sh/cart";
		}
		
}

