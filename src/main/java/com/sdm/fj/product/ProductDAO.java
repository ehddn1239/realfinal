package com.sdm.fj.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ProductDAO {

	@Autowired
	private SqlSession ss;
	
	public void getAllProducts(Product p, HttpServletRequest req) {
		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> products = pm.getAllProducts();
		req.setAttribute("products", products);
		
	}
	
	public void getProductByCategory(HttpServletRequest req, Product p) {
		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> products = pm.getProductByCategory(p.getP_category());
		
		req.setAttribute("products", products);
		
	}
	
	public void regProducts(Product p, HttpServletRequest req) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/imgs");
			System.out.println(path);
			MultipartRequest mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
			
			String name = mr.getParameter("p_name");
			String size = mr.getParameter("p_size");
			int price = Integer.parseInt(mr.getParameter("p_price"));
			int category = Integer.parseInt(mr.getParameter("p_category"));
			int stock = Integer.parseInt(mr.getParameter("p_stock"));
			String img = mr.getFilesystemName("p_img");
			String color = mr.getParameter("p_color");

			System.out.println(name);
			System.out.println(size);
			System.out.println(price);
			System.out.println(category);
			System.out.println(stock);
			System.out.println(img);
			System.out.println(color);


			p.setP_name(name);
			p.setP_size(size);
			p.setP_price(price);
			p.setP_category(category);
		
			p.setP_img(img);
			p.setP_color(color);
			

			if (ss.getMapper(ProductMapper.class).regProducts(p) == 1) {
				req.setAttribute("r", "등록 성공!");
			} else {
				req.setAttribute("r", "등록 실패!");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void goDetail(Product p, HttpServletRequest req) {
		
		req.setAttribute("p",ss.getMapper(ProductMapper.class).getProduct(p));
	
	}



}
	
	
	
