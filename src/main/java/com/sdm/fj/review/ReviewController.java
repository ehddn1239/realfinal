package com.sdm.fj.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdm.fj.account.Account;
import com.sdm.fj.account.AccountDAO;
import com.sdm.fj.cart.CartDAO;
import com.sdm.fj.cart.CartDTO;
import com.sdm.fj.product.Product;
import com.sdm.fj.product.ProductDAO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO rDAO;
	@Autowired
	private AccountDAO aDAO;
	@Autowired
	private ProductDAO pDAO;
	
	@RequestMapping(value = "/review.go", method = RequestMethod.GET)
	public String goReview(Product p, Account a, HttpServletRequest req, CartDTO cart) {
		aDAO.loginCheck(req);
		
		
		
		return "ldw/review";
	}
	@RequestMapping(value = "regReview.", method = RequestMethod.GET)
	public String regReviewDo(Review r, Product p, Account a, HttpServletRequest req) {
		aDAO.loginCheck(req);
		// 리뷰 하는 일
		rDAO.regReview(req, p, a, r);
		
		
		
		
		return "kmj/myPage";
	}
	@RequestMapping(value = "productReview.go", method = RequestMethod.GET)
	public String ReviewGo(Review r, Product p, Account a, HttpServletRequest req) {
		aDAO.loginCheck(req);
		// 리뷰 조회하는 일
		rDAO.productReviewSelect(req,r,p,a);
		
		
		
		
		return "sh/detail";
	}
	
}
