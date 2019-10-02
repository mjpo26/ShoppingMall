package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.ItemBean;
import vo.OrderBean;
import static db.JdbcUtil.*;

public class ItemDAO {
   // -----------------------------------------------------
   // DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
   private static ItemDAO instance;

   private ItemDAO() {
   }

   public static ItemDAO getInstance() {
      // 기존의 MemberDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
      if (instance == null) {
         instance = new ItemDAO();
      }

      return instance;
   }
   // -----------------------------------------------------

   Connection con;

   public void setConnection(Connection con) {
      this.con = con;
   }

   // 상품 등록
   public int insertItem(ItemBean itemBean) {
      int insertCount = 0;

      PreparedStatement pstmt = null;

      String sql = "INSERT INTO Item(Item_title,Item_old_price,Item_sel_price,Item_point,"
            + "Item_pic1,Item_pic2,Item_pic3,Item_pic4,Item_content1,Item_content2,Item_display,Item_sales,Item_icon1,Item_category1,Item_category2,Item_stock_price,"
            + "Item_delivery_pee,Item_weight,Item_stock_count,Item_bgpig,Item_date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())";

      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, itemBean.getItem_title());// 상품명
         pstmt.setInt(2, itemBean.getItem_old_price()); // 판매가(정가)
         pstmt.setInt(3, itemBean.getItem_sel_price()); // 판매가(정가)
         pstmt.setInt(4, itemBean.getItem_point());
         pstmt.setString(5, itemBean.getItem_pic1()); // 추가이미지
         pstmt.setString(6, itemBean.getItem_pic2()); // 추가이미지
         pstmt.setString(7, itemBean.getItem_pic3()); // 추가이미지
         pstmt.setString(8, itemBean.getItem_pic4()); // 추가이미지
         pstmt.setString(9, itemBean.getItem_content1());// 상품요약설명
         pstmt.setString(10, itemBean.getItem_content2()); // 상품상세설명
         pstmt.setString(11, itemBean.getItem_display());// 진열상태
         pstmt.setString(12, itemBean.getItem_sales());// 판매상태
         pstmt.setString(13, itemBean.getItem_icon1());// 카테고리
         pstmt.setString(14, itemBean.getItem_category1());// 카테고리
         pstmt.setString(15, itemBean.getItem_category2());// 카테고리
         pstmt.setInt(16, itemBean.getItem_stock_price());// 원가
         pstmt.setInt(17, itemBean.getItem_delivery_pee());// 배송비
         pstmt.setInt(18, itemBean.getItem_weight()); // 판매중량
         pstmt.setInt(19, itemBean.getItem_stock_count()); // 재고
         pstmt.setString(20, itemBean.getItem_bgpic()); // 상품 배경 없는 이미지
         insertCount = pstmt.executeUpdate();
         System.out.println("DB성공");
      } catch (SQLException e) {
         System.out.println("insertItem 실패! - " + e.getMessage());
      } finally {
         close(pstmt);
      }

      return insertCount;
   }

   public int selectListCount(String category) {
      int listCount = 0;

      PreparedStatement pstmt = null;
      ResultSet rs = null;
      System.out.println("daoㅏ카카테고리" + category);

      try {
         if (category.equals("전체")) {
            String sql = "SELECT COUNT(*) FROM Item";
            pstmt = con.prepareStatement(sql);
         } else {
            String sql = "SELECT COUNT(*) FROM Item where Item_category1=? and Item_display=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, category);
            pstmt.setString(2, "yes");
         }
         rs = pstmt.executeQuery();
         System.out.println("daoㅏ카카테고리" + category);
         if (rs.next()) {
            listCount = rs.getInt(1);
            System.out.println("daodododoo에서 " + listCount);
         }

      } catch (SQLException e) {
         System.out.println("selectListCount()  - " + e.getMessage());
      } finally {
         close(rs);
         close(pstmt);
      }

      return listCount;
   }

   public ArrayList<ItemBean> selectArticleList(int page, int limit, String category) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      ArrayList<ItemBean> articleList = new ArrayList<ItemBean>();

      System.out.println("daoㅏ카카테고리 여기서!! 전ㅊ ㅔ??" + category);

      int startRow = (page - 1) * 12;

      try {
         if (category.equals("전체")) {
            String sql = "SELECT * FROM Item LIMIT ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, limit);
         } else {
            String sql = "SELECT * FROM Item where Item_category1=? and Item_display=? LIMIT ?,? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, category);
            pstmt.setString(2, "yes");
            pstmt.setInt(3, startRow);
            pstmt.setInt(4, limit);
         }
         rs = pstmt.executeQuery();
         while (rs.next()) {
            ItemBean itemBean = new ItemBean();
            itemBean.setItem_code(rs.getInt("Item_code"));
            itemBean.setItem_title(rs.getString("Item_title"));
            itemBean.setItem_category1(rs.getString("Item_category1"));
            itemBean.setItem_content1(rs.getString("Item_content1"));
            itemBean.setItem_content2(rs.getString("Item_content2"));
            itemBean.setItem_point(rs.getInt("item_point"));
            itemBean.setItem_bgpic(rs.getString("Item_bgpic"));
            itemBean.setItem_pic1(rs.getString("Item_pic1"));
            itemBean.setItem_pic2(rs.getString("Item_pic2"));
            itemBean.setItem_pic3(rs.getString("Item_pic3"));
            itemBean.setItem_pic4(rs.getString("Item_pic4"));
            itemBean.setItem_display(rs.getString("Item_display"));
            itemBean.setItem_sales(rs.getString("Item_sales"));
            itemBean.setItem_old_price(rs.getInt("Item_old_price"));
            itemBean.setItem_sel_price(rs.getInt("Item_sel_price"));
            itemBean.setItem_stock_price(rs.getInt("Item_stock_price"));
            itemBean.setItem_weight(rs.getInt("Item_weight"));
            itemBean.setItem_delivery_pee(rs.getInt("Item_delivery_pee"));
            itemBean.setItem_stock_count(rs.getInt("Item_stock_count"));
            itemBean.setItem_Date(rs.getDate("Item_Date"));

            articleList.add(itemBean);
         }
      } catch (SQLException e) {
         System.out.println("여기 오류 selectArticleList() - " + e.getMessage());
      } finally {
         close(rs);
         close(pstmt);
      }

      return articleList;
   }

   public ItemBean selectArticle(int item_code) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      ItemBean itemBean = null;

      try {
         String sql = "SELECT * FROM Item WHERE Item_code=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, item_code);
         rs = pstmt.executeQuery();

         if (rs.next()) {

            itemBean = new ItemBean();
            itemBean.setItem_code(rs.getInt("Item_code"));
            itemBean.setItem_title(rs.getString("Item_title"));
            itemBean.setItem_icon1(rs.getString("Item_icon1"));
            itemBean.setItem_category1(rs.getString("Item_category1"));
            itemBean.setItem_category2(rs.getString("Item_category2"));
            itemBean.setItem_content1(rs.getString("Item_content1"));
            itemBean.setItem_content2(rs.getString("Item_content2"));
            itemBean.setItem_point(rs.getInt("item_point"));
            itemBean.setItem_bgpic(rs.getString("Item_bgpic"));
            itemBean.setItem_pic1(rs.getString("Item_pic1"));
            itemBean.setItem_pic2(rs.getString("Item_pic2"));
            itemBean.setItem_pic3(rs.getString("Item_pic3"));
            itemBean.setItem_pic4(rs.getString("Item_pic4"));
            itemBean.setItem_display(rs.getString("Item_display"));
            itemBean.setItem_sales(rs.getString("Item_sales"));
            itemBean.setItem_old_price(rs.getInt("Item_old_price"));
            itemBean.setItem_sel_price(rs.getInt("Item_sel_price"));
            itemBean.setItem_stock_price(rs.getInt("Item_stock_price"));
            itemBean.setItem_weight(rs.getInt("Item_weight"));
            itemBean.setItem_delivery_pee(rs.getInt("Item_delivery_pee"));
            itemBean.setItem_stock_count(rs.getInt("Item_stock_count"));
            itemBean.setItem_Date(rs.getDate("Item_Date"));
         }
      } catch (SQLException e) {
         System.out.println("selectArticle() ���� - " + e.getMessage());
      } finally {
         close(rs);
         close(pstmt);
      }

      return itemBean;
   }

