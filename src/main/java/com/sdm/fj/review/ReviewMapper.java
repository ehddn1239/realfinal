package com.sdm.fj.review;

import java.util.List;



public interface ReviewMapper {

	int regReview(Review r);

	List<Review> getReviewProducts(int r_no);

	int deleteReview(Review r);


	int getReveiewCount(int p_no);

}
