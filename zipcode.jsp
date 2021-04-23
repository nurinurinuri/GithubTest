
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"
	import="java.util.*, member.*, java.io.PrintWriter"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
MemberDAO dao = new MemberDAO();
String _dong = request.getParameter("dong");
List<ZipCodeVO> list = dao.zipcodesearch(_dong);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 검색 결과</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function filladd(zipcode, sido, gugun, dong, ri, bunji) {
		var addr = sido + " " + gugun + " " + dong + " " + ri + " " + bunji;
		opener.document.form1.postalcode.value = zipcode;
		opener.document.form1.address1.value = addr;
		this.close();
	}

	function zipcodesearch() {
		if (document.zipForm.zipcode == "") {
			alert("동 이름을 입력해주세요.");
			return;
		}

	}
</script>
</head>
<body>

	<table>
		<form name="zipForm" method="post" action="zipcode.jsp">
		<tr>
			<td><br> <input type="text" name="dong" id="dong" size="30"
				placeholder="동 이름을 입력하세요."> <input type="button" value="검색"
				onClick="zipcodesearch()"></td>
		</tr>
		<input type="hidden" name="check" value="n">
		</form>
		<%
/* 		if (check.equlas("n")) { // 검색버튼 눌렀다면  */
			if (list.isEmpty()) { // 데이터 없다면
		%>
		<tr>
			<td align="center">검색된 레코드가 없습니다.</td>
		</tr>
		<%
		} else {
		%>
		<tr>
			<td align="center"><br> 아래 우편번호 클릭</td>
		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			ZipCodeVO vo = list.get(i);
			String zipcode = vo.getZipcode();
			String sido = vo.getSido();
			String gugun = vo.getGugun();
			String dong = vo.getDong();
			String ri = vo.getRi();
			String bunji = vo.getBunji();
		%>
		<tr>
			<td><a
				href="JavaScript:filladd('<%=zipcode%>', '<%=sido%>','<%=gugun%>','<%=dong%>','<%=ri%>','<%=bunji%>')">
					<%=zipcode%>&nbsp;<%=sido%>&nbsp;<%=gugun%>&nbsp;<%=dong%>&nbsp;<%=ri%>&nbsp;<%=bunji%>
			</a><br> <%
 } // end for
 } // end else
/*  } // end if */
 %></td>
		</tr>
	</table>
</body>
</html>
