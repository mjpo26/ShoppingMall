<%@page import="vo.MemberBean"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ItemBean itemBean = (ItemBean) request.getAttribute("itemBean");
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
	String nowPage = (String) request.getAttribute("page");
	String sId = (String) session.getAttribute("sId");
	int item_code_count = Integer.parseInt((String) request.getAttribute("item_code_count"));
	int itemCode = itemBean.getItem_code();

	String item_color = (String) request.getAttribute("item_color");
	// 	itemBean.setItem_color(Item_color);
	int mypoint1 = memberBean.getMember_mypoint(); 
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#checkBoxId").change(function() {
			if ($("#checkBoxId").is(":checked")) {
				alert("이제 포인트 사용됩니다~");
				$("#usedPoint").attr("readonly", false); 
			} else {
				alert("포인트 사용안됩니다~");
				 $("#usedPoint").text(' ');
				$("#usedPoint").attr("readonly", true); 
// 				$("#usedPoint").html(" ");
				
			}
		});
	});
</script>
<script type="text/javascript">
$(function() {
    $('[name=usedPoint]').keyup(function(){
      var usedPoint = $('input[id=usedPoint]').val();
      usedPoint *=1;
      var mypoint =  <%=mypoint1%>;
      mypoint *=1;
      result = <%=itemBean.getItem_sel_price() * item_code_count %> -usedPoint;
//       var mypoint =  $("input[id=mypoint]").val();
 
//       alert(typeof usedPoint); 
//       alert(usedPoint);
//       alert(typeof mypoint);
//       alert(mypoint);
//       alert(usedPoint+mypoint);
          if(usedPoint<0){
        	  alert('0원 이상의 금액을 적어주세요.');
        	  document.orderForm.usedPoint.focus();
          }
          else if ( usedPoint > mypoint) {
             $('#text3').css('color','red');
             $('span#result').css('color','red');
             $('#text3').text('사용가능 금액이 초과하였습니다!');
             document.getElementById('usedPoint').value = '';
             usedPoint *=1;
             document.getElementById('usedOk').value = 'no';
<%--              $('span#result').append("상품금액"+<%=itemBean.getItem_old_price() * item_code_count%>+"할인금액"+<%=itemBean.getItem_old_price() * item_code_count - itemBean.getItem_sel_price() * item_code_count%> +"적립금" + usedPoint + "총금액"+<%=itemBean.getItem_sel_price() * item_code_count%>); --%>
<%-- 			$('span#result').html('상품금액 : '+<%=itemBean.getItem_old_price() * item_code_count%>+'원 - 할인금액 : '+<%=itemBean.getItem_old_price() * item_code_count - itemBean.getItem_sel_price() * item_code_count%> +'원 - 적립금 : ' + usedPoint + '원 = 총금액 : '+result+'원'); --%>
            }
          
          else{
            	$('#text3').css('color','blue');
                
                $('#text3').text('사용가능 합니다!');   
                document.getElementById('usedOk').value = 'yes';
//                 $('span#Review_subject'+i).append(data[i].review_subject);
<%--                 $('span#result').append("상품금액"+<%=itemBean.getItem_old_price() * item_code_count%>+"할인금액"+<%=itemBean.getItem_old_price() * item_code_count - itemBean.getItem_sel_price() * item_code_count%> +"적립금" + usedPoint + "총금액"+<%=itemBean.getItem_sel_price() * item_code_count %>); --%>
				$('span#result').css('color','blue');
				$('span#result').html('상품금액 : '+<%=itemBean.getItem_old_price() * item_code_count%>+'원 - 할인금액 : '+<%=itemBean.getItem_old_price() * item_code_count - itemBean.getItem_sel_price() * item_code_count%> +'원 - 적립금 : ' + usedPoint + '원 = 총금액 : '+result+'원');
                
                
<%--                 <span style="font-weight: bold;">상품금액</span>: <%=itemBean.getItem_old_price() * item_code_count%> --%>
<%-- 				- <span style="font-weight: bold;">할인금액</span>: <%=itemBean.getItem_old_price() * item_code_count - itemBean.getItem_sel_price() * item_code_count%> --%>
<%-- 				= <span style="font-weight: bold;">총금액</span>: <%=itemBean.getItem_sel_price() * item_code_count%> --%>
            }
       
       
    });
 });
function check() {

    if (document.orderForm.usedOk.value == 'no') {
        alert('적립금을 초과하셨습니다.');
        document.orderForm.usedPoint.focus();
        return false;
    }
}

</script>
<jsp:include page="../assets/top.jsp"></jsp:include>


<!-- breadcrumb start-->
<section class="breadcrumb breadcrumb_bg">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-lg-8">
            <div class="breadcrumb_iner">
               <div class="breadcrumb_iner_item">
                  <h2>장바구니</h2>
                  <p>
                     장바구니 <span>-</span>장바구니 현황
                  </p>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- breadcrumb start-->
