package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminReviewBoardListService;
import svc.AdminQnABoardListService;
import vo.ActionForward;
import vo.AdminBoardSearchBean;
import vo.PageInfo;
import vo.QnA_BoardBean;
import vo.ReviewBoardBean;

public class AdminBoardListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int page = 1; // 현재 페이지
		int limit = 10; // 한 페이지 당 표시할 게시물 수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		AdminBoardSearchBean abb = new AdminBoardSearchBean();
		abb.setBoard_list(request.getParameter("list"));
		abb.setBoard_title(request.getParameter("title"));
		abb.setBoard_writer(request.getParameter("writer"));
		abb.setBoard_replyCheck(request.getParameter("replyCheck"));
		abb.setPage(page);
		abb.setLimit(limit);

		System.out.println("게시판목록:" + abb.getBoard_list());
		System.out.println("제목" + abb.getBoard_title());
		System.out.println("작성자" + abb.getBoard_writer());
		System.out.println("답변여부" + abb.getBoard_replyCheck());
//		tr1.equals("AA")
//		if (abb.getBoard_list().equals("리뷰게시판")||abb.getBoard_list()==null) {
			ArrayList<ReviewBoardBean> boardList = new ArrayList<ReviewBoardBean>();
			System.out.println("리뷰게시판 adminBoardListAction 실행됨");
			// 페이징 처리를 위한 변수 선언

			// 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장

			AdminReviewBoardListService adminBoardListService = new AdminReviewBoardListService();
			int listCount = adminBoardListService.getListCount(abb); // 전체 게시물 수 가져오기

			boardList = adminBoardListService.getArticleList(abb); // 전체 게시물 목록 가져오기(10개 한정)

			// 전체 페이지(마지막 페이지) 수 계산
			int maxPage = (int) ((double) listCount / limit + 0.95);

			// 시작 페이지 수 계산
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

			// 끝 페이지 수 계산
			int endPage = startPage + 10 - 1;

			// 끝 페이지 수가 전체 페이지 수 보다 클 경우 전체 페이지 수를 끝 페이지로 지정
			if (endPage > maxPage) {
				endPage = maxPage;
			}

			// PageInfo 인스턴스 생성 후 페이징 처리 정보 저장
			PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);

			// request 객체에 PageInfo 객체(pageInfo)와 ArrayList 객체(articleList)를 파라미터로 저장
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("boardList", boardList);

			ActionForward forward = new ActionForward();
			forward.setRedirect(false); // 생략 가능
			forward.setPath("/admin/admin_boardlist.jsp");
			System.out.println("실행");
			return forward;
//		} 
//			else {
//			ArrayList<QnA_BoardBean> QboardList = new ArrayList<QnA_BoardBean>();
//			System.out.println("QnA adminBoardListAction 실행됨");
//
//			AdminQnABoardListService adminBoardListService = new AdminQnABoardListService();
//			int listCount = adminBoardListService.getListCount(abb); // 전체 게시물 수 가져오기
//
//			QboardList = adminBoardListService.getArticleList(abb); // 전체 게시물 목록 가져오기(10개 한정)
//
//			// 전체 페이지(마지막 페이지) 수 계산
//			int maxPage = (int) ((double) listCount / limit + 0.95);
//
//			// 시작 페이지 수 계산
//			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
//
//			// 끝 페이지 수 계산
//			int endPage = startPage + 10 - 1;
//
//			// 끝 페이지 수가 전체 페이지 수 보다 클 경우 전체 페이지 수를 끝 페이지로 지정
//			if (endPage > maxPage) {
//				endPage = maxPage;
//			}
//
//			// PageInfo 인스턴스 생성 후 페이징 처리 정보 저장
//			PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
//
//			// request 객체에 PageInfo 객체(pageInfo)와 ArrayList 객체(articleList)를 파라미터로 저장
//			request.setAttribute("pageInfo", pageInfo);
//			request.setAttribute("QboardList", QboardList);
//
//			ActionForward forward = new ActionForward();
//			forward.setRedirect(false); // 생략 가능
//			forward.setPath("/admin/admin_boardlist.jsp");
//			System.out.println("실행");
//			return forward;
//		}
	}
}
