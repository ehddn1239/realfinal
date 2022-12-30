package com.sdm.fj.top;

import java.util.List;

public interface TopMapper {

	List<TopDTO> showAllTopKnitwear();

	List<TopDTO> showAllTopShirt();

	List<TopDTO> showAllTopTshirt();

	List<TopDTO> showAllTopDress();

}
