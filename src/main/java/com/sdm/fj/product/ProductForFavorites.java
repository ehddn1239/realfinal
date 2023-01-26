package com.sdm.fj.product;

import java.util.List;

public class ProductForFavorites {
	private List<ProductForFavorite> favors;

	public ProductForFavorites(List<ProductForFavorite> favors) {
		super();
		this.favors = favors;
	}
	
	public ProductForFavorites() {
		// TODO Auto-generated constructor stub
	}

	public List<ProductForFavorite> getFavors() {
		return favors;
	}

	public void setFavors(List<ProductForFavorite> favors) {
		this.favors = favors;
	}
	
	
}
