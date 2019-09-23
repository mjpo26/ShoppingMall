package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberUpdateProService;
import svc.OrderUpdateService;
import vo.ActionForward;
import vo.OrderBean;

public class OrderUpdateAction implements Action{
	
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        OrderBean orderBean = new OrderBean();
        orderBean.setOrder_pay_status(request.getParameter("pay"));
        orderBean.setOrder_delivery_status(request.getParameter("delivery"));
        orderBean.setOrder_item_status(request.getParameter("item_status"));
        orderBean.setOrder_bank(request.getParameter("bank"));
        orderBean.setOrder_payment(request.getParameter("payment"));

        OrderUpdateService orderUpdateService = new OrderUpdateService();
        boolean isUpdateSuccess = orderUpdateService.updateOrder(orderBean);
        
        ActionForward forward = null;
        
        if(!isUpdateSuccess) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('item 수정 실패!')");
            out.println("history.back()");
            out.println("</script>");
        } else {
            forward = new ActionForward();
            forward.setPath("./orderUpdate.ol");
            forward.setRedirect(true);
        }
        
        return forward;
    }

}