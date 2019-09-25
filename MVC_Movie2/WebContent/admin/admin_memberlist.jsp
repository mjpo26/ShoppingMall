<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<%

   //Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
   ArrayList<MemberBean> memberList = (ArrayList<MemberBean>) request.getAttribute("memberList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

   // PageInfo 객체로부터 페이징 정보 가져오기
   int listCount = pageInfo.getListCount();
   int nowPage = pageInfo.getPage();
   int startPage = pageInfo.getStartPage();
   int endPage = pageInfo.getEndPage();
   int maxPage = pageInfo.getMaxPage();

   // 세션 아이디 가져오기
   String sId = (String) session.getAttribute("sId");

   // 만약, 회원만 게시판 목록 조회가 가능할 경우
   // 세션 아이디 없으면 Main.bo 로 이동

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 날짜선택 임포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 날짜선택임포트 끝 -->
<!--  게시판 datatables -->
<!-- <link rel="stylesheet" type="text/css"
   href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />
<script type="text/javascript"
   src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
   
    <script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable();
    } );
    
   </script> -->
<!-- 날짜선택 스크립트 -->
<script>
   $(function() {

      $("#pickStart").datepicker();

   });

   $(function() {

      $("#pickEnd").datepicker();

   });
</script>
<!-- 날짜선택 스크립트 -->
<script>
   $(function() {

      $("#pickStart").datepicker();

   });

   $(function() {

      $("#pickEnd").datepicker();

   });
   
   
</script>

<script type = "text/javascript">
function pickNullCheck(){
   if(document.fr1.pickStart.value==""){
//      document.fr1.pickStart.value=="2015-01-01";
      var pickStart = $('#pickStart').val('01/01/2010');

      return false;
   }
   if(document.fr1.pickEnd.value==""){
    //   document.fr1.pickEnd.value=="2020-01-01";
      var pickEnd =  $('#pickEnd').val('01/01/2020');
   
      return false;
   }
   
   //
   
   
}

</script>

<!-- 날짜선택 스크립트 끝 -->
<style type="text/css">
div.container {
        width: 80%;
    }
</style>


<title>관리자 고객관리</title>
</head>
<body>

   <form action="./Admin_memberList.admin" name="fr1" method="post" onsubmit="return pickNullCheck()">

      <table border="1">
         <tr>

            <th colspan='2'>관리자_고객관리</th>

         </tr>
         <tr>

            <th>검색어(드롭다운으로 합치기)</th>

            <td><label>Id검색</label><input type="text" size="10"
               name="searchId"></td>

         </tr>

         <tr>

            <th>검색어(드롭다운으로 합치기)</th>

            <td><label>이름 검색</label><input type="text" size="10"
               name="searchName"></td>

         </tr>

         <tr>

            <th>검색어(드롭다운으로 합치기)</th>

            <td><label>전화번호 검색</label><input type="text" size="10"
               name="searchPhone"></td>

         </tr>

         <tr>

            <th>sms수신</th>

            <td><input type="radio" name="smsOk" value="ok">수신허용<input
               type="radio" name="smsOk" value="no">수신안함</td>

         </tr>

         <tr>

            <th>email수신</th>

            <td><input type="radio" name="emailOk" value="ok">수신허용<input
               type="radio" name="emailOk" value="no">수신안함</td>

         </tr>
         <tr>
            <td>시작날짜:<input type="text" name="pickStart" id="pickStart" >
            끝 날짜:<input type="text" name="pickEnd" id="pickEnd" ></td>


         </tr>



      </table>
      <input type="submit" value="검색" >
   </form>
   
   <p>
   <div style="height: 200px; width: 900px; float: left;">
   <br>
   <br>
   
   <table id="example" class="display compact" border="1">
   <thead>
      <tr>
         <td><input type="checkbox"></td>
         <th>Id</th>
         <th>이름</th>
         <th>주소</th>
         <th>휴대전화</th>
         <th>메일수신</th>
         <th>sns수신</th>
         <th>포인트내역</th>
         <th>수정</th>
      </tr>
      </thead>
      <tbody>
      <tr>
         <%
            for (int i = 0; i < memberList.size(); i++) {
         %>
      
      <tr>
         <!-- 여기서 For문 돌려서 list를 받아옵니다. -->
         <td><input type="checkbox"></td>
         <td><%=memberList.get(i).getMember_id()%></td>
         <td><%=memberList.get(i).getMember_name()%></td>
         <td><%=memberList.get(i).getMember_address1()%></td>
         <td><%=memberList.get(i).getMember_phone()%></td>
         <td><%=memberList.get(i).getMember_email_ok()%></td>
         <td><%=memberList.get(i).getMember_sms_ok()%></td>
         <td><%=memberList.get(i).getMember_mypoint()%></td>
         <td>
         <input type="button" value="회원삭제">
         <input type="button" value="회원수정">
         <input type="button" value="이메일전송">
         <input type="button" value="sns전송"></td>
      </tr>
      <%
         }
      %>
   </tbody>
   <tfoot>
   </tfoot>
   </table>
   </div>
</body>
</html>
