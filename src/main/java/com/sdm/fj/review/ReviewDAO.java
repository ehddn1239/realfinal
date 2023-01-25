package com.sdm.fj.review;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sdm.fj.account.Account;
import com.sdm.fj.product.Criteria;
import com.sdm.fj.product.Product;
import com.sdm.fj.product.ProductMapper;

@Service
public class ReviewDAO {
	@Autowired
	private SqlSession ss;

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

			/*
			 * String[] imgSplit = img.split("!"); ArrayList<String> imgs = new
			 * ArrayList<String>(); for (String s : imgSplit) { System.out.println(s);
			 * imgs.add(s); } p.setImges(imgs);
			 */

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

	public void deleteReview(HttpServletRequest req, Review r, Criteria cri) {
		ReviewMapper rm = ss.getMapper(ReviewMapper.class);
		if (rm.deleteReview(r) == 1) {
			req.setAttribute("r", "삭제 성공!");
		} else {
			req.setAttribute("r", "삭제 실패..");
		}

	}
}
