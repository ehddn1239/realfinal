package com.sdm.fj.account;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.fj.product.Product;

@Service
public class AccountDAO {

	@Autowired
	private SqlSession ss;

	public void register(Account a, HttpServletRequest req) {

		String id = req.getParameter("a_id");
		String pw = req.getParameter("a_pw");
		String nickname = req.getParameter("a_nickname");
		String addr = req.getParameter("a_addr");
		String email = req.getParameter("a_email");
		String phone = req.getParameter("a_phone");
		String postAddr = req.getParameter("a_post");
		
		
				

		a.setA_id(id);
		a.setA_pw(pw);
		a.setA_nickname(nickname);
		a.setA_addr(addr);
		a.setA_email(email);
		a.setA_phone(phone);
		a.setA_post(postAddr);

		if (ss.getMapper(AccountMapper.class).register(a) == 1) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("DB등록 실패");
		}
	}

	public void login(Account a, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String id = req.getParameter("a_id");
		String pw = req.getParameter("a_pw");
		Account aa = ss.getMapper(AccountMapper.class).login(a);
		
		res.setContentType("text/html; utf-8");
		PrintWriter out = res.getWriter();

		if (aa != null) {
			if (aa.getA_pw().equals(pw)) {
				req.getSession().setAttribute("loginAccount", aa);
				req.getSession().setMaxInactiveInterval(60 * 10);
				System.out.println("로그인  성공");

			} else {
				out.println("<script language ='javascript'>");
				out.println("alert('비밀번호가 틀렸습니다');");
				out.println("location.href='gohome.go';");
				out.println("</script>");
				out.flush();

				System.out.println("로그인 실패(비밀번호 오류)");
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
			out.println("<script language ='javascript'>");
			out.println("alert('아이디가 틀렸습니다');");
			out.println("location.href='gohome.go';");
			out.println("</script>");
			out.flush();
			System.out.println("로그인 실패(아이디 오류)");
		}

	}

	public boolean loginCheck(HttpServletRequest req) {
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		if (a != null) {
			String rank = "";

			if (a.getA_exp() >= 5000 && a.getA_exp() < 10000) {
				rank = "Silver";
			} else if (a.getA_exp() >= 10000 && a.getA_exp() < 15000) {
				rank = "Gold";
			} else if (a.getA_exp() >= 15000 && a.getA_exp() < 20000) {
				rank = "Platinum";
			} else if (a.getA_exp() >= 20000) {
				rank = "Diamond";
			} else {
				rank = "Bronze";
			}
			Account a2 = new Account();
			a2.setA_id(a.getA_id());
			a2.setA_rank(rank);

			if (ss.getMapper(AccountMapper.class).changeRank(a2) == 1) {
			} else {
			}
			req.setAttribute("rank", rank);
			req.setAttribute("loginCheck", 0);
			return true;

		}
		req.setAttribute("loginCheck", 1);
		return false;

	}

	public void logout(HttpServletRequest req) {
		req.getSession().invalidate();
	}

	public String checkID(Account a, HttpServletRequest req) {

		String aaa = a.getA_id();
		System.out.println("aaa는? " + aaa);
		int aa = ss.getMapper(AccountMapper.class).checkId(a);

		if (aa == 0) {
			return "N";
		}
		return "Y";

	}

	public void findPw(HttpServletResponse response, Account a) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		Account ck = ss.getMapper(AccountMapper.class).findPW(a);
		PrintWriter out = response.getWriter();
		// 가입된 아이디와 이메일이 일치하는게 없다면
		if (ck == null) {
			out.println("<script language ='javascript'>");
			out.println("alert('등록되지 않은 아이디 혹은 이메일 입니다.');");
			out.println("location.href='findpw.go';");
			out.println("</script>");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			a.setA_pw(pw);
			// 비밀번호 변경
			if (ss.getMapper(AccountMapper.class).changePW(a) > 0) {
				// 비밀번호 변경 메일 발송
				sendEmail(a, "findpw");
				out.println("<script language ='javascript'>");
				out.println("alert('이메일로 임시 비밀번호를 발송하였습니다.');");
				out.println("location.href='gohome.go';");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script language ='javascript'>");
				out.println("alert('이메일로 임시 비밀번호를 발송을 실패 하였습니다.');");
				out.println("location.href='findpw.go';");
				out.close();
			}

		}
	}

	// 특정 아이디 조회할떄 쓸라고 만듬
	public void getAccount(Account a, HttpServletRequest req) {
		Account aa = ss.getMapper(AccountMapper.class).getAccount(a);
		if (aa != null) {
			req.setAttribute("loginAccount", aa);
		} else {
			System.out.println("조회할 아이디가 없음");
		}

	}

	private void sendEmail(Account a, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com //구글 smtp.gmail.com
		String hostSMTPid = "gmlwhd43@gmail.com"; // 서버 이메일 쓰기 (보내는 사람)
		String hostSMTPpwd = "wxrlicuhmwjztclt"; // 서버 이메일 비번

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "SDMProject@naver.com";
		String fromName = "프로젝트이름";
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += a.getA_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += a.getA_pw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = a.getA_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // 네이버 이용시 587 //구글은 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	public void changeInfo(Account a, HttpServletRequest req) {

		String pw = req.getParameter("pw");
		String addr = req.getParameter("addr");
		String nickname = req.getParameter("nickname");
		String phone = req.getParameter("phone");

		Map<String, String> value = new HashMap<String, String>();

		value.put("n_pw", pw);
		value.put("n_addr", addr);
		value.put("n_nickname", nickname);
		value.put("n_nowID", a.getA_id());
		value.put("n_phone", phone);

		if (ss.getMapper(AccountMapper.class).changeInfo(value) == 1) {
			System.out.println("정보 수정 완료!");
			Account info = ss.getMapper(AccountMapper.class).showAllInfo(value);
			req.getSession().setAttribute("loginAccount", info);
			req.getSession().setMaxInactiveInterval(60 * 10);
		} else {
			System.out.println("수정 실패!");
		}
	}

	public void showClient(HttpServletRequest req) {
		List<Account> accounts = ss.getMapper(AccountMapper.class).getAllClient();
		req.setAttribute("showAllClients", accounts);

	}

	public void sendReq(Account a, RequestSeller r, HttpServletRequest req) {

		int rr = ss.getMapper(RequestMapper.class).regRequest(r);

		if (rr == 1) {
			System.out.println("판매자 권한 요청 성공");
			if (ss.getMapper(AccountMapper.class).updateRequest(a) == 1) {
				System.out.println("account테이블 status 1로 변경 완료");
			} else {
				System.out.println("account테이블 status 1로 변경 실패..ㅠㅠ");
			}
		} else {
			System.out.println("판매자 권한 요청 실패");
		}

	}

	public void showRequest(HttpServletRequest req) {
		List<RequestSeller> requests = ss.getMapper(RequestMapper.class).showAll();
		req.setAttribute("requests", requests);
	}

	public void updateUserType(Account a, RequestSeller r, HttpServletRequest req) {

		String nickname = req.getParameter("r_nickname");
		String marketname = req.getParameter("r_marketname");
		String id = req.getParameter("r_id");
		System.out.println("닉네임 : " + nickname + "marketname : " + marketname);

		HashMap<String, String> val = new HashMap<String, String>();
		val.put("nick", nickname);
		val.put("market", marketname);
		val.put("id", id);

		if (ss.getMapper(AccountMapper.class).updateReq(val) > 0) {
			System.out.println("변경 완료");
			if (ss.getMapper(RequestMapper.class).deleteReq(val)) {
				System.out.println("신청서 삭제 완료");
			}

		} else {
			System.out.println("실패 ㅠㅠ");
		}

	}
	public void deleteAccount(Account a) {
		if (ss.getMapper(AccountMapper.class).delete(a) == 1) {

			System.out.println("계정 삭제 완료");
		} else {
			System.out.println("삭제 실패");
		}
	}

	public void setFavorites(Product p, Account a, HttpServletRequest req) {
		System.out.println("---------setFavorites함수 시작-------------");
		Account aa = (Account) req.getSession().getAttribute("loginAccount");
		String favors = ss.getMapper(AccountMapper.class).selectFavor(aa);
		System.out.println("-----favors의 내용 = " + favors);
		System.out.println("p_no = " + p.getP_no());
		String pno = Integer.toString(p.getP_no());
		String[] favorites = favors.split(", ");
		aa.setFavorites(favorites);
		for (String s : favorites) {
			if (s.equals(pno)) {
				req.setAttribute("checkFavorite", 1);
				break;
			} else {
				req.setAttribute("checkFavorite", 0);
			}
		}
		req.setAttribute("favorites", favorites);
	}

	public boolean checkUserType(HttpServletRequest req) {
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		if (a.getA_userType() == 2 || a.getA_userType() == 3) {
			return false;
		}
		return true;
	}

	public String kakaoPay(String id, int money, HttpServletRequest req) {
		try {

			System.out.println("-----------kakaoPay함수 시작--------------");
			String a_id = id;
			System.out.println("a_id = " + a_id);

			int a_cash = money;
			System.out.println("a_cash = " + a_cash);

			String approval_url = "http://localhost:8080/fj/doCharge?money=" + a_cash;
			System.out.println("approval_url = " + approval_url);

			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection) address.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK eae68a80f7adc3a998cc4fecc3c323a2");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=kimmoonjong&quantity=1&total_amount="+ a_cash +"&vat_amount=200&tax_free_amount=0&approval_url="
					+ approval_url
					+ "&fail_url=http://localhost:8080/fj/gohome.go&cancel_url=http://localhost:8080/fj/goFail.go";
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

	public void chargeMoney(int money, HttpServletRequest req) {
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		String id = a.getA_id();
		Charger c = new Charger();
		c.setId(id);
		c.setMoney(money);

		if (ss.getMapper(AccountMapper.class).chargeMoney(c) == 1) {
			System.out.println("충전 성공");
		}

	}

}
