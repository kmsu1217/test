<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>mysql ���� �׽�Ʈ</title>
</head>
<body>
<%
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		String url = "jdbc:mysql://localhost:3306/dbL3";
		Connection con = DriverManager.getConnection(url, "root", "1111");
		
		if(con != null)
			out.println("���� ����");
		else
			out.println("���� ����");
	}
	catch(Exception err){
		System.out.println("���� ���� : " + err);
	}
%>
</body>
</html>