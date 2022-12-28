package com.sdm.fj.bottom;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BottomDAO {
	
	@Autowired
	private SqlSession ss;

	public void getAllPants(HttpServletRequest req) {

		BottomMapper bm = ss.getMapper(BottomMapper.class);
		List<BottomDTO> pants = bm.showAllPants();
		req.setAttribute("pants", pants);
		
		
	}

	
	

}