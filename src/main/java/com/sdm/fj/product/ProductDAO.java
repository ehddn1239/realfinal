package com.sdm.fj.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sdm.fj.account.Account;
import com.sdm.fj.account.AccountMapper;
import com.sdm.fj.account.OrderList;
import com.sdm.fj.account.OrderlistMapper;
import com.sdm.fj.cart.CartDTO;

@Service
public class ProductDAO {

	@Autowired
	private SqlSession ss;

	public void getAllProducts(Product p, HttpServletRequest req) {
		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> products = pm.getAllProducts();
		List<Product> products2 = new ArrayList<Product>();

		for (Product pp : products) {
			String imges[] = pp.getP_img().split("!");
			pp.setP_img(imges[0]);
			products2.add(pp);
		}
		req.setAttribute("products", products2);

	}

	public void getHighPriceProducts(Criteria cri, HttpServletRequest req) {
//		int p_category = Integer.parseInt(req.getParameter("p_category"));
//		cri.setP_category(p_category);
		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> products = pm.gethighPriceProducts(cri);
		List<Product> products2 = new ArrayList<Product>();

		for (Product pp : products) {
			String imges[] = pp.getP_img().split("!");
			pp.setP_img(imges[0]);
			products2.add(pp);
		}
		req.setAttribute("products", products2);

	}

	public void getLowPriceProducts(Criteria cri, HttpServletRequest req) {
//		int p_category = Integer.parseInt(req.getParameter("p_category"));
//		cri.setP_category(p_category);

		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> products = pm.getLowPriceProducts(cri);
		List<Product> products2 = new ArrayList<Product>();

		for (Product pp : products) {
			String imges[] = pp.getP_img().split("!");
			pp.setP_img(imges[0]);
			products2.add(pp);
		}
		req.setAttribute("products", products2);
	}

	public void getNewProducts(Criteria cri, HttpServletRequest req) {
//		int p_category = Integer.parseInt(req.getParameter("p_category"));
//		cri.setP_category(p_category);

		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> products = pm.getNewProducts(cri);
		List<Product> products2 = new ArrayList<Product>();

		for (Product pp : products) {
			String imges[] = pp.getP_img().split("!");
			pp.setP_img(imges[0]);
			products2.add(pp);
		}
		req.setAttribute("products", products2);
	}

	public void getProductByCategory(HttpServletRequest req, Product p) {
		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> products = pm.getProductByCategory(p.getP_category());
		List<Product> products2 = new ArrayList<Product>();
		for (Product pp : products) {
			System.out.println(pp.getP_name());
			String imgs[] = pp.getP_img().split("!");
			pp.setP_img(imgs[0]);
			products2.add(pp);
		}
		req.setAttribute("products", products2);

	}

