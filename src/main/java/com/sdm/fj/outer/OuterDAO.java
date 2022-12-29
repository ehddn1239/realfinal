package com.sdm.fj.outer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OuterDAO {
	@Autowired
	private SqlSession ss;


	public void getAllOuterPadding(HttpServletRequest req) {
		OuterMapper om = ss.getMapper(OuterMapper.class);
		List<OuterDTO> outers = om.showAllOuterPadding();
		req.setAttribute("padding", outers);	
	}


	public void getAllOuterCoat(HttpServletRequest req) {
		OuterMapper om = ss.getMapper(OuterMapper.class);
		List<OuterDTO> outers = om.showAllOuterCoat();
		req.setAttribute("coat", outers);
		
	}


	public void getAllOuterFieldJacket(HttpServletRequest req) {
		OuterMapper om = ss.getMapper(OuterMapper.class);
		List<OuterDTO> outers = om.showAllOuterFieldJacket();
		req.setAttribute("fieldJacket", outers);
		
	}
}
