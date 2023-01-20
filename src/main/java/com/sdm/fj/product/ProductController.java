package com.sdm.fj.product;

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
import com.sdm.fj.review.Review;
import com.sdm.fj.review.ReviewDAO;



@Controller
public class ProductController {
	@Autowired
	private ProductDAO pDAO;
	@Autowired
	private AccountDAO aDAO;
	@Autowired 
	private ReviewDAO rDAO;
	
	@RequestMapping(value = "allProduct.go", method = RequestMethod.GET)
	public String allProduct(Criteria cri,Product p, HttpServletRequest req) {
//		pDAO.getAllProducts(p, req);
		PageVO pageVO = new PageVO(cri, pDAO.getTotal());
		req.setAttribute("pageVO", pageVO);	
		pDAO.getList(cri, req);
		return "ldw/All/allProduct";
	}
	@RequestMapping(value = "allNewProduct.select", method = RequestMethod.GET)
	public String allNewProductSelect(Product p, HttpServletRequest req) {
	
		if (Integer.parseInt(req.getParameter("p_category")) == 0) {
			pDAO.getNewProducts(p, req);
			return "ldw/All/allProduct";
		}else {
			int p_category = Integer.parseInt(req.getParameter("p_category"));
			switch (p_category) {
			case 1:
				pDAO.getNewProducts(p, req);
				return "ldw/outer/padding";
			case 2:
				pDAO.getNewProducts(p, req);
				return "ldw/outer/coat";
			case 3:
				pDAO.getNewProducts(p, req);
				return "ldw/outer/fieldJacket";
			case 4:
				pDAO.getNewProducts(p, req);
				return "ldw/top/knitwear";
			case 5:
				pDAO.getNewProducts(p, req);
				return "ldw/top/shirt";
			case 6:
				pDAO.getNewProducts(p, req);
				return "ldw/top/tShirt";
			case 9:
				pDAO.getNewProducts(p, req);
				return "sh/bottom/pants";
			case 10:
				pDAO.getNewProducts(p, req);
				return "sh/bottom/denim";
			case 12:
				pDAO.getNewProducts(p, req);
				return "sh/bottom/shorts";
			case 13:
				pDAO.getNewProducts(p, req);
				return "sh/etc/acc";
			case 14:
				pDAO.getNewProducts(p, req);
				return "sh/etc/bag";
			case 15:
				pDAO.getNewProducts(p, req);
				return "sh/etc/shoes";
			default:
				break;
			}
		}
		return "";
	}
	
