package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.Free_BoardWriteProService;
import svc.OrderInsertService;
import vo.ActionForward;
import vo.Free_BoardBean;
import vo.OrderBean;

public class OrderInsertAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardWriteProAction!");
        
        ActionForward forward = null;
        
        String realFolder = ""; // 실제 업로드 폴더(톰캣)
        String saveFolder = "/boardUpload"; // 이클립스 상의 업로드 폴더
        int fileSize = 10 * 1024 * 1024; // 10MB 제한 크기 지정
       
        System.out.println("액션:오더인서트액션 들어옴");
        
        // request 객체로부터 서블릿컨텍스트 객체(톰캣) 가져오기
        ServletContext context = request.getServletContext();
        realFolder = context.getRealPath(saveFolder); // 이클립스 상의 업로드 폴더에 해당하는 톰캣 실제 폴더
        
        // 파일 업로드를 위한 MultipartRequest 객체 생성(cos.jar API 필요)
     //   MultipartRequest multi = 
       //         new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

        // 글쓰기 페이지에서 전달받은 파라미터를 BoardBean 객체에 저장
        OrderBean orderBean = new OrderBean();
        // request 객체를 MultipartRequest 객체에 전달했으므로 multi.getParameter() 메서드로 파라미터 가져오기
       
        
//        orderBean.setOrder_idx(Integer.parseInt(multi.getParameter("1")));
//        orderBean.setOrder_item_code(multi.getParameter("2"));
//        orderBean.setOrder_item_title(multi.getParameter("3"));
//        orderBean.setOrder_item_option_color(multi.getParameter("4"));
//        orderBean.setOrder_item_option_size(multi.getParameter("5"));
//        orderBean.setOrder_item_sel_price(Integer.parseInt(multi.getParameter("6")));
//        orderBean.setOrder_item_point(Integer.parseInt(multi.getParameter("7")));
//        orderBean.setOrder_item_code_count(Integer.parseInt(multi.getParameter("8")));
//        orderBean.setOrder_delivery_pee(Integer.parseInt(multi.getParameter("9")));
//        orderBean.setOrder_used_point(Integer.parseInt(multi.getParameter("10")));
//        orderBean.setOrder_delivery_status(multi.getParameter("11"));
//        orderBean.setOrder_pay_status(multi.getParameter("12"));
//        orderBean.setOrder_payment(multi.getParameter("13"));
//        orderBean.setOrder_memo(multi.getParameter("14"));
    
        
        
        orderBean.setOrder_idx(1);
        orderBean.setOrder_item_code("2");
        orderBean.setOrder_item_title("3");
        orderBean.setOrder_item_option_color("4");
        orderBean.setOrder_item_option_size("5");
        orderBean.setOrder_item_sel_price(6);
        orderBean.setOrder_item_point(7);
        orderBean.setOrder_item_code_count(8);
        orderBean.setOrder_delivery_pee(9);
        orderBean.setOrder_used_point(10);
        orderBean.setOrder_delivery_status("11");
        orderBean.setOrder_pay_status("12");
        orderBean.setOrder_payment("13");
        orderBean.setOrder_memo("14");
    
        
        
        
        //   orderBean.setOrder_date();
        // 업로드 파일명은 별도의 메서드 getOriginalFileName()를 호출하여 가져오기 
     
        System.out.println("액션:orderInsertAction"+orderBean+ "담았나?"
                +orderBean.getOrder_item_code());
        // 비즈니스 로직을 처리할 Service 클래스 인스턴스 생성
        OrderInsertService orderInsertService = new OrderInsertService();
        // Service 클래스의 registArticle() 메서드를 호출하여 글쓰기 로직 처리(BoardBean 객체 전달)
        boolean isWriteSuccess = orderInsertService.insertOrder(orderBean);
        
        // isWriteSuccess 값 판별
        if(!isWriteSuccess) { // 글 쓰기에 실패했을 경우
            // 자바스크립트 활용하여 "등록 실패" 메세지 출력 후 이전 페이지로 돌아가기
            response.setContentType("text/html;charset=UTF-8"); // 응답 문서 타입 설정
            PrintWriter out = response.getWriter(); // 출력스트림 객체 가져오기
            out.println("<script>");
            out.println("alert('등록실패!')");
            out.println("history.back()");
            out.println("</script>");
        } else { // 글 쓰기에 성공했을 경우
            // ActionForward 객체 생성하여 포워딩 정보 설정
            forward = new ActionForward();
            forward.setPath("OrderList.or"); // 포워딩 경로 설정
            // 글 목록 출력을 위해 BoardList.bo 페이지로 새로운 요청이 이루어지므로 Redirect 방식으로 포워딩
            forward.setRedirect(true); // Redirect 방식 지정
        }
        
        // 포워딩 정보(URL, 포워딩 방식)를 리턴
        return forward;
    }

}

