	public void regProducts(Product p, HttpServletRequest req, MultipartHttpServletRequest file) {
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

			/*
			 * String[] imgSplit = img.split("!"); ArrayList<String> imgs = new
			 * ArrayList<String>(); for (String s : imgSplit) { System.out.println(s);
			 * imgs.add(s); } p.setImges(imgs);
			 */

			String name = req.getParameter("p_name");
			String size[] = req.getParameterValues("p_size");
			String sizes = "";
			for (String s : size) {
				sizes += s + "!";
			}
			String[] splitSizes = sizes.split("!");
			for (String s : splitSizes) {
				System.out.println(s);
			}
			int price = Integer.parseInt(req.getParameter("p_price"));
			int category = Integer.parseInt(req.getParameter("p_category"));
			String color = req.getParameter("p_color");
			String description = req.getParameter("p_description");

			/*
			 * System.out.println(req.getParameter("p_no")); System.out.println(name);
			 * System.out.println(sizes); System.out.println(price);
			 * System.out.println(category); System.out.println(color);
			 * System.out.println(description);
			 */

			p.setP_name(name);
			p.setP_size(sizes);
			p.setP_price(price);
			p.setP_category(category);
			p.setP_img(img);
			p.setP_color(color);
			p.setP_description(description);

			if (ss.getMapper(ProductMapper.class).regProducts(p) == 1) {
				req.setAttribute("r", "등록 성공!");
			} else {
				req.setAttribute("r", "등록 실패!");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void goDetail(Product p, HttpServletRequest req) {

		req.setAttribute("p", ss.getMapper(ProductMapper.class).getProduct(p));
//      int p_category = p.getP_category()

	}

	public void deleteProduct(Product p, HttpServletRequest req) {

		ProductMapper pm = ss.getMapper(ProductMapper.class);
		if (pm.deleteProduct(p) == 1) {
			req.setAttribute("r", "삭제 성공!");
		} else {
			req.setAttribute("r", "삭제 실패..");
		}
	}

	public void fileUpload(MultipartHttpServletRequest file, HttpServletRequest req) {

	}

	public void getDetail(Product p, HttpServletRequest req) {
		Product pp = ss.getMapper(ProductMapper.class).getProduct(p);
		String[] imgSplit = pp.getP_img().split("!");
		// System.out.println(imgSplit);

		ArrayList<String> imgs = new ArrayList<String>();
		for (String s : imgSplit) {
			System.out.println("한글" + s);
			imgs.add(s);
		}

		p.setImgs(imgs);
		// System.out.println(imgs);

		String[] splitSizes = pp.getP_size().split("!");

		ArrayList<String> sizes = new ArrayList<String>();
		for (String s : splitSizes) {
			sizes.add(s);
			// System.out.println(s);
		}
		req.setAttribute("imgs", imgs);
		req.setAttribute("sizes", sizes);
	}

	public void updateProduct(Product p, HttpServletRequest req, MultipartHttpServletRequest file) {

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

			String[] imgSplit = img.split("!");
			ArrayList<String> imgs = new ArrayList<String>();
			for (String s : imgSplit) {
				imgs.add(s);
			}
			req.setAttribute("imgs", imgs);

			String name = req.getParameter("p_name");
			String size[] = req.getParameterValues("p_size");
			String sizes = "";
			for (String s : size) {
				sizes += s + "!";
			}
			String[] splitSizes = sizes.split("!");
			ArrayList<String> sizes1 = new ArrayList<String>();
			for (String s : splitSizes) {
				System.out.println(s);
				sizes1.add(s);
			}
			req.setAttribute("sizes", sizes1);
			int price = Integer.parseInt(req.getParameter("p_price"));
			int category = Integer.parseInt(req.getParameter("p_category"));

			String description = req.getParameter("p_description");

			/*
			 * System.out.println(req.getParameter("p_no")); System.out.println(name);
			 * System.out.println(sizes1); System.out.println(price);
			 * System.out.println(category); System.out.println(description);
			 * System.out.println(img);
			 */

			p.setP_name(name);
			p.setP_size(sizes);
			p.setP_price(price);
			p.setP_category(category);
			p.setP_img(img);
			p.setP_description(description);

			ProductMapper pm = ss.getMapper(ProductMapper.class);
			if (pm.updateProduct(p) == 1) {
				req.setAttribute("r", "수정 성공!");
			} else {
				req.setAttribute("r", "수정 실패..");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

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

	public void deleteFavorite(Account a, Product p, HttpServletRequest req) {
		System.out.println("------deleteFavorite함수 시작------");
		String pno = req.getParameter("p_no");
		String aid = req.getParameter("a_id");
		String favors = ss.getMapper(AccountMapper.class).selectFavorforDelete(aid);
		String[] favoritesAr = favors.split(", ");
		System.out.println("pno = " + pno + " aid = " + aid + " favors = " + favors);
		for (String s : favoritesAr) {
			System.out.println("favoritesArr = " + s);
			if (s.equals(pno)) {
				favors = favors.replace(", " + s, "");
			}
		}
		System.out.println("replace 이후 favors 문자열 - " + favors);
		HashMap<String, String> val = new HashMap<String, String>();

		val.put("favors", favors);
		val.put("a_id", aid);

		if (ss.getMapper(AccountMapper.class).deleteFavorite(val) > 0) {
			System.out.println("찜하기 삭제 완료");
		}
		favoritesAr = favors.split(", ");
		a.setFavorites(favoritesAr);
		req.setAttribute("checkFavorite", 0);
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

	public void getSearchProduct(Product p, HttpServletRequest req) {
		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> products = pm.getSearchProduct(p);
		List<Product> products2 = new ArrayList<Product>();

		for (Product pp : products) {
			String imges[] = pp.getP_img().split("!");
			pp.setP_img(imges[0]);
			products2.add(pp);
		}
		req.setAttribute("search", products2);
	}

	public void buyProduct(Product p, CartDTO cart, HttpServletRequest req) {
		System.out.println("--------buyProduct함수 시작---------");
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		int money = a.getA_cash();
		System.out.println("money = " + money);
		int qty = cart.getCart_qty();
		System.out.println("cart_qty - " + qty);
		int pay = p.getP_price();
		System.out.println("pay = " + pay);

		// 티어에 따른 가격 검색
		if (a.getA_rank().equals("Bronze")) {
			pay = (int) (pay * 0.95);
		} else if (a.getA_rank().equals("Silver")) {
			pay = (int) (pay * 0.90);
		} else if (a.getA_rank().equals("Gold")) {
			pay = (int) (pay * 0.85);
		} else if (a.getA_rank().equals("Platinum")) {
			pay = (int) (pay * 0.80);
		} else {
			pay = (int) (pay * 0.75);
		}

		double exp = a.getA_exp();
		System.out.println("exp =" + exp);

		double accumulateExp = exp + (qty * pay) * 0.01;
		int remain = money - (qty * pay);
		Account a2 = new Account();
		a2.setA_id(a.getA_id());
		a2.setA_cash(remain);
		a2.setA_exp(accumulateExp);
		System.out.println("a2의 a_id = " + a2.getA_id());
		System.out.println("a2의 a_cash = " + a2.getA_cash());
		System.out.println("a2의 a_exp = " + a2.getA_exp());

		if (ss.getMapper(AccountMapper.class).payMoney(a2) == 1) {
			System.out.println("결제 성공");
		} else {
			System.out.println("결제 실패");
		}

	}

	public void getList(Criteria cri, HttpServletRequest req) {
		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> lists = pm.getList(cri);
		List<Product> lists2 = new ArrayList<Product>();
		System.out.println("111");
		for (Product pp : lists) {
			System.out.println("222");
			String imges[] = pp.getP_img().split("!");
			pp.setP_img(imges[0]);
			lists2.add(pp);

		}
		for (Product product : lists2) {
			System.out.println(product.toString());
		}
		req.setAttribute("products", lists2);
	}

	public int getTotal() {
		return ss.getMapper(ProductMapper.class).getTotal();
	}

	public void getListByCate(Criteria cri, HttpServletRequest req) {
		int p_category = Integer.parseInt(req.getParameter("p_category"));
		cri.setP_category(p_category);
		System.out.println(cri.getP_category());
		ProductMapper pm = ss.getMapper(ProductMapper.class);
		List<Product> lists = pm.getListByCate(cri);
		List<Product> lists2 = new ArrayList<Product>();

		for (Product pp : lists) {
			System.out.println("222");
			String imges[] = pp.getP_img().split("!");
			pp.setP_img(imges[0]);
			lists2.add(pp);

		}

		req.setAttribute("products", lists2);
	}

	public int getTotalByCate(Criteria cri, HttpServletRequest req) {
		int p_category = Integer.parseInt(req.getParameter("p_category"));
		cri.setP_category(p_category);

		return ss.getMapper(ProductMapper.class).getTotalByCate(cri);
	}

	public void regOrderList(Product p, CartDTO cart, Account a, HttpServletRequest req) {
		System.out.println("--------regOrderList함수 시작-------");
		Account a2 = (Account) req.getSession().getAttribute("loginAccount");
		String id = a2.getA_id();
		int pno = p.getP_no();
		System.out.println("pno = " + pno);
		int qty = cart.getCart_qty();
		System.out.println("cart_qty - " + qty);

		String p_name = ss.getMapper(ProductMapper.class).getPname(pno);
		String p_size = cart.getP_size();
		String p_color = cart.getP_color();
		int o_p_price = cart.getP_price();
		String o_p_img = cart.getP_img();
		System.out.println("o_p_img = " + o_p_img);

		String o_post = req.getParameter("o_post");
		String o_addr = req.getParameter("o_addr");

		System.out.println("o_post = " + o_post);
		System.out.println("o_addr = " + o_addr);
		OrderList ol = new OrderList();
		ol.setO_p_no(pno);
		ol.setO_qty(qty);
		ol.setO_a_id(id);
		ol.setO_p_name(p_name);

		ol.setO_p_size(p_size);
		ol.setO_p_color(p_color);
		ol.setO_p_price(o_p_price);
		ol.setO_p_img(o_p_img);
		ol.setO_addr(o_addr);
		ol.setO_post(o_post);

		if (ss.getMapper(OrderlistMapper.class).regOrder(ol) > 0) {
			System.out.println("구매이력 등록 완료");
		}

	}

	public void showAllOrders(OrderList o, HttpServletRequest req, Product p) {
		System.out.println("--------showAllOrders함수 시작---------------");
		OrderlistMapper om = ss.getMapper(OrderlistMapper.class);
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		String id = a.getA_id();
		HashMap<String, String> val = new HashMap<String, String>();
		val.put("id", id);
//		System.out.println("o_a_id = " + o.getO_a_id());
		ArrayList<OrderList> orders = om.showAllOrders(val);
		System.out.println("----------------showAllOrders함수 끝-----------");
		for (OrderList o2 : orders) {
			System.out.println(o2);
		}

		req.setAttribute("orderList22", orders);
	}

	public void getOrders(OrderList o, HttpServletRequest req, Product p) {
		OrderList oo = ss.getMapper(OrderlistMapper.class).getProduct(o);
		req.setAttribute("oo", oo);

	}

	

}
