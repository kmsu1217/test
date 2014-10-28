<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import = "java.sql.*, java.io.*, java.util.*" %>

<%!
public static String Uni2Ksc(String str) throws UnsupportedEncodingException {
	if(str==null) return null;
	return new String(str.getBytes("8859_1"),"KSC5601");
} 

public static String Ksc2Uni(String str) throws UnsupportedEncodingException {
	if(str==null) return null;
	return new String(str.getBytes("KSC5601"),"8859_1");
} 
%>

<%
	String mode = request.getParameter("mode");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String subject = "";
	String contents = "";
	String input_time="";
	String sql="";

	if (year==null) { year=""; }
	if (month==null) { month=""; }
	if (day==null) { day=""; }

		Connection con;
		Statement stmt=null;
		ResultSet rs=null;
	
		sql = "select * from diary where year='"+year+"' ";
		sql = sql + " and month = '" + month + "'";
		sql = sql + " and day = '" + day + "'";

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@***.***.***.***:1521:wink", "scott", "tiger");
		stmt = con.createStatement(); 
		rs = stmt.executeQuery(sql);
		rs.next();
		subject = rs.getString("subject");
		contents = rs.getString("contents");
		input_time = rs.getString("input_time");
		con.close();
	}
	catch(ClassNotFoundException e) { 
		out.println("Couldn't load database driver: " + e.getMessage());
	}
	catch(SQLException e) { 
		out.println("SQLException: " + e.getMessage());
	}

%>

<html>
<head><title>���� ��ȸ ȭ��</title></head>
<body bgcolor="#FFFFFF" text="#000000">
<br><br> 
	<form method="post" action="write.jsp">
		<table width="400">
			<tr><td align="center"><h3>���� ��ȸ ȭ��</h3></td></tr>
		</table>
		<table width="400" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
			<tr>
			<th width="22%" align="center" bgcolor="#00CCFF">��¥</th>
				<td width="78%">
					<%=year%>/<%=month%>/<%=day%>
				</td>
			</tr>
			<tr>
				<th width="22%" align="center" bgcolor="#00CCFF">����</th>
					<td width="78%">
						<%=subject%>
					</td>
			</tr>
			<tr>
			<th width="22%" align="center" bgcolor="#00CCFF">����</th>
				<td width="78%">
					<pre><%=contents%></pre>
				</td>
			</tr>
				<tr>
				<th width="22%" align="center" bgcolor="#00CCFF">�Է��Ͻ�</th>
					<td width="78%">
						<pre><%=input_time%></pre>
					</td>
				</tr>
			</table>
			<table width="600" border="0" cellspacing="0" cellpadding="3" align="center">
				<tr align="center">
					<td colspan="2">
						<a href='calendar.jsp'>Calendar List</a>
					</td>
			</tr>
		</table>
	</form>
</body>
</html> 