	@RequestMapping(value = "allHighProduct.select", method = RequestMethod.GET)
	public String allHighProductSelect(Product p, HttpServletRequest req) {
	
		if (Integer.parseInt(req.getParameter("p_category")) == 0) {
			pDAO.getHighPriceProducts(p, req);
			return "ldw/All/allProduct";
		}else {
			int p_category = Integer.parseInt(req.getParameter("p_category"));
			switch (p_category) {
			case 1:
				pDAO.getHighPriceProducts(p, req);
				return "ldw/outer/padding";
			case 2:
				pDAO.getHighPriceProducts(p, req);
				return "ldw/outer/coat";
			case 3:
				pDAO.getHighPriceProducts(p, req);
				return "ldw/outer/fieldJacket";
			case 4:
				pDAO.getHighPriceProducts(p, req);
				return "ldw/top/knitwear";
			case 5:
				pDAO.getHighPriceProducts(p, req);
				return "ldw/top/shirt";
			case 6:
				pDAO.getHighPriceProducts(p, req);
				return "ldw/top/tShirt";
			case 9:
				pDAO.getHighPriceProducts(p, req);
				return "sh/bottom/pants";
			case 10:
				pDAO.getHighPriceProducts(p, req);
				return "sh/bottom/denim";
			case 12:
				pDAO.getHighPriceProducts(p, req);
				return "sh/bottom/shorts";
			case 13:
				pDAO.getHighPriceProducts(p, req);
				return "sh/etc/acc";
			case 14:
				pDAO.getHighPriceProducts(p, req);
				return "sh/etc/bag";
			case 15:
				pDAO.getHighPriceProducts(p, req);
				return "sh/etc/shoes";
			default:
				break;
			}
		}
		return "";
	}
	@RequestMapping(value = "allLowProduct.select", method = RequestMethod.GET)
	public String allLowProductSelect(Product p, HttpServletRequest req) {
		
		pDAO.getLowPriceProducts(p, req);
		
		if (req.getParameter("p_category") != null) {
			int p_category = Integer.parseInt(req.getParameter("p_category"));
			switch (p_category) {
			case 1:
				pDAO.getLowPriceProducts(p, req);
				return "ldw/outer/padding";
			case 2:
				pDAO.getLowPriceProducts(p, req);
				return "ldw/outer/coat";
			case 3:
				pDAO.getLowPriceProducts(p, req);
				return "ldw/outer/fieldJacket";
			case 4:
				pDAO.getLowPriceProducts(p, req);
				return "ldw/top/knitwear";
			case 5:
				pDAO.getLowPriceProducts(p, req);
				return "ldw/top/shirt";
			case 6:
				pDAO.getLowPriceProducts(p, req);
				return "ldw/top/tShirt";
			case 9:
				pDAO.getLowPriceProducts(p, req);
				return "sh/bottom/pants";
			case 10:
				pDAO.getLowPriceProducts(p, req);
				return "sh/bottom/denim";
			case 12:
				pDAO.getLowPriceProducts(p, req);
				return "sh/bottom/shorts";
			case 13:
				pDAO.getLowPriceProducts(p, req);
				return "sh/etc/acc";
			case 14:
				pDAO.getLowPriceProducts(p, req);
				return "sh/etc/bag";
			case 15:
				pDAO.getLowPriceProducts(p, req);
				return "sh/etc/shoes";
			default:
				break;
			}
		}
		
		return "ldw/All/allProduct";
	}
	
	
	@RequestMapping(value = "productReg.go", method = RequestMethod.GET)
	public String goRegProduct(Product p, HttpServletRequest req) {
		if (aDAO.loginCheck(req) == false ) {
			// 유저 타입 확인하는 메서드 2와 3만 false를 반환함( 판매자, 관리자)
				// 1만 true를 반환함
			if(aDAO.checkUserType(req)) {
				req.setAttribute("reg", "판매자로 로그인 하세요!");
			}
				req.setAttribute("reg", "로그인 먼저 하세요!");
			return "index";
		}
		
		return "ldw/productReg";
	}
	
	@RequestMapping(value = "showByCategory", method = RequestMethod.GET)
	public String goByCategory(Criteria cri,HttpServletRequest req, Product p) {
		
		
		
		int p_category = Integer.parseInt(req.getParameter("p_category"));
		cri.setP_category(p_category);
		// System.out.println(p_category);
		PageVO pageVO = new PageVO(cri, pDAO.getTotalByCate(cri,req));
		req.setAttribute("pageVO", pageVO);	
		switch (p_category) {
		case 1:
//			pDAO.getProductByCategory(req, p);
			pDAO.getListByCate(cri, req);
			return "ldw/outer/padding";
		case 2:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "ldw/outer/coat";
		case 3:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "ldw/outer/fieldJacket";
		case 4:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "ldw/top/knitwear";
		case 5:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "ldw/top/shirt";
		case 6:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "ldw/top/tShirt";
		case 9:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "sh/bottom/pants";
		case 10:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "sh/bottom/denim";
		case 12:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "sh/bottom/shorts";
		case 13:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "sh/etc/acc";
		case 14:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "sh/etc/bag";
		case 15:
			pDAO.getListByCate(cri, req);
			//pDAO.getProductByCategory(req, p);
			return "sh/etc/shoes";
		default:
			break;
		}
			
		return "index";
	}
	
	@RequestMapping(value = "reg.products.do", method = RequestMethod.POST)
	public String regProduct(Product p, HttpServletRequest req,MultipartHttpServletRequest file) {
		aDAO.loginCheck(req);
		pDAO.regProducts(p,req,file);
		return "ldw/productReg";
	}
	

