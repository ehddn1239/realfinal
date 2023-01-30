package com.sdm.fj.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.fj.account.Account;
import com.sdm.fj.product.Product;
import com.sdm.fj.product.ProductMapper;



@Service
public class CartDAO {
	@Autowired
	private SqlSession ss;

	
	public void addcart(Product p ,CartDTO cart, HttpServletRequest req) {
		System.out.println("-------addCart함수 시작---------");
		Account aa = (Account) req.getSession().getAttribute("loginAccount");
		if(aa != null) {
		cart.setA_id(aa.getA_id());
		System.out.println(aa.getA_id());

		Product pp= ss.getMapper(ProductMapper.class).getProduct(p);
		System.out.println("p_size = " + p.getP_size());
		cart.setP_no(p.getP_no());
		cart.setP_name(pp.getP_name());
		cart.setP_price(pp.getP_price());
		cart.setP_color(pp.getP_color());
		cart.setP_size(req.getParameter("p_size"));
		int cart_qty = Integer.parseInt( req.getParameter("cart_qty"));
		System.out.println("수량" + cart_qty);
		cart.setCart_qty(cart_qty);
		
		
		
		System.out.println(pp.getP_price());
		System.out.println(pp.getP_color());
		
		
		
		
		String[] imgSplit = pp.getP_img().split("!");
		ArrayList<String> imgs = new ArrayList<String>();
		for (String s : imgSplit) {
			System.out.println("한글" + s);
			imgs.add(s);
			
			
		}
		cart.setP_img(imgSplit[0]);

		
		
		if(ss.getMapper(CartMapper.class).addCart(cart) == 1) {
			System.out.println("장바구니 등록 성공");
		}else {
			System.out.println("장바구니 등록 실패");
		}
		

		
		
		
		}else {
			System.out.println("로그인 후 이용하세요");
		}
		
		
	}


	public void getAllCart(CartDTO c, HttpServletRequest req) {
		
		CartMapper cm = ss.getMapper(CartMapper.class);
	
		List<CartDTO> carts = cm.getAllCart(c);
		
		
		
		System.out.println("1111");
		
	
		
		
//		List<CartDTO> carts2 = new ArrayList<CartDTO>();
//		// System.out.println(imgSplit);
//		
//
//		for (CartDTO cc : carts) {
//			String[] imgs = cc.getP_img().split("!");
//			System.out.println(imgs);
//			cc.setP_img(imgs[0]);
//			carts2.add(cc);
//		}

		
		
		req.setAttribute("cart", carts);
		
		
		
	}


	public void deleteCart(CartDTO c,HttpServletRequest req) {
	
		CartMapper cm =  ss.getMapper(CartMapper.class);
		if(cm.deleteCart(c) ==1) {
			System.out.println("삭제완료");
		}else {
			System.out.println("삭제실패");
		}
		
	}


	public void deleteCartAll(CartDTO c, HttpServletRequest req) {
		CartMapper cm =  ss.getMapper(CartMapper.class);
		if(cm.deleteCartAll(c) >=1) {
			System.out.println("삭제완료");
		}else {
			System.out.println("삭제실패");
		}
		
	}
	
	

}
