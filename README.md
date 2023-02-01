### :hammer: 소개
Spring Legacy를 활용하여 제작한 남성 의류 쇼핑몰 사이트이다. 타겟 연령층은 20대와 30대를 대상으로 하고 있고, 회원의 종류를 구매자, 판매자로 나누고 이를 관리하는 관리자 계정
으로 전체적인 계정을 조회하고 판매자로 권한을 승인하는 역할을 할 수 있다. 찜하기(위시리스트), 장바구니(카트), 구매이력을 통한 리뷰 등록 기능을 가지고 있고, 결제는 사이트의
고유 캐시를 활용하여 구매 할 수 있다. 캐시는 카카오페이 단일결제 API를 활용하여 충전 할 수 있다. 스마트딜리버리API를 활용하여 운송장 번호로 배송조회를 할 수 있지만, 가상의 
사이트인 관계로 실제 배송을 하지는 않는다. 회원은 각자의 Rank와 Point를 가지고 있고, 결제를 할때 일정 비율 Point를 획득할 수 있다. 획득한 Point의 비율에 따라 사용자의 Rank를
정하고 Rank에 따라 상품의 가격을 할인해주는 기능을 만들었다.


### 📚 주요 기능
1. 카카오페이 단일결제 API를 활용하여 캐시를 구매하고 캐시로 상품을 구매할 수 있는 기능.
2. 결제에 따라 포인트가 쌓이고 쌓인 포인트로 랭크가 정해지고 랭크에 따라 할인율이 정해지는 기능.
3. 스마트택배 API를 활용한 운송장 번호 조회로 배송조회를 할 수 있는 기능.
4. 찜하기(위시리스트) 기능을 제공하고 jQuery와 Ajax를 활용한 페이징 처리.
5. 장바구니 기능과 장바구니에서 바로 결제 할 수 있는 기능.
6. 다양한 상품을 카테고리로 구분하고, 신상품,최신순으로 조회 할 수 있는 기능.
7. 상품의 이름으로 상품을 검색 할 수 있는 기능.
8. 구매이력에서 리뷰를 작성 할 수 있는 기능
9. 관리자 계정으로 판매자와 구매자를 구분하여 조회하고 관리하는 기능.

### :hammer: 기술스택 
<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"><img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">

<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"><img src="https://img.shields.io/badge/sourcetree-blue?style=for-the-badge&logo=sourcetree&logoColor=white">
<img src="https://img.shields.io/badge/discord-purple?style=for-the-badge&logo=discord&logoColor=white">
<img src="https://img.shields.io/badge/eclipse-brown?style=for-the-badge&logo=eclipse&logoColor=white">
<img src="https://img.shields.io/badge/vscode-skyblue?style=for-the-badge&logo=vscode&logoColor=white">

### 📚 담당업무

:bulb: 김문종 : [팀장, 메인 페이지, 마이 페이지, 회원관리, 찜하기, 카카오페이 결제, 비동기처리 페이징, 임시 비밀번호 메일 발송, 구매 이력]

:bulb: 이동우 : [메인 페이지, 상품 페이지, 상품 검색, 배송 조회, 리뷰 등록]

:bulb: 김수현 : [상품 페이지, 장바구니, 헤더, 상품페이지 페이징]

