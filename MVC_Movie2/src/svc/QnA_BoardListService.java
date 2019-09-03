package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnA_BoardDAO;
import db.JdbcUtil;
import vo.QnA_BoardBean;

// static 메서드 호출을 위해 클래스명.메서드명() 으로 호출을 하지만
// static import 를 사용할 경우 메서드명만으로 바로 호출이 가능하다!
// < 기본 문법 >
// import static 패키지명.클래스명.메서드명; 또는 import static 패키지명.클래스명.*;

//import static db.JdbcUtil.getConnection; // 1개의 static 메서드만 지정할 경우
//import static db.JdbcUtil.close;
import static db.JdbcUtil.*; // db.JdbcUtil 클래스 내의 모든 static 메서드를 지정할 경우

// BoardListAction 클래스로부터 요청을 전달받아 DAO 와 연동하여 처리
public class QnA_BoardListService {
    
    // 전체 게시물 수를 조회하여 리턴하는 getListCount()
    public int getListCount() throws Exception {
        int listCount = 0; // 전체 게시물 수 저장하는 변수
        
        // Connection 객체 가져오기
        // static import 를 사용하여 JdbcUtil 클래스를 지정했으므로
        // JdbcUtil.getConnection(); 코드 대신 getConnection() 메서드 호출 코드만 작성하면 된다!
        Connection con = getConnection();  
        
        // BoardDAO 객체 가져오기
        QnA_BoardDAO boardDAO = QnA_BoardDAO.getInstance();
        
        // BoardDAO 객체에 Connection 객체 전달하기
        boardDAO.setConnection(con);
        
        // selectListCount() 메서드 호출하여 전체 게시물 수 조회하여 listCount 변수에 저장
        listCount = boardDAO.selectListCount();
//        System.out.println(listCount);
        // Connection 객체 반환
        close(con);
        
        System.out.println("svc:보드리스트 겟아티클리스트 서비스왔다 " +listCount+"조회했다");
        
        return listCount;
    }

    // 전체 게시물 목록을 조회하여 리턴
    public ArrayList<QnA_BoardBean> getArticleList(int page, int limit) throws Exception {
        ArrayList<QnA_BoardBean> articleList = null;
        
        Connection con = getConnection();  
        QnA_BoardDAO boardDAO = QnA_BoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        System.out.println("svc:보드리스트 겟아티클리스트 서비스왔다 :arraylist로 전체 게시물 목록 가지러 dao간다");
        articleList = boardDAO.selectArticleList(page, limit);
        
//        System.out.println(articleList);
        
        close(con);
        
        return articleList;
    }
    
    
    
    
}

















