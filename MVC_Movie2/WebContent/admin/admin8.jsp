<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.Admin_memberPageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

	<%
   //Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<MemberBean> memberList = (ArrayList<MemberBean>) request.getAttribute("memberList");
	Admin_memberPageInfo pageInfo = (Admin_memberPageInfo) request.getAttribute("pageInfo");

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
<title>관리자 고객관리</title>
</head>
<body>
	<table border="1">

		<tr>

			<th colspan='2'>관리자_고객관리</th>

		</tr>

		<tr>

			<th>검색어</th>

			<td><label>아이디적는곳</label><input type="text" size="10"  name="searchKey"></td>

		</tr>

		<tr>

			<th>sms수신</th>

			<td><input type="radio" name="smsOk" value="수신허용" checked="checked">수신허용<input
				type="radio" name="smsOk" value="수신안함">수신안함</td>

		</tr>

		<tr>

			<th>email수신</th>

			<td><input type="radio" name="emailOk" value="수신허용" checked="checked">수신허용<input
				type="radio" name="emailOk" value="수신안함">수신안함</td>

		</tr>


		

	</table>
<input type="button" value="검색" >
<br><br>
	<table border="1">

		<tr>

			<td colspan='11'>[검색결과 0건]&nbsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;
				<select>
				<option>주문일 순</option>
				<option>오름차순</option>
				<option>내림차순</option>

			</select><select>
			<option>10개</option>
			<option>20개</option>
			<option>50개</option>

			</select></td>

		</tr>

		<tr>

			<td><input type="checkbox"></td>

			<td>이름</td>

			<td>아이디</td>

			<td>가입일</td>

			<td>휴대전화</td>

			<td>나이</td>

			<td>지역</td>

			<td>메일수신</td>

			<td>sns수신</td>

			<td>메모</td>

			<td>추가항목?</td>

		</tr>

		<tr>
			<td colspan='11'>//여기부터는 db를 이용해서 for문을 이용 어레이list</td>
		</tr>

		<tr>
			<td colspan='11'><input type="button" value="회원삭제"><input
				type="button" value="회원수정"><input type="button"
				value="이메일전송"><input type="button" value="sns전송">
	</table>
</body>
</html>