<!--================End Home Banner Area =================-->
<form action="orderPro.sh" method="post" name="orderForm" onsubmit="return check()">
   <section class="cart_list shopping_cart mt-5">
      <div class="container">
         <div class="row clearfix">

            <!-- <form action="orderPro.sh" method="post" name="orderForm"> -->

            <input type="hidden" name="itemCode" value=<%=itemCode%>> 
            <input type="hidden" name="item_code_count" value=<%=item_code_count%>>
            <input type="hidden" name="item_color" value=<%=item_color%>>
            <input type="hidden" name="order_item_sel_price" value=<%=itemBean.getItem_sel_price()%>> 
            <input type="hidden" name="item_point" value=<%=itemBean.getItem_point() * item_code_count%>>
            <table class="table">
               <tr>
                  <th align="left" width="800" colspan="6"><span
                     style="color: red; font-weight: bold;">상품 정보</span></th>
               </tr>
               <tr>
                  <th width="200" align="center">상품이미지</th>
                  <td width="200" align="center" colspan="2">상품이미지</td>
                  <th width="200" align="center">상품명</th>
                  <td width="200" align="center" colspan="2"><%=itemBean.getItem_title()%></td>
               </tr>

               <tr>
                  <th width="200" align="center">수량</th>
                  <td width="200" align="center" colspan="2"><%=item_code_count%></td>
                  <th width="200" align="center">색상</th>
                  <td width="200" align="center" colspan="2"><%=item_color%></td>

               </tr>
               <tr>
                  <th width="200" align="center">적립금</th>
                  <td width="200" align="center" colspan="2"><%=itemBean.getItem_point() * item_code_count%></td>
                  <th width="200" align="center">가격</th>
                  <td width="200" align="center" colspan="2"><%=itemBean.getItem_sel_price() * item_code_count%></td>

               </tr>
               <tr>
                  <th align="left" width="800" colspan="6"><span
                     style="color: red; font-weight: bold;">주문자 정보</span></th>
               </tr>
               <tr>
                  <th width="200" align="center">이름</th>
                  <td width="200" align="center" colspan="2"><%=memberBean.getMember_name()%></td>
                  <th width="200" align="center">이메일</th>
                  <td width="200" align="center" colspan="2"><%=memberBean.getMember_email()%></td>
               </tr>
               <tr>
                  <th width="200" align="center">연락처</th>
                  <td width="200" align="center" colspan="2"><%=memberBean.getMember_phone()%></td>
                  <th width="200" align="center">배송지 정보</th>
                  <td width="200" align="center" colspan="2"><%=memberBean.getMember_address1()%></td>
               </tr>
               <tr>
                  <th width="200" align="center">무통장 은행</th>
                  <td width="200" align="center" colspan="2"><select
                     name="order_bank">
                        <option value="신한은행">신한은행</option>
                        <option value="국민은행">국민은행</option>
                        <option value="농협은행">농협은행</option>
                  </select>
                  <th width="200" align="center">무통장 입금자명</th>
                  <td width="200" align="center" colspan="2"><input type="text"
                     value="<%=memberBean.getMember_name()%>"></td>
               </tr>
               <tr>
                  <th width="200" align="center">배송문의</th>
                  <td width="400" colspan="5"><textarea name="order_memo"
                        rows="5" cols="40"></textarea>
               <tr>
                  <th align="left" width="600" colspan="6"><span
                     style="color: red; font-weight: bold;">주문결제내역 </span></th>
               </tr>

               <tr>
                  <td align="left" width="600" colspan="6">
                  <span style="font-weight: bold;" id = "result"></span>
<!--                   <span -->
<%--                      style="font-weight: bold;">상품금액</span>: <%=itemBean.getItem_old_price() * item_code_count%> --%>
<%--                      - <span style="font-weight: bold;">할인금액</span>: <%=itemBean.getItem_old_price() * item_code_count - itemBean.getItem_sel_price() * item_code_count%> --%>
<%--                      = <span style="font-weight: bold;">총금액</span>: <%=itemBean.getItem_sel_price() * item_code_count%> --%>
                  </td>
               </tr>
               <tr>
                  <td align="right" colspan="6"><input type="text"
                     id="usedPoint" name="usedPoint" readonly>적립금사용 <input
                     type="checkbox" id="checkBoxId" name="checkBoxId">
           			   사용가능금액(<%=memberBean.getMember_mypoint()%>)
                     
                     <span id="text3" style="padding-left:0.5em;">사용이 안됩니다.</span>
                     <input type ="hidden" id="usedOk" value="no">
                     </td>
                     
               </tr>
            </table>
            <input type="submit" class="btn_3" value="상품주문"> <input
               type="reset" class="btn_3" value="취 소">
         </div>
      </div>
   </section>

</form>

<jsp:include page="../assets/foot.jsp"></jsp:include>