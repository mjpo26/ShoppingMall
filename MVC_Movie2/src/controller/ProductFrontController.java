package controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.Action;
import action.BasketInfoAction;
import action.BasketOrderInfoAction;
import action.MemberIdCheckAction;
import action.OrderInfoAction;
import action.ProductInsertProAction;
import action.basketAction;
import action.productDetailAction;
import action.productList1Action;
import action.productOrderAction;
import action.productOrderProAction;
import action.productReviewAction;
import action.productUpdate1ProAction;
import action.productUpdateAction;
import action.productUpdateProAction;
import action.product_listAction;
import vo.ActionForward;

@WebServlet("*.sh")
public class ProductFrontController extends HttpServlet {
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 한글 설정
        
        // 서블릿 주소 가져오기
        String command = request.getServletPath();
        
        Action action = null;
        ActionForward forward = null;
        System.out.println("컨트롤러");
        if(command.equals("/ItemInsert.sh")) {
            action = new ProductInsertProAction();
            //뭐 넣는건지 알 수 없음 = 보경
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/product_list.sh")) {
            action = new product_listAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }	
        } else if(command.equals("/Item_insertform.sh")) {
            forward = new ActionForward();
            forward.setPath("/admin/product_insert.jsp");
              					
        }else if(command.equals("/productDetail.sh")) {
            action = new productDetailAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(command.equals("/basket.sh")) {
            action = new basketAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(command.equals("/update.sh")) {
            action = new productUpdateAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(command.equals("/updatePro.sh")) {
            action = new productUpdateProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if(command.equals("/order.sh")) {
            action = new productOrderAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(command.equals("/selectorder.sh")) {
            action = new BasketOrderInfoAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if(command.equals("/orderPro.sh")) {
        	System.out.println("여길들어오고있다고 ??");
            action = new productOrderProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if (command.equals("/orderInfo.sh")) {
			System.out.println("orderInfo controller 들어옴");
			action = new OrderInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/productList.sh")) {
			System.out.println("productList controller 들어옴");
			action = new productList1Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/productUptdate.sh")) {
			System.out.println("productUpdate controller 들어옴");
			action = new productUpdate1ProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/productReview.sh")) {
            action = new productReviewAction();
            JSONObject json =(JSONObject)request.getAttribute("json");
            request.setAttribute("json", json);
            try {
                forward = action.execute(request, response);
              
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 포워딩 처리
        if(forward != null) {
            // ActionForward 객체의 isRedirect() 메서드가 true 이면 Redirect 방식으로 포워딩
            //                        ""                  false 이면 Dispatcher 방식으로 포워딩
            if(forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
    
}
