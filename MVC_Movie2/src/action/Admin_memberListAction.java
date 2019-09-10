package action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Admin_memberListService;
import svc.OrderListService;
import vo.ActionForward;
import vo.Admin_MemberSearchBean;
import vo.Admin_memberPageInfo;
import vo.MemberBean;
import vo.PageInfo;
import vo.OrderListBean;

public class Admin_memberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
	        System.out.println("Admin_memberListAction 실행됨");
	        // 페이징 처리를 위한 변수 선언
	        int page = 1; // 현재 페이지
	        int limit = 10; // 한 페이지 당 표시할 게시물 수
	        
	        // 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장
	        if(request.getParameter("page") != null) {
	            page = Integer.parseInt(request.getParameter("page"));
	        }

	        Admin_MemberSearchBean ams = new Admin_MemberSearchBean();
            ams.setMember_id(request.getParameter("searchId"));
            ams.setMember_name(request.getParameter("searchName"));
            ams.setMember_phone(request.getParameter("searchPhone"));
	        ams.setMember_sms_ok(request.getParameter("smsOk"));
            ams.setMember_email_ok(request.getParameter("emailOk"));
            
            if(request.getParameter("pickStart") !=null) {
    	        String pickStart = request.getParameter("pickStart");
    	        System.out.println(request.getParameter("pickStart"));
               SimpleDateFormat beforeFormat = new SimpleDateFormat("mm/dd/yyyy");
              SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
              java.util.Date tempDate = null;
              try {
                 tempDate = beforeFormat.parse(pickStart);

              } catch (ParseException e) {
                  e.printStackTrace();
              }
              String transDate = afterFormat.format(tempDate);
              Date start = Date.valueOf(transDate);
              
              ams.setPickStart(start);
              System.out.println("시작"+ start);

            }
            
            if(request.getParameter("pickEnd")!=null) {
    	        String pickEnd = request.getParameter("pickEnd");
    	        System.out.println(request.getParameter("pickEnd"));
               SimpleDateFormat beforeFormat = new SimpleDateFormat("mm/dd/yyyy");
              SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
              java.util.Date tempDate = null;
              try {
                 tempDate = beforeFormat.parse(pickEnd);

              } catch (ParseException e) {
                  e.printStackTrace();
              }
              String transDate = afterFormat.format(tempDate);
              Date end = Date.valueOf(transDate);
              ams.setPickEnd(end);
              System.out.println("끝"+ end);
            }

//                        
            System.out.println("액션 심플데이타포맷 위 에러인가?");
            //스트링을 date로 변환해야된다 ;;


            
            

     
            
            
          
            ams.setPage(page);
	        ams.setLimit(limit);

	        ams.setPage(page);
	        ams.setLimit(limit);     
	        

	        
	        System.out.println("시작String"+ams.getPickStart());
	        System.out.println("시작End"+ams.getPickEnd());
	        System.out.println("ams id request체크 :"+ams.getMember_id());
	        System.out.println("ams 폰 request체크 :"+ams.getMember_phone());
	        System.out.println("ams sms request체크 :"+ams.getMember_sms_ok());
	        System.out.println("ams email request체크 :"+ams.getMember_email_ok());
	        
	        Admin_memberListService Admin_memberListService = new Admin_memberListService();
	        int listCount = Admin_memberListService.getListCount(ams); // 전체 게시물 수 가져오기

	        memberList = Admin_memberListService.getArticleList(ams); // 전체 게시물 목록 가져오기(10개 한정)
	        
	        // 전체 페이지(마지막 페이지) 수 계산
	        int maxPage = (int)((double)listCount / limit + 0.95);
	        
	        // 시작 페이지 수 계산
	        int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
	        
	        // 끝 페이지 수 계산
	        int endPage = startPage + 10 - 1;
	        
	        // 끝 페이지 수가 전체 페이지 수 보다 클 경우 전체 페이지 수를 끝 페이지로 지정
	        if(endPage > maxPage) {
	            endPage = maxPage;
	        }
	        
	        
	        // PageInfo 인스턴스 생성 후 페이징 처리 정보 저장
	        Admin_memberPageInfo pageInfo = new Admin_memberPageInfo(page, maxPage, startPage, endPage, listCount);
	        
	        // request 객체에 PageInfo 객체(pageInfo)와 ArrayList 객체(articleList)를 파라미터로 저장
	        request.setAttribute("pageInfo", pageInfo);
	        request.setAttribute("memberList", memberList);
	        
	        // ActionForward 객체를 생성하여 Dispatcher 방식으로 board 폴더 내의 qna_board_list.jsp 페이지로 이동
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false); // 생략 가능
	        forward.setPath("/admin/admin_memberlist.jsp");
	        
	        return forward;
		}
}
