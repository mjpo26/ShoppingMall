package controller;
import static db.JdbcUtil.getConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.ItemDAO;
import dao.ReviewBoardDAO;
import vo.ItemBean;
import vo.ReviewBoardBean;

@WebServlet("/ReviewAjax.ra")
public class ReviewAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8"); //JSON형식으로 response 타입지정
		Connection con = getConnection();
		ReviewBoardDAO rdao  = ReviewBoardDAO.getInstance();
		rdao.setConnection(con);
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = Integer.parseInt(request.getParameter("limit"));
		ArrayList<ReviewBoardBean> articleList = rdao.selectArticleList(page, limit); 
		JSONArray arrayObj = new JSONArray();                         //JSON리스트를 가져오기 위해 Array생성
		
		for(int i = 0; i < articleList.size() ; i++) {  
			
			//줏어담자
			int review_num = articleList.get(i).getReview_num();
			String review_writer =articleList.get(i).getReview_writer();
			String review_subject =articleList.get(i).getReview_subject();
			String review_content =articleList.get(i).getReview_content();
			String review_file1 =articleList.get(i).getReview_file1();
			int review_readcount =articleList.get(i).getReview_readcount();
			Date review_date =articleList.get(i).getReview_date();
			int review_starPoint =articleList.get(i).getReview_starPoint();
			int review_re_ref =articleList.get(i).getReview_re_ref();
			int review_re_lev =articleList.get(i).getReview_re_lev();
			int review_re_seq =articleList.get(i).getReview_re_seq();
			
		
			
			JSONObject obj = new JSONObject();
			obj.put("review_num", review_num+"");
			obj.put("review_writer", review_writer+"");
			obj.put("review_subject", review_subject+"");
			obj.put("review_content", review_content+"");
			obj.put("review_file1", review_file1+"");
			obj.put("review_readcount", review_readcount+"");
			obj.put("review_date", review_date+"");
			obj.put("review_starPoint", review_starPoint+"");
			obj.put("review_re_ref", review_re_ref+"");
			obj.put("review_re_lev", review_re_lev+"");
			obj.put("review_re_seq", review_re_seq+"");
			
			arrayObj.add(obj);
		}
		response.getWriter().print(arrayObj);
	}
}

