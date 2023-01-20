package com.sdm.fj.review;

import java.util.List;

public interface ReviewMapper {

	int regReview(Review r);

	List<Review> getReviewProducts(int r_no);

}
