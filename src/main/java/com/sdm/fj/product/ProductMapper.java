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
	List<Product> getSearchProduct(Product p);
	
	List<Product> getList(Criteria cri); 		//페이징처리

	int getTotal();

	List<Product> getListByCate(Criteria cri);

	int getTotalByCate(Criteria cri);

}


