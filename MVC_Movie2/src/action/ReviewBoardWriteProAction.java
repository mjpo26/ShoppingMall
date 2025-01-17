package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.MemberInfoService;
import svc.OrderInsertService;
import svc.ReviewBoardWriteProService;
import vo.ActionForward;
import vo.MemberBean;
import vo.OrderBean;
import vo.ReviewBoardBean;

import action.Action;

public class ReviewBoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		String realFolder = "./upload/review";
		String saveFolder = "./upload/review";
		int fileSize = 10 * 1024 * 1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);

		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		int item_code = Integer.parseInt((multi.getParameter("order_item_code")));
		String item_name = multi.getParameter("order_item_name");

		ReviewBoardBean boardBean = new ReviewBoardBean();

		boardBean.setReview_writer(multi.getParameter("review_writer"));
		boardBean.setReview_id(multi.getParameter("review_id"));
		boardBean.setReview_pass(multi.getParameter("review_pass"));
		boardBean.setReview_subject(multi.getParameter("review_subject"));
		boardBean.setReview_content(multi.getParameter("review_content"));
		boardBean.setReview_file1(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		boardBean.setReview_starPoint(Integer.parseInt(multi.getParameter("review_starPoint")));
		boardBean.setReview_orderNo(Integer.parseInt(multi.getParameter("order_idx")));
		boardBean.setReview_order_item_code(item_code);
		boardBean.setReview_order_item_name(item_name);

		ReviewBoardWriteProService reviewBoardWriteProService = new ReviewBoardWriteProService();

		MemberBean mb = new MemberBean();
		mb.setMember_id(multi.getParameter("review_id"));
		MemberInfoService infoService = new MemberInfoService();
		boolean isRight = infoService.getPoint(mb.getMember_id());
		boolean isWriteSuccess = reviewBoardWriteProService.registArticle(boardBean);

		OrderBean ob = new OrderBean();
		ob.setOrder_idx(boardBean.getReview_orderNo());
		System.out.println("주문번호 받아가자" + ob.getOrder_idx());
		OrderInsertService insertService = new OrderInsertService();
		boolean isUpdate = insertService.updateReview(ob.getOrder_idx());
		if (!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			System.out.println();
			System.out.println(isRight);
			System.out.println("댓글 바뀌었나요?" + isUpdate);
			forward = new ActionForward();
			forward.setPath("ReviewBoardList.re");
			forward.setRedirect(true);
		}

		return forward;
	}

}
