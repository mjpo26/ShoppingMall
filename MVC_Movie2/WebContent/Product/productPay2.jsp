<%@page import="vo.BasketListBean"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 	ItemBean itemBean = (ItemBean) request.getAttribute("itemBean");
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
	BasketListBean basketListBean= (BasketListBean) request.getAttribute("basketListBean");
	String nowPage = (String) request.getAttribute("page");
	String sId = (String)session.getAttribute("sId");
// 	int item_code_count = Integer.parseInt((String)request.getAttribute("item_code_count"));
// 	int itemCode = itemBean.getItem_code();
	
// 	String item_color=(String)request.getAttribute("item_color");
// 	itemBean.setItem_color(Item_color);
%>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#checkBoxId").change(function(){
        if($("#checkBoxId").is(":checked")){
            alert("체크");
        }else{
            alert("체크 해제");
        }
    });
});

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="orderPro.sh" method="post" name="orderForm">
	  <input type="hidden" name="itemCode" value=<%=basketListBean.getBasket_code()%>>
		<table border="1">
			<tr>
				<th width="100">상품이미지</th>
				<th width="400">상품명</th>
				<th width="100">수량</th>
				<th width="100">색상</th>
				<th width="100">적립금</th>
				<th width="100">가격</th>
			</tr>

			<tr>
				<td align="center">상품이미지</td>
				<td align="center"><input type="text" name="item_title" value="<%=basketListBean.getBasket_title()%>"></td>
				<td align="center"><%=basketListBean.getBasket_code_count()%></td>
					<td align="center"><%=basketListBean.getBasket_option_color()%></td>
				<td align="center"><%=basketListBean.getBasket_point()*basketListBean.getBasket_code_count()%></td>
				<td align="center"><%=basketListBean.getBasket_sel_price()*basketListBean.getBasket_code_count()%></td>
				<input type="hidden" name="item_point" value=<%=basketListBean.getBasket_point()*basketListBean.getBasket_code_count()%>>
			</tr>
		</table>

		<br> <br>

		<table border="1">
			<tr>
				<th align="left" width="400" colspan="2">주문자 정보</th>
			</tr>

			<tr>
				<th width="100" align="center">이름</th>
				<td align="center"><%=memberBean.getMember_name()%></td>
			</tr>
			<tr>
				<th width="100" align="center">이메일</th>
				<td align="center"><%=memberBean.getMember_email()%></td>
			</tr>
			<tr>
				<th width="100" align="center">연락처</th>
				<td align="center"><%=memberBean.getMember_phone()%></td>
			</tr>
		</table>

		<br> <br>

		<table border="1">
			<tr>
				<th align="left" width="400" colspan="4">배송지 정보</th>
			</tr>

			<tr>
				<th width="100" align="center">이름</th>
				<td align="center" colspan="3"><%=memberBean.getMember_name()%></td>
			</tr>
			<tr>
				<th width="100" align="center">연락처1</th>
				<td align="center"><%=memberBean.getMember_phone()%></td>
				<th width="100" align="center">비상연락망</th>
				<td align="center">불러오기</td>
			</tr>
			<tr>
				<th width="100" align="center">배송지 선택</th>
				<td align="center" colspan="3">주소 선택</td>
			</tr>
			<tr>
				<th width="100" align="center">배송지</th>
				<td align="center" colspan="3"><%=memberBean.getMember_address1()%></td>
			</tr>

			<tr>
			<td>무통장 은행</td><td><select name="order_bank">
			<option value="신한은행">신한은행</option>
			<option value="국민은행">국민은행</option>
			<option value="농협은행">농협은행</option>
			</select>
				<th width="100" align="center">무통장 입금자명</th>
				<td align="center" colspan="3"><input type="text" value="<%=memberBean.getMember_name()%>"></td>
			</tr>
			<tr><td>배송문의</td><td colspan="3"><textarea name="order_memo" rows="15" cols="60"></textarea>
			
		</table>
		<br> <br>

		<table border="1">
			<tr>
				<th align="left" width="600" colspan="6">주문결제내역</th>
			</tr>

			<tr>
				<td align="center">상품금액 <%=basketListBean.getBasket_new_price() * basketListBean.getBasket_code_count()%> - 할인금액<%=basketListBean.getBasket_new_price()*basketListBean.getBasket_code_count()-basketListBean.getBasket_sel_price()*basketListBean.getBasket_code_count() %> = 총금액  <%=basketListBean.getBasket_sel_price()*basketListBean.getBasket_code_count()%> </td>
			</tr>
			<tr>
				<td align="right" colspan="3"><input type="text" id="usedPoint" name="usedPoint">적립금사용
				<input type="checkbox" id="checkBoxId" name="checkBoxId" onclick="usedpoint()">사용가능금액(<%=memberBean.getMember_mypoint()%>)</td>
			</tr>
		</table>
		<input type="submit" value="상품주문"> 
		<input type="reset" value="취소">
	</form>
</body>
</html>