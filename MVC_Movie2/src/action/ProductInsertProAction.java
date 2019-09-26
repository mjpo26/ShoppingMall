package action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ProductInsertProService;
import vo.ActionForward;
import vo.ItemBean;

public class ProductInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String realFolder = ""; 
        String saveFolder = "upload"; 
        int fileSize = 10 * 1024 * 1024; 
        ServletContext context = request.getServletContext();
    	System.out.println("context의 경로 : "+context.getContextPath());
    	System.out.println("context의 경로 : "+context.getRealPath(saveFolder));

        realFolder = context.getRealPath(saveFolder); 
       
        MultipartRequest multi = 
                new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

        String pic1="";
        String pic2="";
        String pic3="";
        String pic4="";
        Enumeration files = multi.getFileNames();
        String file = (String)files.nextElement();
        pic1 = multi.getFilesystemName(file);

        String file2 = (String)files.nextElement();
        pic2 = multi.getFilesystemName(file2);

       

        String file3 = (String)files.nextElement();

        pic3 = multi.getFilesystemName(file3);
        String file4 = (String)files.nextElement();

        pic4 = multi.getFilesystemName(file4);
        
		System.out.println("ProductInserProAction");
		int sale_price =(Integer.parseInt(multi.getParameter("old_price"))*Integer.parseInt(multi.getParameter("sale_price")))/100;
		int sel_price = Integer.parseInt(multi.getParameter("old_price"))-sale_price;
		int Item_point = sel_price /10;
		  ItemBean itemBean = new ItemBean();
		  	itemBean.setItem_title(multi.getParameter("title"));
		  	itemBean.setItem_old_price(Integer.parseInt(multi.getParameter("old_price")));
		  	itemBean.setItem_sel_price(sel_price);
		  	itemBean.setItem_content1(multi.getParameter("content1"));
		  	itemBean.setItem_content2(multi.getParameter("content2"));
//		  	itemBean.setItem_bgpic(request.getParameter("Item_bgpic"));
		  	itemBean.setItem_pic1(pic1);
		  	itemBean.setItem_pic2(pic2);
		  	itemBean.setItem_pic3(pic3);
		  	itemBean.setItem_pic4(pic4);
//		  	itemBean.setItem_pic4(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		  	
		  	itemBean.setItem_display(multi.getParameter("display"));
		  	itemBean.setItem_sales(multi.getParameter("sales"));
		  	itemBean.setItem_point(Item_point);
		  	itemBean.setItem_category1(multi.getParameter("category"));
		  	itemBean.setItem_stock_price(Integer.parseInt(multi.getParameter("stock_price")));
		  	itemBean.setItem_delivery_pee(Integer.parseInt(multi.getParameter("delivery_pee")));
		  	itemBean.setItem_weight(Integer.parseInt(multi.getParameter("weight")));
		  	itemBean.setItem_stock_count(Integer.parseInt(multi.getParameter("stock_count")));

		  	
	        ProductInsertProService productInsertProService = new ProductInsertProService(); 
	        
	        boolean isInsertSuccess = productInsertProService.insertItem(itemBean);
	        
	        // 회원 추가 결과가 false 일 경우
	        // "회원 가입 실패!" 경고 출력 후 이전 페이지로 이동
	        // true 일 경우 index.jsp 로 이동
	        
	        
	        if(!isInsertSuccess) {
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('상품 등록 실패!')");
	            out.println("history.back()");
	            out.println("</script>");
	        } else {
	            forward = new ActionForward();
	            forward.setPath("./admin.ma");
	            forward.setRedirect(true);
	        }
	        
	        return forward;
	}

}
