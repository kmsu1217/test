<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>mysql 연결 테스트</title>
</head>
<body>
<%
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		String url = "jdbc:mysql://localhost:3306/dbL3";
		Connection con = DriverManager.getConnection(url, "root", "1111");
		
		if(con != null)
			out.println("연결 성공");
		else
			out.println("연결 실패");
	}
	catch(Exception err){
		System.out.println("연결 실패 : " + err);
	}
%>
</body>
</html>