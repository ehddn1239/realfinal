package com.sdm.fj.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sdm.fj.account.Account;
import com.sdm.fj.account.AccountDAO;

import com.sdm.fj.account.OrderList;
import com.sdm.fj.cart.CartDTO;
import com.sdm.fj.product.Criteria;
import com.sdm.fj.product.PageVO;
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
	public String goReview(OrderList o, Product p, Account a, HttpServletRequest req, CartDTO cart) {
		aDAO.loginCheck(req);
		pDAO.getOrders(o, req, p);
		System.out.println("--------review.go 시작--------------");

		return "ldw/review";
	}

	@RequestMapping(value = "/regReview.do", method = RequestMethod.POST)
	public String regReviewDo(Review r, HttpServletRequest req, MultipartHttpServletRequest file, Account a, OrderList o, Product p) {
		System.out.println("---------regReview.do컨트롤러 시작------------");
		// 리뷰 하는 일
		rDAO.regReview(req, r, file);

		if (aDAO.loginCheck(req)) {
			aDAO.getAccount(a, req);
			// 구매이력 불러오기
			pDAO.showAllOrders(o, req, p);
			// 찜 목록 게시글 따로 조회하기
			pDAO.showClientFavors(req, p);
			// 찜하기 페이징
			pDAO.paging(1, req, p);
			
			return "kmj/myPage";
		}
		
		return "index";
	}

	@RequestMapping(value = "/review.delete.do", method = RequestMethod.GET)
	public String reviewDeleteDo(Account a, Product p, Review r, HttpServletRequest req, Criteria cri) {

		rDAO.deleteReview(req, r, cri);
    
		if (aDAO.loginCheck(req)) {
			aDAO.setFavorites(p, a, req);
		}
		pDAO.goDetail(p, req);
		pDAO.getDetail(p, req);
		rDAO.getReviewCount(req, r, p);

		rDAO.productReviewSelect(req, r, p, a);

		return "sh/detail";

	}

}
