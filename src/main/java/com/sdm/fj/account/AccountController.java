package com.sdm.fj.account;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdm.fj.product.Product;
import com.sdm.fj.product.ProductDAO;
import com.sdm.fj.product.ProductForFavorites;

@Controller
public class AccountController {

	@Autowired
	AccountDAO aDAO;

	@Autowired
	ProductDAO pDAO;

	@RequestMapping(value = "/account.reg.do", method = RequestMethod.POST)
	public String register(Account a, HttpServletRequest req) {

		aDAO.register(a, req);

		aDAO.loginCheck(req);
		return "index";
	}

	@RequestMapping(value = "/account.login.do", method = RequestMethod.POST)
	public String login(Account a, HttpServletRequest req, HttpServletResponse res) throws IOException {

		aDAO.login(a, req, res);
		if (aDAO.loginCheck(req)) {
			return "index";
		} else {
			return "index";
		}
	}
	@RequestMapping(value = "/account.reg.do2", method = RequestMethod.POST)
	public String register2(Account a, HttpServletRequest req) {
		
		aDAO.register(a, req);
		
		aDAO.loginCheck(req);
		return "pop";
	}
	
	@RequestMapping(value = "/account.login.do2", method = RequestMethod.POST)
	public String login2(Account a, HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		aDAO.login(a, req, res);
		if (aDAO.loginCheck(req)) {
			return "pop";
		} else {
			return "pop";
		}
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {

		aDAO.logout(req);
		aDAO.loginCheck(req);
		return "index";
	}

	@RequestMapping(value = "/loginPopup.go", method = RequestMethod.GET)
	public String loginPopup(HttpServletRequest req) {
		
		return "kmj/login";
	}
	

	@RequestMapping(value = "/myPage.go", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage(OrderList o, Account a, Product p, HttpServletRequest req) {

		if (aDAO.loginCheck(req)) {
			aDAO.getAccount(a, req);
			// 구매이력 불러오기
			pDAO.showAllOrders(o, req, p);
			// 찜 목록 게시글 따로 조회하기
			pDAO.showClientFavors(req, p);
			// 찜하기 페이징
			pDAO.paging(1, req, p);
			
			return "kmj/myPage";
		}
		return "index";
	}
	
	@RequestMapping(value = "/favorsPaging2", method = RequestMethod.GET,
	produces="application/json; charset=utf-8")
	@ResponseBody
	public ProductForFavorites pagingFavor(@RequestParam("curPageNo") int page, Account a, Product p, HttpServletRequest req) {
			pDAO.showClientFavors(req, p); 
			// 찜하기 페이징
			return pDAO.paging(page, req, p);
	}

	@RequestMapping(value = "/deliveryTrackingGo", method = RequestMethod.GET)
	public String deliveryTrackingGo() {
		return "ldw/deliveryTracking";
	}

	@ResponseBody
	@RequestMapping(value = "/checkId.go", method = RequestMethod.GET)
	public String checkId(@RequestParam("a_id") String id, Account a, HttpServletRequest req) {
		System.out.println(id);
		return aDAO.checkID(a, req);
	}

	/*
	 * 비밀번호찾기 파트
	 * 
	 */
	@RequestMapping(value = "/findpw.go", method = RequestMethod.GET)
	public String findPwGo(Account a, HttpServletResponse response, HttpServletRequest req) throws Exception {

		return "kmj/findPW";
	}

	@RequestMapping(value = "/deleteInfo.do", method = RequestMethod.GET)
	public String deleteDo(Account a, HttpServletResponse response, HttpServletRequest req) throws Exception {

		aDAO.deleteAccount(a);
		aDAO.logout(req);
		aDAO.loginCheck(req);
		return "index";
	}

	@RequestMapping(value = "/findpw.do", method = RequestMethod.POST)
	public String findPwDo(Account a, HttpServletResponse response, HttpServletRequest req) throws Exception {

		aDAO.findPw(response, a);

		return "kmj/findPW";
	}

	/*
	 * 정보수정 파트
	 * 
	 */
	@RequestMapping(value = "/changeInfo.go", method = RequestMethod.GET)
	public String changeInfoGo(Account a, HttpServletRequest req) {

		aDAO.loginCheck(req);
		
		
		
		return "kmj/changeInfo";
	}

	@RequestMapping(value = "/changeInfo.do", method = RequestMethod.POST)
	public String changeInfoDo(OrderList o, Account a, Product p, HttpServletRequest req) {

		// 정보 바꿔주는 일
		// 보여주는일도 같이합니다~
		aDAO.changeInfo(a, req);
		if (aDAO.loginCheck(req)) {
			aDAO.getAccount(a, req);
			// 구매이력 불러오기
			pDAO.showAllOrders(o, req, p);
			// 찜 목록 게시글 따로 조회하기
			pDAO.showClientFavors(req, p);
			// 찜하기 페이징
			pDAO.paging(1, req, p);
			return "kmj/myPage";
		}
		return "index";
//		return "kmj/myPage";
	}

	/*
	 * 관리자 페이지로 이동
	 * 
	 */
	@RequestMapping(value = "/adminPage.go", method = RequestMethod.GET)
	public String wantSeller(Account a, HttpServletRequest req) {

		// 회원들 조회하는 일
		aDAO.showClient(req);

		// 신청서 조회하느 일
		aDAO.showRequest(req);

		return "kmj/adminPage";
	}

	// 판매자 신청 양식 보여주는 곳
	@RequestMapping(value = "/requestSeller.go", method = RequestMethod.GET)
	public String reqSellerPage(Account a, HttpServletRequest req) {

		// 회원 정보 조회
		aDAO.getAccount(a, req);

		return "kmj/requestSellerPage";
	}

	// 판매자 양식 작성 후 요청 보내기
	@RequestMapping(value = "/sendReq.do", method = RequestMethod.GET)
	public String sendReq(Account a, RequestSeller r, HttpServletRequest req, Product p, OrderList o) {

		// 신청서 보내는 일(등록)
		aDAO.sendReq(a, r, req);
		// 구매이력 불러오기
		if (aDAO.loginCheck(req)) {
			aDAO.getAccount(a, req);
			// 구매이력 불러오기
			pDAO.showAllOrders(o, req, p);
			// 찜 목록 게시글 따로 조회하기
			pDAO.showClientFavors(req, p);
			// 찜하기 페이징
			pDAO.paging(1, req, p);
			
			return "kmj/myPage";
		}

		return "kmj/myPage";
	}

	// 관리자가 판매자로 변경하는거 수락
	@RequestMapping(value = "/accept.do", method = RequestMethod.GET)
	public String acceptChange(Account a, RequestSeller r, HttpServletRequest req) {

		// 판매자로 바꾸기
		// 신청서 삭제도 같이
		aDAO.updateUserType(a, r, req);

		// 회원들 조회하는 일
		aDAO.showClient(req);

		// 신청서 조회하느 일
		aDAO.showRequest(req);
		return "kmj/adminPage";
	}

	@ResponseBody
	@RequestMapping(value = "/kakaoPay2")
	public String kakaoPay2(@RequestParam("a_id") String id, @RequestParam("money") int money, HttpServletRequest req) {
		aDAO.kakaoPay(id, money, req);

		return aDAO.kakaoPay(id, money, req);
	}

	@RequestMapping(value = "/kakaoPopup.go")
	public String kakaoPaygo(HttpServletRequest req) {
		aDAO.loginCheck(req);
		return "kmj/kakaoPopup";
	}

	// 카카오 결제 실패 페이지
	@RequestMapping(value = "/goFail.go", method = RequestMethod.GET)
	public String failCharge(Account a, HttpServletRequest req) {
		aDAO.loginCheck(req);
		return "kmj/failPage";
	}

	// 카카오 결제 완료 후 real 결제하는 페이지
	@RequestMapping(value = "/doCharge", method = RequestMethod.GET)
	public String chargeMoney(@RequestParam("money") int money, Charger c, HttpServletRequest req) {

		aDAO.loginCheck(req);

		aDAO.chargeMoney(money, req);

		return "kmj/successPage";
	}

}
