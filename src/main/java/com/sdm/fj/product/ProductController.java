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
import com.sdm.fj.cart.CartDAO;
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
	@Autowired
	private CartDAO cDAO;

	@RequestMapping(value = "allProduct.go", method = RequestMethod.GET)
	public String allProduct(Criteria cri, Product p, HttpServletRequest req) {
//		pDAO.getAllProducts(p, req);
		PageVO pageVO = new PageVO(cri, pDAO.getTotal());
		req.setAttribute("pageVO", pageVO);
		pDAO.getList(cri, req);
		return "ldw/All/allProduct";
	}

	@RequestMapping(value = "allNewProduct.select", method = RequestMethod.GET)
	public String allNewProductSelect(Criteria cri, Product p, HttpServletRequest req) {

		PageVO pageVO = new PageVO(cri, pDAO.getTotal());

		String newProduct = req.getServletPath().substring(1, 13);
		System.out.println(newProduct);
		pageVO.setSort(newProduct);

		req.setAttribute("pageVO", pageVO);

		if (Integer.parseInt(req.getParameter("p_category")) == 0) {
			pDAO.getNewProducts(cri, req);
			return "ldw/All/allProduct";
		} else {
			int p_category = Integer.parseInt(req.getParameter("p_category"));
			switch (p_category) {
			case 1:
				pDAO.getNewProducts(cri, req);
				return "ldw/outer/padding";
			case 2:
				pDAO.getNewProducts(cri, req);
				return "ldw/outer/coat";
			case 3:
				pDAO.getNewProducts(cri, req);
				return "ldw/outer/fieldJacket";
			case 4:
				pDAO.getNewProducts(cri, req);
				return "ldw/top/knitwear";
			case 5:
				pDAO.getNewProducts(cri, req);
				return "ldw/top/shirt";
			case 6:
				pDAO.getNewProducts(cri, req);
				return "ldw/top/tShirt";
			case 9:
				pDAO.getNewProducts(cri, req);
				return "sh/bottom/pants";
			case 10:
				pDAO.getNewProducts(cri, req);
				return "sh/bottom/denim";
			case 12:
				pDAO.getNewProducts(cri, req);
				return "sh/bottom/shorts";
			case 13:
				pDAO.getNewProducts(cri, req);
				return "sh/etc/acc";
			case 14:
				pDAO.getNewProducts(cri, req);
				return "sh/etc/bag";
			case 15:
				pDAO.getNewProducts(cri, req);
				return "sh/etc/shoes";
			default:
				break;
			}
		}
		return "";
	}

	@RequestMapping(value = "allHighProduct.select", method = RequestMethod.GET)
	public String allHighProductSelect(Criteria cri, Product p, HttpServletRequest req) {

		PageVO pageVO = new PageVO(cri, pDAO.getTotal());

		String highPrice = req.getServletPath().substring(1, 13);
		System.out.println(highPrice);
		pageVO.setSort(highPrice);

		req.setAttribute("pageVO", pageVO);

		if (Integer.parseInt(req.getParameter("p_category")) == 0) {
			pDAO.getHighPriceProducts(cri, req);
			return "ldw/All/allProduct";
		} else {
			int p_category = Integer.parseInt(req.getParameter("p_category"));
			switch (p_category) {
			case 1:
				pDAO.getHighPriceProducts(cri, req);
				return "ldw/outer/padding";
			case 2:
				pDAO.getHighPriceProducts(cri, req);
				return "ldw/outer/coat";
			case 3:
				pDAO.getHighPriceProducts(cri, req);
				return "ldw/outer/fieldJacket";
			case 4:
				pDAO.getHighPriceProducts(cri, req);
				return "ldw/top/knitwear";
			case 5:
				pDAO.getHighPriceProducts(cri, req);
				return "ldw/top/shirt";
			case 6:
				pDAO.getHighPriceProducts(cri, req);
				return "ldw/top/tShirt";
			case 9:
				pDAO.getHighPriceProducts(cri, req);
				return "sh/bottom/pants";
			case 10:
				pDAO.getHighPriceProducts(cri, req);
				return "sh/bottom/denim";
			case 12:
				pDAO.getHighPriceProducts(cri, req);
				return "sh/bottom/shorts";
			case 13:
				pDAO.getHighPriceProducts(cri, req);
				return "sh/etc/acc";
			case 14:
				pDAO.getHighPriceProducts(cri, req);
				return "sh/etc/bag";
			case 15:
				pDAO.getHighPriceProducts(cri, req);
				return "sh/etc/shoes";
			default:
				break;
			}
		}
		return "";
	}

	@RequestMapping(value = "allLowProduct.select", method = RequestMethod.GET)
	public String allLowProductSelect(Product p, HttpServletRequest req, Criteria cri) {

//		pDAO.getLowPriceProducts(p, req);

		PageVO pageVO = new PageVO(cri, pDAO.getTotal());

		String lowProduct = req.getServletPath().substring(1, 13);
		System.out.println(lowProduct);
		pageVO.setSort(lowProduct);

		req.setAttribute("pageVO", pageVO);

		if (Integer.parseInt(req.getParameter("p_category")) == 0) {
			pDAO.getLowPriceProducts(cri, req);
			return "ldw/All/allProduct";
		} else {
			int p_category = Integer.parseInt(req.getParameter("p_category"));
			switch (p_category) {
			case 1:
				pDAO.getLowPriceProducts(cri, req);
				return "ldw/outer/padding";
			case 2:
				pDAO.getLowPriceProducts(cri, req);
				return "ldw/outer/coat";
			case 3:
				pDAO.getLowPriceProducts(cri, req);
				return "ldw/outer/fieldJacket";
			case 4:
				pDAO.getLowPriceProducts(cri, req);
				return "ldw/top/knitwear";
			case 5:
				pDAO.getLowPriceProducts(cri, req);
				return "ldw/top/shirt";
			case 6:
				pDAO.getLowPriceProducts(cri, req);
				return "ldw/top/tShirt";
			case 9:
				pDAO.getLowPriceProducts(cri, req);
				return "sh/bottom/pants";
			case 10:
				pDAO.getLowPriceProducts(cri, req);
				return "sh/bottom/denim";
			case 12:
				pDAO.getLowPriceProducts(cri, req);
				return "sh/bottom/shorts";
			case 13:
				pDAO.getLowPriceProducts(cri, req);
				return "sh/etc/acc";
			case 14:
				pDAO.getLowPriceProducts(cri, req);
				return "sh/etc/bag";
			case 15:
				pDAO.getLowPriceProducts(cri, req);
				return "sh/etc/shoes";
			default:
				break;
			}
		}

		return "";
	}

	@RequestMapping(value = "productReg.go", method = RequestMethod.GET)
	public String goRegProduct(Product p, HttpServletRequest req) {
		if (aDAO.loginCheck(req) == false) {
			// ?????? ?????? ???????????? ????????? 2??? 3??? false??? ?????????( ?????????, ?????????)
			// 1??? true??? ?????????
			if (aDAO.checkUserType(req)) {
				req.setAttribute("reg", "???????????? ????????? ?????????!");
			}
			req.setAttribute("reg", "????????? ?????? ?????????!");
			return "index";
		}

		return "ldw/productReg";
	}

	@RequestMapping(value = "showByCategory", method = RequestMethod.GET)
	public String goByCategory(Criteria cri, HttpServletRequest req, Product p) {

		int p_category = Integer.parseInt(req.getParameter("p_category"));
		cri.setP_category(p_category);
		// System.out.println(p_category);
		PageVO pageVO = new PageVO(cri, pDAO.getTotalByCate(cri, req));
		req.setAttribute("pageVO", pageVO);
		switch (p_category) {
		case 1:
//			pDAO.getProductByCategory(req, p);
			pDAO.getListByCate(cri, req);
			return "ldw/outer/padding";
		case 2:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "ldw/outer/coat";
		case 3:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "ldw/outer/fieldJacket";
		case 4:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "ldw/top/knitwear";
		case 5:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "ldw/top/shirt";
		case 6:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "ldw/top/tShirt";
		case 9:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "sh/bottom/pants";
		case 10:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "sh/bottom/denim";
		case 12:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "sh/bottom/shorts";
		case 13:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "sh/etc/acc";
		case 14:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "sh/etc/bag";
		case 15:
			pDAO.getListByCate(cri, req);
			// pDAO.getProductByCategory(req, p);
			return "sh/etc/shoes";
		default:
			break;
		}

		return "index";
	}

	@RequestMapping(value = "reg.products.do", method = RequestMethod.POST)
	public String regProduct(Product p, HttpServletRequest req, MultipartHttpServletRequest file) {
		aDAO.loginCheck(req);
		pDAO.regProducts(p, req, file);
		return "ldw/productReg";
	}

	@RequestMapping(value = "detail.go")
	public String goDetail(OrderList o, Account a, Product p, HttpServletRequest req, Review r) {

		if(aDAO.loginCheck(req)) {
			aDAO.setFavorites(p, a, req);
		}
		pDAO.goDetail(p, req);
		pDAO.getDetail(p, req);
		rDAO.getReviewCount(req,r,p);
		rDAO.productReviewSelect(req, r, p, a);
		return "sh/detail";
	}

	@RequestMapping(value = "product.delete.do", method = RequestMethod.GET)
	public String deleteProduct(Product p, HttpServletRequest req, Criteria cri) {
		int p_category = Integer.parseInt(req.getParameter("p_category"));
		cri.setP_category(p_category);
		// System.out.println(p_category);
		PageVO pageVO = new PageVO(cri, pDAO.getTotalByCate(cri, req));
		req.setAttribute("pageVO", pageVO);
		pDAO.deleteProduct(p, req);

//		pDAO.getProductByCategory(req, p);
		switch (p_category) {
		case 1:
			pDAO.getListByCate(cri, req);
			return "ldw/outer/padding";
		case 2:
			pDAO.getListByCate(cri, req);
			return "ldw/outer/coat";
		case 3:
			pDAO.getListByCate(cri, req);
			return "ldw/outer/fieldJacket";
		case 4:
			pDAO.getListByCate(cri, req);
			return "ldw/top/knitwear";
		case 5:
			pDAO.getListByCate(cri, req);
			return "ldw/top/shirt";
		case 6:
			pDAO.getListByCate(cri, req);
			return "ldw/top/tShirt";
		case 9:
			pDAO.getListByCate(cri, req);
			return "sh/bottom/pants";
		case 10:
			pDAO.getListByCate(cri, req);
			return "sh/bottom/denim";
		case 12:
			pDAO.getListByCate(cri, req);
			return "sh/bottom/shorts";
		case 13:
			pDAO.getListByCate(cri, req);
			return "sh/etc/acc";
		case 14:
			pDAO.getListByCate(cri, req);
			return "sh/etc/bag";
		case 15:
			pDAO.getListByCate(cri, req);
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

	@RequestMapping(value = "product.update.do", method = RequestMethod.POST)
	public String updateProductDo(Product p, HttpServletRequest req, MultipartHttpServletRequest file) {
		pDAO.updateProduct(p, req, file);
		pDAO.goDetail(p, req);

		return "sh/detail";
	}

	// favorite ?????? (?????????)
	@RequestMapping(value = "/favorite.do", method = RequestMethod.GET)
	public String favoriteInsert(Account a, Product p, HttpServletRequest req) {
		// ????????? ??????
		aDAO.loginCheck(req);
		pDAO.insertFavorite(a, p, req);
		aDAO.setFavorites(p, a, req);

		// ????????? ?????????
		pDAO.goDetail(p, req);
		pDAO.getDetail(p, req);

		return "sh/detail";
	}

	// favorite ?????? (?????????)
	@RequestMapping(value = "/favoriteCancle.do", method = RequestMethod.GET)
	public String favoriteDelete(Account a, Product p, HttpServletRequest req) {

		// ????????? ??????
		aDAO.loginCheck(req);
		aDAO.setFavorites(p, a, req);
		pDAO.deleteFavorite(a, p, req);

		// ????????? ?????????
		pDAO.goDetail(p, req);
		pDAO.getDetail(p, req);

		return "sh/detail";
	}

	@RequestMapping(value = "product.search", method = RequestMethod.GET)
	public String productSearch(Product p, HttpServletRequest req) {
		pDAO.getSearchProduct(p, req);

		return "ldw/searchProduct";
	}

	@RequestMapping(value = "/buy.go", method = RequestMethod.GET)
	public String goBuyPage(Product p, Account a, HttpServletRequest req) {

		// ????????? ?????????
		pDAO.goDetail(p, req);
		pDAO.getDetail(p, req);

		return "kmj/buyPage";
	}

	@RequestMapping(value = "/buy.do", method = RequestMethod.POST)
	public String doBuyPage(Product p, Account a, HttpServletRequest req, CartDTO cart, Review r) {
		// ???????????? ???
		pDAO.buyProduct(p, cart, req);
		
		cDAO.deleteCart(cart, req);
		cDAO.getAllCart(cart, req);
		// ???????????? ????????? ???
		pDAO.regOrderList(p, cart, a, req);
		
		if(aDAO.loginCheck(req)) {
			aDAO.setFavorites(p, a, req);
		}
		// ????????? ?????????
		pDAO.goDetail(p, req);
		pDAO.getDetail(p, req);
		rDAO.getReviewCount(req,r,p);
		rDAO.productReviewSelect(req, r, p, a);

		return "sh/detail";
	}

}
