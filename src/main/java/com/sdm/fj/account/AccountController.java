package com.sdm.fj.account;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AccountController {

	@Autowired
	AccountDAO aDAO;
	
	@RequestMapping(value = "/account.reg.do", method = RequestMethod.POST)
	public String register(Account a, HttpServletRequest req) {
		
		aDAO.register(a, req);
		
		aDAO.loginCheck(req);
		return "index";
	}
	@RequestMapping(value = "/account.login.do", method = RequestMethod.POST)
	public String login(Account a, HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		aDAO.login(a, req, res);
		if(aDAO.loginCheck(req)) {
			return "index";
		}else {
			return "index";
		}
	}
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		
		aDAO.logout(req);
		aDAO.loginCheck(req);
		return "index";
	}
	@RequestMapping(value = "/myPage.go", method = RequestMethod.POST)
	public String myPage(Account a, HttpServletRequest req) {
		
		aDAO.loginCheck(req);
		return "kmj/myPage";
	}
	@RequestMapping(value = "/deliveryTrackingGo", method = RequestMethod.GET)
	public String deliveryTrackingGo(){
		
		
		
		return "ldw/deliveryTracking";
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkId.go", method = RequestMethod.GET)
	public String checkId(@RequestParam("a_id") String id, Account a, HttpServletRequest req){
		System.out.println(id);
		return aDAO.checkID(a, req);
	}
	
	/*
	 * 비밀번호찾기 파트
	 * 
	 * */
	@RequestMapping(value = "/findpw.go", method = RequestMethod.GET)
	public String findPwGo(Account a, HttpServletResponse response, HttpServletRequest req) throws Exception{
		
		return "kmj/findPW";
	}
	
	@RequestMapping(value = "/findpw.do", method = RequestMethod.POST)
	public String findPwDo(Account a, HttpServletResponse response, HttpServletRequest req) throws Exception{
		
		aDAO.findPw(response, a);
		
		return "kmj/findPW";
	}
	
	/*
	 * 정보수정 파트
	 * 
	 */
	@RequestMapping(value = "/changeInfo.go", method = RequestMethod.GET)
	public String changeInfoGo(Account a,HttpServletRequest req){
		
		aDAO.loginCheck(req);
		return "kmj/changeInfo";
	}
	
	@RequestMapping(value = "/changeInfo.do", method = RequestMethod.POST)
	public String changeInfoDo(Account a,HttpServletRequest req){
		
		// 정보 바꿔주는 일
		//	보여주는일도 같이합니다~
		aDAO.changeInfo(a,req);
		
		return "kmj/myPage";
	}
	
	/*
	 * 		판매자로 요청하는 파트
	 * 
	 */
	@RequestMapping(value = "/reg.seller.do", method = RequestMethod.GET)
	public String wantSeller(Account a,HttpServletRequest req){
		
		// 판매자로 바꿔주는 역할
		aDAO.changeToSeller(a);
		
		
		return "kmj/myPage";
	}
	
	
	
	
	
	
	
}
