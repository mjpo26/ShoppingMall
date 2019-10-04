package action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import svc.MemberLoginProService;
import vo.ActionForward;


public class MemberLoginProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("LoginProAction");
        
        //카카오아이디로그인경우
        if(request.getParameter("kakao_id") !=null) {
            
            HttpSession session =request.getSession(); 
            session.setAttribute("sid",request.getParameter("kakao_id"));
            
            
            
        }else {//네이버 및 기타
        String clientId = "t264Qh6r0U2esDUlEFWD";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "5M77_8dWfJ";//애플리케이션 클라이언트 시크릿값";
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        String redirectURI = URLEncoder.encode("http://localhost:8080/MVC_Movie/index.jsp", "UTF-8");
        String apiURL;
        apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
        apiURL += "client_id=" + clientId;
        apiURL += "&client_secret=" + clientSecret;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&code=" + code;
        apiURL += "&state=" + state;
        String access_token = "";
        String refresh_token = "";
        System.out.println("apiURL="+apiURL);
        try {
          URL url = new URL(apiURL);
          HttpURLConnection con = (HttpURLConnection)url.openConnection();
          con.setRequestMethod("GET");
          int responseCode = con.getResponseCode();
          BufferedReader br;
          System.out.print("responseCode="+responseCode);
          if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
          } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
          }
          String inputLine;
          StringBuffer res = new StringBuffer();
          while ((inputLine = br.readLine()) != null) {
            res.append(inputLine);
          }
          br.close();
          if(responseCode==200) {
              PrintWriter out = response.getWriter();
//            out.println(res.toString());
              System.out.println("리소스내부보자: "+res.toString());
            //세션저장테스트해본다
           
              HttpSession session =request.getSession(); 
            session.setAttribute("sid",res.toString());
            System.out.println("액세스토큰 값있나: "+res.toString());
            
            
            JSONParser parser = new JSONParser();
            
            JSONObject result = (JSONObject)parser.parse(res.toString());
            
        //    ((JSONObject)result.get("res")).get("access_token");
            
            access_token = (String)result.get("access_token");
          //  String name = (String)((JSONObject)result.get("res")).get("name");
                    
            
            session.setAttribute("email", access_token);
          //  session.setAttribute("name", name);
            
            System.out.println("엑세스토큰 담기나" + access_token);
         //   System.out.println("name" + name);


            
          }
        } catch (Exception e) {
          System.out.println(e);
        }
        
        
        }
        
      
        
        
        
        
        
        
        
        
        ActionForward forward = null;
        
        HttpSession session = request.getSession(); // 현재 세션 가져오기
        
        // 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
        String sId = (String)session.getAttribute("sId");
        
        String id ;
        String password ;
        if(sId != null) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('잘못된 접근입니다!')");
            out.println("location.href='index.jsp'");
            out.println("</script>");
         
        }else {
            // 전달받은 id, password 값 가져오기
            //네아로 추가작업
           
            if(request.getParameter("id") !=null && request.getParameter("password") !=null) {
             id = request.getParameter("id");
             password = request.getParameter("password");
            }else if(request.getParameter("kakao_id") !=null) {
                id = "kakaoGuest";
                password = "kakaoGuestPass!1";
                System.out.println("카카오로그인조건들어오나?");
                
            }else {//네이버토큰 갖고있는경우와 카카오토큰 구분해야지 나중에.
                 id ="naverGuest";
                 password ="naverGuestPass!1";
               System.out.println("네이버게스트로그인조건들어오나?");
                
//               response.setCharacterEncoding("UTF-8");
//               response.setContentType("text/html;charset=UTF-8");
//               PrintWriter out = response.getWriter();
//                 out.println("<script>");
//                 out.println("alert('naver login success')");
//                 out.println("</script>");
               

            }
            MemberLoginProService loginProService = new MemberLoginProService();
            boolean isLoginMember = loginProService.isLoginMember(id, password);
            // isLoginMember 변수가 true 이면 세션 아이디(sId) 값을 현재 입력받은 아이디로 설정
            // => Main.bo 페이지로 Redirect 방식 포워딩
            if(isLoginMember) {
               
                session.setAttribute("sId", id);
                forward = new ActionForward();
                forward.setPath("index.jsp");
                forward.setRedirect(true);
                System.out.println("멤버로긴 프로액션 왔다 sId값은: "+session.getAttribute("sId"));
          
            } else {
                response.setCharacterEncoding("UTF-8");
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('로그인 실패 또는 회원가입하세요!')");
                out.println("history.back()");
                out.println("</script>");
             
            }
            
        }
        
        return forward;
        
    }

}















