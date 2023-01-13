package com.sdm.fj.account;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

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
	public String changeInfoDo(Account a, HttpServletRequest req) {

		// 정보 바꿔주는 일
		// 보여주는일도 같이합니다~
		aDAO.changeInfo(a, req);

		return "kmj/myPage";
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
	public String sendReq(Account a, RequestSeller r, HttpServletRequest req) {

		// 신청서 보내는 일(등록)
		aDAO.sendReq(a, r, req);

		// 회원 정보 보여주는 일
		aDAO.getAccount(a, req);

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

	// 찜한거 불러오기
	@RequestMapping(value = "/showAllFavors.do", method = RequestMethod.GET)
	public String showAllFavors(Product p, Account a, HttpServletRequest req) {
		aDAO.loginCheck(req);

		// 찜 목록 게시글 따로 조회하기
		pDAO.showClientFavors(req, p);

		// 회원 정보 보여주는 일
		aDAO.getAccount(a, req);

		return "kmj/myPage";
	}

	@ResponseBody
	@RequestMapping(value = "/kakaoPay")
	public String kakaoPay() {
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection) address.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK eae68a80f7adc3a998cc4fecc3c323a2");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=kimmoonjong&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:8080/fj/gohome.go&fail_url=http://localhost:8080/fj/gohome.go&cancel_url=http://localhost:8080/fj/gohome.go";
			OutputStream out = con.getOutputStream(); // 주는 역할
			DataOutputStream dos = new DataOutputStream(out); // 데이터 주는 역할
			dos.writeBytes(param);
			dos.close();

			int result = con.getResponseCode();

			InputStream is;

			// http에서 정상적 결과는 200 나머지는 그냥 에러
			if (result == 200) {
				is = con.getInputStream();
			} else {
				is = con.getErrorStream();
			}
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			return br.readLine();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
