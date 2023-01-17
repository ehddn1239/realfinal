package com.sdm.fj.product;

import java.util.List;

public interface ProductMapper {

	List<Product> getAllProducts();

	int regProducts(Product p);

	List<Product> getProductByCategory(int p_category);

	Product getProduct(Product p);

	int deleteProduct(Product p);

	int updateProduct(Product p);

	Product getProductforFavor(String s);

	List<Product> getSearchProduct(Product p);

	String getPname(int pno);

}
