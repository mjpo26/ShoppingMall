<%@page import="vo.OrderBean"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	try {
		int num = Integer.parseInt(request.getParameter("num"));
	} catch (Exception e) {

	}
	String sId = (String) session.getAttribute("sId");
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
	OrderBean OrderBean = (OrderBean) request.getAttribute("OrderBean");
	// 세션 아이디 없으면 Main.qa 로 이동
	if (sId == null) {
		out.println("<script>");
		out.println("alert('로그인이 필요한 메뉴입니다!')");
		out.println("location.href='Main.qa'");
		out.println("</script>");
	}
%>
<jsp:include page="../main/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>리뷰 게시판</h2>
						<p>
							리뷰 보기 <span>-</span> 상품 리뷰 보기
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</head>
<body>

	<section class="review_board_content board_content">
		<div class="container">
			<div class="review_content col-lg-8 mx-auto mt-5 p-5">
				<form action="./ReviewBoardWritePro.re" method="post" enctype="multipart/form-data">
					<input type="hidden" name="review_writer" value=<%=memberBean.getMember_name()%>> 
					<input type="hidden" name="review_id" value="<%=sId%>"> 
					<input type="hidden" name="order_idx" value=<%=OrderBean.getOrder_idx()%>>
					<input type="hidden" name="order_item_code" value=<%=OrderBean.getOrder_item_code()%>>
					<input type="hidden" name="order_item_name" value=<%=OrderBean.getOrder_item_title()%>>
						
						
					<h3 class="mb-30"><%=OrderBean.getOrder_item_title()%> - 리뷰 작성</h3>
					<table class="table">
						<tr>
							<td>제목</td>
							<td><input type="text" name="review_subject" class="form-control"></td>
						</tr>
						<tr>
							<td>비밀번호
						
							</td>
							<td>
							
							<input type="password" name="review_pass" class="form-control" placeholder="글을 수정,삭제할때 입력할 비밀번호를 입력하세요"></td>
						
						</tr>
						<tr>
							<td>상품명</td>
							<td><input type="text" name="order_item_title" class="form-control"
								value="<%=OrderBean.getOrder_item_title()%>"></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td colspan="3"><input type="file" name="review_file1" class="form-control-file"></td>
						</tr>
						<tr>
							<td>별 점</td>
							<td>
								<input type="radio" name="review_starPoint" value="1">&nbsp;
								<span class="review_score"><i class="fa fa-star"></i></span>
								<input type="radio" name="review_starPoint" value="2"> &nbsp;
								<span class="review_score"><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
								<input type="radio" name="review_starPoint" value="3">&nbsp;
								<span class="review_score"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
								<input type="radio" name="review_starPoint" value="4">&nbsp;
								<span class="review_score"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
								<input type="radio" name="review_starPoint" value="5">&nbsp;
								<span class="review_score"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
							</td>
						</tr>
						<tr>
							<td>글내용</td>
							<td><textarea name="review_content" rows="10" cols="20" class="form-control">
					</textarea></td>
						</tr>
						
						<tr>
						<th></th>
						<td> 
						<input type="submit" value="글쓰기" class="genric-btn primary radius submit">
						<input type="reset" value="취소" class="genric-btn default radius" onclick="history.back()">
						</td>
						
						</tr>
					</table>
				
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../main/foot.jsp"></jsp:include>