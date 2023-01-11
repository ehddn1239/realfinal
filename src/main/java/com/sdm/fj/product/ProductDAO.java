package com.sdm.fj.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthScrollPaneUI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sdm.fj.account.Account;
import com.sdm.fj.account.AccountMapper;

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
		System.out.println("favors에 값을 받은 직후    favors = "+favors);
		
		if(favors.isEmpty()) {
			System.out.println("-----isEmpty를 거침------");
			favors = ", "+ p_no;
		}else {
			System.out.println("-----isEmpty를 거치지 않음------");
			favors += ", " +p_no;
		}
		System.out.println("favors에 [, p_no]를 붙인 직후 favors = "+favors);
		
		HashMap<String, String> val = new HashMap<String, String>();
		val.put("p_list", favors);
		val.put("a_id", a_id);
		
		if(ss.getMapper(AccountMapper.class).updateFavorite(val) > 0) {
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
			System.out.println("favoritesArr = " + s );
			if(s.equals(pno)) {
				favors = favors.replace(", "+s, "");
			}
		}
		System.out.println("replace 이후 favors 문자열 - " + favors);
		HashMap<String, String> val = new HashMap<String, String>();
		
		val.put("favors", favors);
		val.put("a_id", aid);
		
		
		if(ss.getMapper(AccountMapper.class).deleteFavorite(val) > 0) {
			System.out.println("찜하기 삭제 완료");
		}
		favoritesAr = favors.split(", ");
		a.setFavorites(favoritesAr);
		req.setAttribute("checkFavorite", 0);
	}

	public void showClientFavors(HttpServletRequest req, Product p) {
		System.out.println("--------showClientFavors시작-------");
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		String[] favorsArr = a.getA_favorite().split(", ");
		for (String s2 : favorsArr) {
			System.out.println("favorsArr ??? "+s2);
		}
		ArrayList<Product> products = new ArrayList<Product>();
		ArrayList<String> imgs = new ArrayList<String>();
		
		for (String s : favorsArr) {
			System.out.println("favorsArr = " + s);
			if(s.equals(" ")) {
				continue;
			}else {
				Product pp = ss.getMapper(ProductMapper.class).getProductforFavor(s);
				System.out.println("pp.getP_img() = " + pp.getP_img());
				String[] imgSplit = pp.getP_img().split("!");
				products.add(pp);
				for (String s2 : imgSplit) {
					System.out.println("한글" + s2);
					imgs.add(s2);
				}
				pp.setImgs(imgs);
			}
		}
		req.setAttribute("imgs", imgs);
		req.setAttribute("favorsPNO", products);
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

}
