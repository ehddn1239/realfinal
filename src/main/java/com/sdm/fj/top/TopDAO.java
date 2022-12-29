package com.sdm.fj.top;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TopDAO {

	@Autowired
	private SqlSession ss;

	public void getAllTopKnitwear(HttpServletRequest req) {
		TopMapper tm = ss.getMapper(TopMapper.class);
		List<TopDTO> Tops = tm.showAllTopKnitwear();
		req.setAttribute("Knit", Tops);	
	}

	public void getAllTopShirt(HttpServletRequest req) {
		TopMapper tm = ss.getMapper(TopMapper.class);
		List<TopDTO> Tops = tm.showAllTopShirt();
		req.setAttribute("shirt", Tops);	
	}

	public void getAllTopTshirt(HttpServletRequest req) {
		TopMapper tm = ss.getMapper(TopMapper.class);
		List<TopDTO> Tops = tm.showAllTopTshirt();
		req.setAttribute("Tshirt", Tops);	
	}

	public void getAllTopDress(HttpServletRequest req) {
		TopMapper tm = ss.getMapper(TopMapper.class);
		List<TopDTO> Tops = tm.showAllTopDress();
		req.setAttribute("dress", Tops);	
	}
	
	
}
