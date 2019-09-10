<%@page import="vo.Basket_PageInfo"%>
<%@page import="vo.BasketListBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	ArrayList<BasketListBean> articleList = (ArrayList<BasketListBean>) request.getAttribute("articleList");
	Basket_PageInfo basket_pageInfo = (Basket_PageInfo) request.getAttribute("basket_pageInfo");

	int listCount = basket_pageInfo.getListCount();
	int nowPage = basket_pageInfo.getPage();
	int startPage = basket_pageInfo.getStartPage();
	int endPage = basket_pageInfo.getEndPage();
	int maxPage = basket_pageInfo.getMaxPage();
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<br> <br>
		<table border="1">

			<tr>

				<th colspan='14'>장바구니 리스트 출력</th>


			</tr>

			<tr>

				<td colspan='14'>[검색결과 <%=listCount %>건]&nbsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp; <select><option>등록일
						<option>오름차순
						<option>내림차순</select><select>
						<option>10개
						<option>20개
						<option>50개
				</select>
				<input type="button" value="검색">
				</td>

			</tr>
			<tr>
				<th><input type="checkbox"></th>
				<th>주문번호</th>
				<th>주문자</th>
				<th>상품명</th>
				<th>수량</th>
				<th>색상</th>
				<th>사이즈</th>
				<th>상품금액</th>
				<th>할인금액</th>
				<th>할인적용금액</th>
				<th>적립포인트</th>
				<th>배송비</th>
				<th>주문</th>
			</tr>
		<%
				for (int i = 0; i < articleList.size(); i++) {
		%>
			<tr>
				<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
				<th><input type="checkbox"></th>
				<th><%=articleList.get(i).getBasket_code()%></th>
				<th><%=articleList.get(i).getBasket_member_id()%></th>
				<th><%=articleList.get(i).getBasket_title()%></th>
				<th><%=articleList.get(i).getBasket_option_color()%></th>
				<th><%=articleList.get(i).getBasket_option_size()%></th>
				<th><%=articleList.get(i).getBasket_code_count()%></th>
				<th><%=articleList.get(i).getBasket_sel_price()%></th>
				<th><%=articleList.get(i).getBasket_new_price()%></th>
				<th><%=articleList.get(i).getBasket_point()%></th>
				<th><%=articleList.get(i).getBasket_delivery_pee() %></th>
				<th><%=articleList.get(i).getBasket_date()%></th>
				<th><input type="button" value="주문하기"><br>
			<input type="button" value="삭제하기"></th>
			</tr>
			<%
				}
			%>

		</table>
		
			<section id="pageList">
		<%
			if (nowPage <= 1) {
		%>
		[이전]&nbsp;
		<%
			} else {
		%>
		<a href="BasketList.bl?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
		<%
			}
		%>

		<%
			for (int i = startPage; i <= endPage; i++) {
					if (i == nowPage) {
		%>
		[<%=i%>]
		<%
			} else {
		%>
		<a href="BasketList.bl?page=<%=i%>">[<%=i%>]
		</a>&nbsp;
		<%
			}
		%>
		<%
			}
		%>

		<%
			if (nowPage >= maxPage) {
		%>
		&nbsp;[다음]
		<%
			} else {
		%>
		<a href="BasketList.bl?page=<%=nowPage + 1%>">&nbsp;[다음]</a>
		<%
			}
		%>
	</div>
</body>
</html>