package com.sdm.fj.review;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sdm.fj.account.Account;
import com.sdm.fj.product.Product;

@Service
public class ReviewDAO {
	@Autowired
	private SqlSession ss;

	public void regReview(HttpServletRequest req, Product p, Account a, Review r) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/imgs");
			MultipartRequest mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
			Account aa = (Account) req.getSession().getAttribute("loginAccount");
			
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String name = mr.getParameter("p_name");
			String size = mr.getParameter("p_size");
			String color = mr.getParameter("p_color");
			String img = mr.getFilesystemName("r_img");
			String txt = mr.getParameter("r_txt");
			int grade = Integer.parseInt("r_grade");
			String date = mr.getParameter("r_date");
			Date r_date = sdf.parse(date);
			
			System.out.println(name);
			System.out.println(size);
			System.out.println(color);
			System.out.println(img);
			System.out.println(txt);
			System.out.println(grade);
			System.out.println(r_date);
			System.out.println(aa.getA_id());
			
			r.setR_a_id(aa.getA_id());
			r.setP_name(name);
			r.setP_size(size);
			r.setP_color(color);
			r.setR_img(img);
			r.setR_txt(txt);
			r.setR_grade(grade);
			r.setR_date(r_date);
		
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
		int r_p_no = Integer.parseInt(req.getParameter("p_no"));
		ReviewMapper rm = ss.getMapper(ReviewMapper.class);
		
		List<Review> reviews = rm.getReviewProducts(r_p_no);

		
		req.setAttribute("reviews", reviews);
		
	}
}
