package com.sdm.fj.etc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EtcDAO {

	@Autowired
	private SqlSession ss;
	
	public void getAllAccessory(HttpServletRequest req) {
		
		EtcMapper em = ss.getMapper(EtcMapper.class);
		List<EtcDTO> acc = em.showAllAccessory();
		req.setAttribute("acc", acc);
		
	}

	public void getAllBag(HttpServletRequest req) {
		
		EtcMapper em = ss.getMapper(EtcMapper.class);
		List<EtcDTO> bag = em.showAllBag();
		req.setAttribute("bag", bag);
		
	}

	public void getAllShoes(HttpServletRequest req) {
		
		EtcMapper em = ss.getMapper(EtcMapper.class);
		List<EtcDTO> shoes = em.showAllShoes();
		req.setAttribute("shoes", shoes);
		
	}

}