### 📚 ERD
![화면 캡처 2023-02-01 162756](https://user-images.githubusercontent.com/110808552/215978814-204afd43-cded-4971-ba0c-eba804da5514.png)



### 📚 코드
#### 카오페이 결제

```
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
			con.setRequestProperty("Authorization", "KakaoAK [App Key]");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=kimmoonjong&quantity=1&total_amount="+ a_cash +"&vat_amount=200&tax_free_amount=0&approval_url="
					+ approval_url
					+ "&fail_url=http://localhost:8080/fj/goFail.go&cancel_url=http://localhost:8080/fj/goFail.go";
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
```
#### 임시비밀번호 찾기에 앞서 아이디와 이메일 일치 인확인

```
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
```
#### 임시 비밀번호 발송

```
private void sendEmail(Account a, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com //구글 smtp.gmail.com
		String hostSMTPid = "[서버이메일]"; // 서버 이메일 쓰기 (보내는 사람)
		String hostSMTPpwd = "[서버 이메일 앱 비밀번호]"; // 서버 이메일 비번

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "SDMProject@naver.com";
		String fromName = "SDMall 임시비밀번호 발송";
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

```
#### 찜하기 등록과 슬라이싱
```
public void insertFavorite(Account a, Product p, HttpServletRequest req) {
		System.out.println("---------insertFavorite함수--------------");
		String p_no = req.getParameter("p_no");
		String a_id = req.getParameter("a_id");
		System.out.println("p_no = " + p_no);
		System.out.println("a_id = " + a_id);
		String favors = ss.getMapper(AccountMapper.class).selectFavor(a);
		System.out.println("favors에 값을 받은 직후    favors = " + favors);
		if (favors == null || favors.isEmpty()) {
			System.out.println("-----isEmpty를 거침------");
			favors = ", " + p_no;
		} else {
			System.out.println("-----isEmpty를 거치지 않음------");
			favors += ", " + p_no;
		}
		System.out.println("favors에 [, p_no]를 붙인 직후 favors = " + favors);
		HashMap<String, String> val = new HashMap<String, String>();
		val.put("p_list", favors);
		val.put("a_id", a_id);
		if (ss.getMapper(AccountMapper.class).updateFavorite(val) > 0) {
			System.out.println("찜하기 등록");
		}
	}
  public void showClientFavors(HttpServletRequest req, Product p) {
		System.out.println("--------showClientFavors시작-------");
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		HashMap<String, String> val = new HashMap<String, String>();
		val.put("id", a.getA_id());
		String fa = ss.getMapper(AccountMapper.class).getFavor(val);
		if (fa != null) {
			String[] favorsArr = fa.split(", ");
			ArrayList<ProductForFavorite> products = new ArrayList<ProductForFavorite>();

			String sendImg = "";
			for (String s : favorsArr) {
				System.out.println("favorsArr = " + s);
				if (s.equals(" ") || s.equals("")) {
					continue;
				} else {
					System.out.println("else문으로 들어옴 s - " + s);
					Product pp = ss.getMapper(ProductMapper.class).getProductforFavor(s);
					System.out.println("pp.getP_img() = " + pp.getP_img());
					ProductForFavorite pf = new ProductForFavorite();
					int pno = pp.getP_no();
					String pname = pp.getP_name();
					int price = pp.getP_price();
					String[] imgSplit = pp.getP_img().split("!");
					sendImg = imgSplit[0];

					System.out.println("pno = " + pno);
					System.out.println("pname = " + pname);
					System.out.println("price = " + price);
					System.out.println("sendimg = " + sendImg);
					pf.setP_name(pname);
					pf.setP_no(pno);
					pf.setP_price(price);
					pf.setP_img(sendImg);

					products.add(pf);
				}
			}
			req.setAttribute("favorsPNO", products);
		}
	}
```
#### 장바구니
```
public void addcart(Product p ,CartDTO cart, HttpServletRequest req) {
		System.out.println("-------addCart함수 시작---------");
		Account aa = (Account) req.getSession().getAttribute("loginAccount");
		if(aa != null) {
		cart.setA_id(aa.getA_id());
		System.out.println(aa.getA_id());

		Product pp= ss.getMapper(ProductMapper.class).getProduct(p);
		System.out.println("p_size = " + p.getP_size());
		cart.setP_no(p.getP_no());
		cart.setP_name(pp.getP_name());
		cart.setP_price(pp.getP_price());
		cart.setP_color(pp.getP_color());
		cart.setP_size(req.getParameter("p_size"));
		int cart_qty = Integer.parseInt( req.getParameter("cart_qty"));
		System.out.println("수량" + cart_qty);
		cart.setCart_qty(cart_qty);
		
		System.out.println(pp.getP_price());
		System.out.println(pp.getP_color());
		
		String[] imgSplit = pp.getP_img().split("!");
		ArrayList<String> imgs = new ArrayList<String>();
		for (String s : imgSplit) {
			System.out.println("한글" + s);
			imgs.add(s);
		}
		cart.setP_img(imgSplit[0]);
		
		if(ss.getMapper(CartMapper.class).addCart(cart) == 1) {
			System.out.println("장바구니 등록 성공");
		}else {
			System.out.println("장바구니 등록 실패");
		}
		}else {
			System.out.println("로그인 후 이용하세요");
		}
	}
```
#### 리뷰 등록, 조회
```
public void regReview(HttpServletRequest req, Review r, MultipartHttpServletRequest file) {
		System.out.println("--------regReview함수 시작--------");

		String path = req.getSession().getServletContext().getRealPath("resources/imgs");
		try {
			List<MultipartFile> list = file.getFiles("files");
			String img = "";
			for (int i = 0; i < list.size(); i++) {
				UUID uuid = UUID.randomUUID();
				String fileRealName = uuid + "_" + list.get(i).getOriginalFilename();
				long size = list.get(i).getSize();
				// System.out.println("파일명 :" + fileRealName);
				// System.out.println("사이즈" + size);

				// System.out.println(uuid.toString());
				String[] uuids = uuid.toString().split("-");

				File saveFile = new File(path + "/" + fileRealName);
				try {
					list.get(i).transferTo(saveFile);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				img += fileRealName + "!";
			}
			Account aa = (Account) req.getSession().getAttribute("loginAccount");
			ReviewMapper rm = ss.getMapper(ReviewMapper.class);

			int p_no = Integer.parseInt(req.getParameter("o_p_no"));
			String txt = req.getParameter("r_txt");
			int grade = Integer.parseInt(req.getParameter("r_grade"));
			System.out.println(img);
			System.out.println(txt);
			System.out.println(grade);
			System.out.println(aa.getA_id());

			r.setR_o_p_no(p_no);
			r.setR_a_id(aa.getA_id());
			r.setR_img(img);
			r.setR_txt(txt);
			r.setR_grade(grade);

			if (ss.getMapper(ReviewMapper.class).regReview(r) == 1) {
				req.setAttribute("r", "등록 성공!");
			} else {
				req.setAttribute("r", "등록 실패!");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

public void productReviewSelect(HttpServletRequest req, Review r, Product p, Account a) {
		System.out.println("------productReviewSelect--------");
		
		int no = Integer.parseInt(req.getParameter("p_no"));
		ReviewMapper rm = ss.getMapper(ReviewMapper.class);

		List<Review> reviews = rm.getReviewProducts(no);
		List<Review> reviews2 = new ArrayList<Review>();

		for (Review rr : reviews) {
			String[] imge = rr.getR_img().split("!");
			rr.setR_img(imge[0]);
			reviews2.add(rr);
		}
		req.setAttribute("reviews", reviews2);

	}
```
#### 페이징 알고리즘, ajax 페이징
```
public ProductForFavorites paging(int page, HttpServletRequest request, Product p) {
		System.out.println("--------페이징---------");
		request.setAttribute("curPageNo", page);
		System.out.println("page = " + page);
		ArrayList<ProductForFavorite> products = new ArrayList<ProductForFavorite>();
		products = (ArrayList<ProductForFavorite>) request.getAttribute("favorsPNO");
		if(products != null ) {
			if(!products.equals("")) {
				int cnt = 4; 
				int total = products.size();
				System.out.println("total = " + total);
				
				int pageCount = (int) Math.ceil(((double)total/cnt));
				System.out.println("pageCount = " + pageCount);
				request.setAttribute("pageCount", pageCount);
				int start = total - (cnt *(page - 1));
				int end = (page == pageCount) ? -1 : start - (cnt +1);
				System.out.println("start = " + start);
				System.out.println("end = " + end);
				ArrayList<ProductForFavorite> products2 = new ArrayList<ProductForFavorite>();
				if(total != 0) {
					for(int i=start-1; i> end; i--) {
						products2.add(products.get(i));
					}
					request.setAttribute("favorsPNO", products2);
					return new ProductForFavorites(products2);
				}
				
				
				return new ProductForFavorites(products);
				
			}
			
		}else {
			return new ProductForFavorites(products);
		}
		return null;
		
	}
  
  $(function() {
	$('#previousbtn').attr('disabled', true);
	$('#nextbtn').click(function() {
		
		console.log('click!!');
		let curPageNo = $('#curPageNo').val();
		let a_id = $('#a_id').val();
		
		console.log("curPageNo : " + curPageNo);
		console.log("a_id : " + a_id);
		
		curPageNo++;
			$.ajax({ 
				url: "favorsPaging2", 
				type: "GET", 
				data:{
					"a_id" : a_id,
					"curPageNo" : curPageNo
				},
			}).done(function(res) {
				console.log(res);
				console.log(res.favors.length)
				let f = res.favors
				let len = res.favors.length - 1;
				// 지워지는 연산
				$('.favorSec').each(function(index, element) {
					console.log(index);
					console.log(element);
					$(element).remove();
					if(index == len) return false;
				})
				
				for(let i = 0; i < f.length; i++) {
					$('.favorites-div').append( 
							'<section id="favorSec" class="favorSec favorSec-'+ f[i].p_no + '" onclick="goDetail(' + f[i].p_no + ')">' +	
							'<img id="favorSecImg" src="resources/imgs/' + f[i].p_img + '">'		 +
							'<h3>' + f[i].p_name + '</h3>' + 
							'<h3>' + f[i].p_price + '</h3>' + 
							'</section>'		
							); 
				}
				$('#curPageNo').val(parseInt($('#curPageNo').val()) + 1);
				console.log("curPageNo after : " + curPageNo);
				if(parseInt(curPageNo) != 1) {
					console.log('만족!!');
					$('#previousbtn').attr('disabled', false);
				} else {
					console.log('불만족');
				}
				
				if(curPageNo == $('#pageCount').val()) {
					$('#nextbtn').attr('disabled', true);
				} 
			});
	});
	
	 $('#previousbtn').click(function() {
		 console.log('click!!');
		 
		let curPageNo = $('#curPageNo').val();
		let a_id = $('#a_id').val();
		
		curPageNo--;

		$.ajax({ 
				url: "favorsPaging2", 
				type: "GET", 
				data:{
					"a_id" : a_id,
					"curPageNo" : curPageNo
				},
			}).done(function(res) {
				console.log(res);
				console.log(res.favors.length)
				let f = res.favors
				
				// 지워지는 연산
				$('.favorSec').each(function(index, element) {
					$(element).remove();
				})
				
				for(let i = 0; i < f.length; i++) {
					$('.favorites-div').append( 
							'<section id="favorSec" class="favorSec favorSec-'+ f[i].p_no + '" onclick="goDetail(' + f[i].p_no + ')">' +	
							'<img id="favorSecImg" src="resources/imgs/' + f[i].p_img + '">'		 +
							'<h3>' + f[i].p_name + '</h3>' + 
							'<h3>' + f[i].p_price + '</h3>' + 
							'</section>'		
							); 
				}
				
				$('#curPageNo').val(parseInt($('#curPageNo').val()) - 1); 
				
				if(curPageNo == 1) {
					$('#previousbtn').attr('disabled', true);
				}
				if(curPageNo != $('#pageCount').val()) {
					$('#nextbtn').attr('disabled', false);
				} 
			}); 
	 });
	 
	 $('.wrapper').css('display','none');
	 $('#olbtn').click(function() {
		 if($('.wrapper').css('display') == 'flex'){
			$('.wrapper').css('display','none');
			$("#olbtn").html('구매이력 펼치기');
		 }else{
			$('.wrapper').css('display','flex');
			$("#olbtn").html('구매이력 접기');
		 }
		});
});
```

