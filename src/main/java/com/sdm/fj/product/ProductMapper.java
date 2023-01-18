package com.sdm.fj.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ProductMapper {

	List<Product> getAllProducts();

	int regProducts(Product p);

	List<Product> getProductByCategory(int p_category);

	Product getProduct(Product p);

	int deleteProduct(Product p);

	int updateProduct(Product p);

	Product getProductforFavor(String s);


	
	List<Product> getList(Criteria cri); 		//페이징처리

	int getTotal();

	List<Product> getListByCate(Criteria cri);

	int getTotalByCate(Criteria cri);


	List<Product> getSearchProduct(Product p);


	String getPname(int pno);
	List<Product> gethighPriceProducts(Criteria cri);

	List<Product> getLowPriceProducts(int p_category);

	List<Product> getNewProducts(int p_category);

	
}
