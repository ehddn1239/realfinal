package com.sdm.fj.cart;

import java.util.List;

public interface CartMapper {

	int addCart(CartDTO cart);

	List<CartDTO> getAllCart(CartDTO c);

	CartDTO getImg(CartDTO c);

	int deleteCart(CartDTO c);

	int deleteCartAll(CartDTO c);

	
	
	
}
