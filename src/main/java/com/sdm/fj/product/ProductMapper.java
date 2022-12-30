package com.sdm.fj.product;

import java.util.List;

public interface ProductMapper {

	List<Product> getAllProducts();

	int regProducts(Product p);

	List<Product> getProductByCategory(int p_category);

}


