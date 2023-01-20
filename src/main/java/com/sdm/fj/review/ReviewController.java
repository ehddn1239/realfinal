package com.sdm.fj.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdm.fj.account.Account;
import com.sdm.fj.account.AccountDAO;
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
	
	@RequestMapping(value = "/regReview.do", method=RequestMethod.POST)
	public String regReviewDo(Review r, HttpServletRequest req) {
		System.out.println("---------regReview.do컨트롤러 시작------------");
		// 리뷰 하는 일
		rDAO.regReview(req, r);
		
		
		return "kmj/myPage";
	}
	
}