public int UpdateItem(ItemBean itemBean) {
      int updateCount = 0;

      PreparedStatement pstmt = null;

      String sql = "UPDATE Item SET Item_title=?,Item_old_price=?,Item_sel_price=?,Item_content1=?,Item_content2=?,"
            + "Item_pic1=?,Item_pic2=?,Item_pic3=?,Item_pic4=?,Item_display=?,Item_sales=?,Item_icon1=?,Item_category1=?,Item_category2=?,Item_stock_price=?,"
            + "Item_delivery_pee=?,Item_weight=?,Item_stock_count=?,Item_point=?,Item_bgpic=?,Item_date=NOW() where Item_code=?";

      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, itemBean.getItem_title());// 상품명
         pstmt.setInt(2, itemBean.getItem_old_price()); // 판매가(정가)
         pstmt.setInt(3, itemBean.getItem_sel_price()); // 할인후 판매가(정가)
         pstmt.setString(4, itemBean.getItem_content1());// 상품요약설명
         pstmt.setString(5, itemBean.getItem_content2()); // 상품상세설명
         pstmt.setString(6, itemBean.getItem_pic1()); // 추가이미지
         pstmt.setString(7, itemBean.getItem_pic2()); // 추가이미지
         pstmt.setString(8, itemBean.getItem_pic3()); // 추가이미지
         pstmt.setString(9, itemBean.getItem_pic4()); // 추가이미지
         pstmt.setString(10, itemBean.getItem_display());// 진열상태
         pstmt.setString(11, itemBean.getItem_sales());// 판매상태
         pstmt.setString(12, itemBean.getItem_icon1());// 카테고리1
         pstmt.setString(13, itemBean.getItem_category1());// 카테고리1
         pstmt.setString(14, itemBean.getItem_category2());// 카테고리2
         pstmt.setInt(15, itemBean.getItem_stock_price());// 원가
         pstmt.setInt(16, itemBean.getItem_delivery_pee());// 배송비
         pstmt.setInt(17, itemBean.getItem_weight()); // 판매중량
         pstmt.setInt(18, itemBean.getItem_stock_count()); // 재고
         pstmt.setInt(19, itemBean.getItem_point());
         pstmt.setString(20, itemBean.getItem_bgpic()); // 추가이미지
         pstmt.setInt(21, itemBean.getItem_code());

         updateCount = pstmt.executeUpdate();
         System.out.println("DB성공");
      } catch (SQLException e) {
         System.out.println("updateItem 실패! - " + e.getMessage());
      } finally {
         close(pstmt);
      }

      return updateCount;
   }

   public ArrayList<ItemBean> selectItem(String Item_icon1) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      ArrayList<ItemBean> products = new ArrayList<ItemBean>();

      try {
         String sql = "SELECT * FROM Item WHERE Item_icon1=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, Item_icon1);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            ItemBean itemBean = null;
            itemBean = new ItemBean();
            itemBean.setItem_code(rs.getInt("Item_code"));
            itemBean.setItem_title(rs.getString("Item_title"));
            itemBean.setItem_category1(rs.getString("Item_category1"));
            itemBean.setItem_content1(rs.getString("Item_content1"));
            itemBean.setItem_content2(rs.getString("Item_content2"));
            itemBean.setItem_point(rs.getInt("item_point"));
            itemBean.setItem_pic1(rs.getString("Item_pic1"));
            itemBean.setItem_pic2(rs.getString("Item_pic2"));
            itemBean.setItem_pic3(rs.getString("Item_pic3"));
            itemBean.setItem_pic4(rs.getString("Item_pic4"));
            itemBean.setItem_display(rs.getString("Item_display"));
            itemBean.setItem_sales(rs.getString("Item_sales"));
            itemBean.setItem_old_price(rs.getInt("Item_old_price"));
            itemBean.setItem_sel_price(rs.getInt("Item_sel_price"));
            itemBean.setItem_stock_price(rs.getInt("Item_stock_price"));
            itemBean.setItem_weight(rs.getInt("Item_weight"));
            itemBean.setItem_delivery_pee(rs.getInt("Item_delivery_pee"));
            itemBean.setItem_stock_count(rs.getInt("Item_stock_count"));
            itemBean.setItem_Date(rs.getDate("Item_Date"));
            itemBean.setItem_icon1(Item_icon1);
            itemBean.setItem_bgpic(rs.getString("Item_bgpic"));
            products.add(itemBean);
         }

      } catch (SQLException e) {
         System.out.println("selectItem(String item_category1)- " + e.getMessage());
      } finally {
         close(rs);
         close(pstmt);
      }

      return products;

   }

   public ItemBean selectItemInfo(int itemCode) {
      ItemBean itemBean = null;

      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         String sql = "SELECT * FROM Item WHERE Item_code=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, itemCode);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            itemBean = new ItemBean();
            itemBean.setItem_code(rs.getInt("Item_code"));
            itemBean.setItem_title(rs.getString("Item_title"));
            itemBean.setItem_category1(rs.getString("Item_category1"));
            itemBean.setItem_content1(rs.getString("Item_content1"));
            itemBean.setItem_content2(rs.getString("Item_content2"));
            itemBean.setItem_point(rs.getInt("item_point"));
            itemBean.setItem_bgpic(rs.getString("Item_bgpic"));
            itemBean.setItem_pic1(rs.getString("Item_pic1"));
            itemBean.setItem_pic2(rs.getString("Item_pic2"));
            itemBean.setItem_pic3(rs.getString("Item_pic3"));
            itemBean.setItem_pic4(rs.getString("Item_pic4"));
            itemBean.setItem_display(rs.getString("Item_display"));
            itemBean.setItem_sales(rs.getString("Item_sales"));
            itemBean.setItem_old_price(rs.getInt("Item_old_price"));
            itemBean.setItem_sel_price(rs.getInt("Item_sel_price"));
            itemBean.setItem_stock_price(rs.getInt("Item_stock_price"));
            itemBean.setItem_weight(rs.getInt("Item_weight"));
            itemBean.setItem_delivery_pee(rs.getInt("Item_delivery_pee"));
            itemBean.setItem_stock_count(rs.getInt("Item_stock_count"));
            itemBean.setItem_Date(rs.getDate("Item_Date"));

         }

      } catch (SQLException e) {
         System.out.println("selectItemInfo 실패! - " + e.getMessage());
      } finally {
         close(rs);
         close(pstmt);
      }

      return itemBean;
   }

   // 카테1 등록
   public int insertCate1(String cate1) {
      int insertCount = 0;

      PreparedStatement pstmt = null;

      String sql = "INSERT INTO Item(item_category1) VALUES(?)";
      // select distinct Item_category1 from Item where item_category1 like '%%';
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, cate1);// 카테고리1
         insertCount = pstmt.executeUpdate();
         System.out.println("DB성공");
      } catch (SQLException e) {
         System.out.println("insertCate1 실패! - " + e.getMessage());
      } finally {
         close(pstmt);
      }

      return insertCount;
   }

   // 카테1 조회
   public ArrayList<ItemBean> selectCate1() {

      ArrayList<ItemBean> cate1Arr = new ArrayList<ItemBean>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      String sql = "select distinct Item_category1 from Item where Item_category1 is not null ";
      try {
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         System.out.println("카테1조회성공" + rs);
         while (rs.next()) {
            ItemBean cate = new ItemBean();
            cate.setItem_category1(rs.getString("item_category1"));
            cate1Arr.add(cate);
         }

      } catch (SQLException e) {
         System.out.println("selectCate 실패! - " + e.getMessage());
      } finally {
         close(pstmt);
         close(rs);
      }

      return cate1Arr;
   }

   // 카테2 조회
   public ArrayList<ItemBean> selectCate2() {

      ArrayList<ItemBean> cate2Arr = new ArrayList<ItemBean>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      String sql = "select distinct Item_category2 from Item where Item_category2 is not null ";
      try {
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         System.out.println("카테2조회성공" + rs);
         while (rs.next()) {
            ItemBean cate = new ItemBean();
            cate.setItem_category2(rs.getString("item_category2"));
            cate2Arr.add(cate);
         }

      } catch (SQLException e) {
         System.out.println("selectCate2 실패! - " + e.getMessage());
      } finally {
         close(pstmt);
         close(rs);
      }

      return cate2Arr;
   }

   // 카테2 등록
   public int insertCate2(String cate2) {
      int insertCount = 0;

      PreparedStatement pstmt = null;

      String sql = "INSERT INTO Item(item_category2) VALUES(?)";
      // select distinct Item_category1 from Item where item_category1 like '%%';
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, cate2);// 카테고리1
         insertCount = pstmt.executeUpdate();
         System.out.println("DB성공");
      } catch (SQLException e) {
         System.out.println("insertCate2 실패! - " + e.getMessage());
      } finally {
         close(pstmt);
      }

      return insertCount;
   }

   public ArrayList<ItemBean> selectArticleList(ItemBean pb) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      ArrayList<ItemBean> articleList = new ArrayList<ItemBean>();

      try {

         System.out.println("디에오 체크/" + pb.getPickStart() + "/" + pb.getPickEnd());
//                 + "Item_code like ifnull(?,'%%') "

         String sql = "SELECT * FROM Item where " + "Item_title like ifnull(?,'%%') " + "and Item_date >= ?"
               + "and Item_date <= ?" + "and Item_display like ifnull(?,'%%') "
               + "and Item_sales like ifnull(?,'%%')" + "and Item_category1 like ifnull(?,'%%')"+ "and Item_icon1 like ifnull(?,'%%')";

         pstmt = con.prepareStatement(sql);
//         pstmt.setString(1, ob.getOrder_item_option_color());
//         pstmt.setInt(1,pb.getItem_code());
         pstmt.setString(1, pb.getItem_title());
         pstmt.setDate(2, pb.getPickStart());
         pstmt.setDate(3, pb.getPickEnd());
         pstmt.setString(4, pb.getItem_display());
         pstmt.setString(5, pb.getItem_sales());
         pstmt.setString(6, pb.getItem_category1());
         pstmt.setString(7, pb.getItem_icon1());
         rs = pstmt.executeQuery();

         while (rs.next()) {
            ItemBean itemBean = new ItemBean();
            itemBean.setItem_code(rs.getInt("Item_code"));
            itemBean.setItem_title(rs.getString("Item_title"));
            itemBean.setItem_icon1(rs.getString("Item_icon1"));
            itemBean.setItem_category1(rs.getString("Item_category1"));
            itemBean.setItem_category2(rs.getString("Item_category2"));
            itemBean.setItem_content1(rs.getString("Item_content1"));
            itemBean.setItem_content2(rs.getString("Item_content2"));
            itemBean.setItem_point(rs.getInt("item_point"));
            itemBean.setItem_bgpic(rs.getString("Item_bgpic"));
            itemBean.setItem_pic1(rs.getString("Item_pic1"));
            itemBean.setItem_pic2(rs.getString("Item_pic2"));
            itemBean.setItem_pic3(rs.getString("Item_pic3"));
            itemBean.setItem_pic4(rs.getString("Item_pic4"));
            itemBean.setItem_display(rs.getString("Item_display"));
            itemBean.setItem_sales(rs.getString("Item_sales"));
            itemBean.setItem_old_price(rs.getInt("Item_old_price"));
            itemBean.setItem_sel_price(rs.getInt("Item_sel_price"));
            itemBean.setItem_stock_price(rs.getInt("Item_stock_price"));
            itemBean.setItem_weight(rs.getInt("Item_weight"));
            itemBean.setItem_delivery_pee(rs.getInt("Item_delivery_pee"));
            itemBean.setItem_stock_count(rs.getInt("Item_stock_count"));
            itemBean.setItem_Date(rs.getDate("Item_Date"));
            articleList.add(itemBean);

         }

         System.out.println("ItemDAO: itemdao 담긴거 확인:" + articleList);
      } catch (SQLException e) {
         System.out.println("selectArticleList() 에러 - " + e.getMessage());
      } finally {
         close(rs);
         close(pstmt);
      }

      return articleList;
   }

   public int UpdateItem1(ItemBean itemBean) {
      int updateCount = 0;

      PreparedStatement pstmt = null;

      String sql = "UPDATE Item SET Item_display=?,Item_sales=?  where Item_code=?";

      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, itemBean.getItem_display());// 진열상태
         pstmt.setString(2, itemBean.getItem_sales());// 판매상태
         pstmt.setInt(3, itemBean.getItem_code());
         updateCount = pstmt.executeUpdate();
         System.out.println("DB성공");
      } catch (SQLException e) {
         System.out.println("updateItem 실패! - " + e.getMessage());
      } finally {
         close(pstmt);
      }

      return updateCount;
   }

   public int Delete(int item_code) {
      PreparedStatement pstmt = null;
      int deleteCount = 0;

      try {
         String sql = "DELETE from Item where Item_code=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, item_code);
         deleteCount = pstmt.executeUpdate();
         System.out.println("DeleteDB성공");
      } catch (SQLException e) {
         System.out.println("DELETEItem 실패! - " + e.getMessage());
      } finally {
         close(pstmt);
      }
      return deleteCount;

   }

   public int updateItemInfo(int itemCode, int stock_count) {
      PreparedStatement pstmt = null;
      int updateCount = 0;

      String sql = "UPDATE Item SET Item_stock_count=? where Item_code=?";

      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, stock_count);// 진열상태
         pstmt.setInt(2, itemCode);// 판매상태
         updateCount = pstmt.executeUpdate();
         System.out.println("재고DB성공");
      } catch (SQLException e) {
         System.out.println("updateItem 재고 실패! - " + e.getMessage());
      } finally {
         close(pstmt);
      }
      return updateCount;
   }

}