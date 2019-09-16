package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MainPageService;
import vo.ActionForward;
import vo.ItemBean;

public class MainPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   System.out.println("MainPageAction");
		
	        MainPageService mainPageService = new MainPageService();

	        List<ItemBean> bestProduct = new ArrayList<ItemBean>();
	        bestProduct = mainPageService.getItem("best");
	        
	        List<ItemBean> newProduct = new ArrayList<ItemBean>();
	        newProduct = mainPageService.getItem("new");
	        
	        List<ItemBean> recommandProduct = new ArrayList<ItemBean>();
	        recommandProduct = mainPageService.getItem("recommand");

			        
	        request.setAttribute("bestProduct", bestProduct);
	        request.setAttribute("newProduct", newProduct);
	        request.setAttribute("recommandProduct", recommandProduct);

		
	        // /main/main.jsp 페이지로 포워딩(Dispatcher 방식)
	        ActionForward forward = new ActionForward();
	        forward.setPath("/main/main.jsp"); // 포워딩 주소 지정
	        forward.setRedirect(false); // 포워딩 방식 지정 => Dispatcher 방식은 false 전달(생략 가능)
	        
		
		return forward; // ActionForward 객체 리턴
	}

}
