package com.sdm.fj;

import java.util.List;

public interface ProductMapper {

	List<Product> getAllProducts();

	int regProducts(Product p);

}