	@RequestMapping(value = "detail.go")
	public String goDetail(OrderList o, Account a, Product p, HttpServletRequest req, Review r) {
		if(aDAO.loginCheck(req)) {
			aDAO.setFavorites(p,a, req);
		}
		pDAO.goDetail(p,req);
		pDAO.getDetail(p,req);
		rDAO.productReviewSelect(req,r,p,a);
		return "sh/detail";
	}
	
	
	@RequestMapping(value = "product.delete.do", method = RequestMethod.GET)
	public String deleteProduct(Product p, HttpServletRequest req) {
		pDAO.deleteProduct(p, req);	
		
		pDAO.getProductByCategory(req, p);
		switch (Integer.parseInt(req.getParameter("p_category"))) {
		case 1:
			pDAO.getProductByCategory(req, p);
			return "ldw/outer/padding";
		case 2:
			pDAO.getProductByCategory(req, p);
			return "ldw/outer/coat";
		case 3:
			pDAO.getProductByCategory(req, p);
			return "ldw/outer/fieldJacket";
		case 4:
			pDAO.getProductByCategory(req, p);
			return "ldw/top/knitwear";
		case 5:
			pDAO.getProductByCategory(req, p);
			return "ldw/top/shirt";
		case 6:
			pDAO.getProductByCategory(req, p);
			return "ldw/top/tShirt";
		case 9:
			pDAO.getProductByCategory(req, p);
			return "sh/bottom/pants";
		case 10:
			pDAO.getProductByCategory(req, p);
			return "sh/bottom/denim";
		case 12:
			pDAO.getProductByCategory(req, p);
			return "sh/bottom/shorts";
		case 13:
			pDAO.getProductByCategory(req, p);
			return "sh/etc/acc";
		case 14:
			pDAO.getProductByCategory(req, p);
			return "sh/etc/bag";
		case 15:
			pDAO.getProductByCategory(req, p);
			return "sh/etc/shoes";
		default:
			break;
		}
		return "";
		
		
	}
	
	@RequestMapping(value = "product.update.go")
	public String updateProductGo(Product p, HttpServletRequest req) {
		pDAO.goDetail(p, req);
		pDAO.getDetail(p, req);
		
//		pDAO.updateProduct(p,req);
		
		return "ldw/productUpdate";
	}
	
	@RequestMapping(value = "product.update.do",method = RequestMethod.POST)
	public String updateProductDo(Product p, HttpServletRequest req, MultipartHttpServletRequest file) {
	 pDAO.updateProduct(p,req, file);
	 pDAO.goDetail(p, req);
		
		return "sh/detail";
	}
	
	// favorite 등록 (찜하기)
	@RequestMapping(value = "/favorite.do", method = RequestMethod.GET)
	public String favoriteInsert(Account a,Product p, HttpServletRequest req) {
		//찜하기 등록
		aDAO.loginCheck(req);
		pDAO.insertFavorite(a,p,req);
		aDAO.setFavorites(p, a, req);
		
		//디테일 구하기
		pDAO.goDetail(p, req);
		pDAO.getDetail(p,req);

		return "sh/detail";
	}
	// favorite 취소 (찜하기)
	@RequestMapping(value = "/favoriteCancle.do", method = RequestMethod.GET)
	public String favoriteDelete(Account a,Product p, HttpServletRequest req) {
		
		//찜하기 취소
		aDAO.loginCheck(req);
		aDAO.setFavorites(p, a, req);
		pDAO.deleteFavorite(a,p,req);
		
		//디테일 구하기
		pDAO.goDetail(p, req);
		pDAO.getDetail(p,req);
		
		return "sh/detail";
	}
	
	@RequestMapping(value = "product.search", method = RequestMethod.GET)
	public String productSearch(Product p, HttpServletRequest req) {
		pDAO.getSearchProduct(p,req);
		
		return "ldw/searchProduct";
	}
	@RequestMapping(value = "/buy.go", method = RequestMethod.GET)
	public String goBuyPage(Product p, Account a, HttpServletRequest req) {
		
		//디테일 구하기
		pDAO.goDetail(p, req);
		pDAO.getDetail(p,req);
		
		
		return "kmj/buyPage";
	}
	@RequestMapping(value = "/buy.do", method = RequestMethod.POST)
	public String doBuyPage(Product p, Account a, HttpServletRequest req, CartDTO cart) {
		aDAO.loginCheck(req);
		//구매하는 일
		pDAO.buyProduct(p,cart,req);
		//구매이력 남기는 일
		pDAO.regOrderList(p,cart,a,req);
		
		
		//디테일 구하기
		pDAO.goDetail(p, req);
		pDAO.getDetail(p,req);
		
		return "sh/detail";
	}
	
	
	
	
}
