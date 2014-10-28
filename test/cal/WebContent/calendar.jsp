<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import = "java.sql.*, java.io.*, java.util.*" %>
<!----------- DataBase Connect --------------------->
<%
	Connection con;
	Statement stmt=null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger"); //DB���� ���ڿ��Դϴ�. ������ ��ġ����~ 
		stmt = con.createStatement(); 
	}
	catch(ClassNotFoundException e) { 
		out.println("Couldn't load database driver: " + e.getMessage());
	}

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String sql, url, subject="";
	int year=0, month=0, i, j, id;
	
	Calendar myCalendar = Calendar.getInstance();

	if (strYear == null) {
		year = myCalendar.get(myCalendar.YEAR);
	}
	else {
		year = Integer.parseInt(strYear);
	}
	
	if (strMonth == null) {
		month = myCalendar.get(myCalendar.MONTH);
	}
	else {
		month = Integer.parseInt(strMonth) - 1;
	}
	
	myCalendar.set(myCalendar.YEAR, year);
	myCalendar.set(myCalendar.MONTH, month);
	month = month + 1;
	%>
	
<html>
<head><title>Ķ����</title></head>
<body bgcolor="#FFFFFF" text="#000000">
<br><br>
	<form method="post" action="calendar.jsp">
		<table border="0" cellspacing="0" cellpadding="3" align="center">
		<tr align="center">
			<td><h3><%=year%>�� <%=month%>��</h3></td>
		</tr>
		</table>
		<table border="0" cellspacing="0" cellpadding="3" align="center">
			<tr align="left">
			<td>
				<input type="text" name="year" value=<%=year%> size="5">��  
				<input type="text" name="month" value=<%=month%> size="3">��  
				<input type="submit" value="�̵�">
			</td>
			</tr>
		</table>
		
		<table border="1" cellspaceing="0" cellpadding="3" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
			<tr align="center">
				<th><font color=red>�Ͽ���</font></th>
				<th>������</th>
				<th>ȭ����</th>
				<th>������</th>
				<th>�����</th>
				<th>�ݿ���</th>
				<th>�����</th>
			</tr>
			<%
			ResultSet rs=null;
			i = 0;
			while(true) {
				i++;
				myCalendar.set(myCalendar.DAY_OF_MONTH, i);
			if (i != myCalendar.get(myCalendar.DAY_OF_MONTH)) {
			break;
			}
			
			if (i == 1) {
				out.println("<tr align='right' valign='top'>");
				for(j=1; j<myCalendar.get(myCalendar.DAY_OF_WEEK); j++) {
					out.print("<td width=70 height=70> </td>");
				}
			}
				
				id =0;
				//�ش� ��¥�� ������ �˻�
				sql= "select num, subject from diary where year = '" + year + "' ";
				sql= sql + "and month = '" + month + "' and day='" + i + "'";
			
			try {
				rs = stmt.executeQuery(sql);
			}
			catch(SQLException e) {
				out.println("SQLException ::"+e);
			}
			
			if (rs.next()) {
				id = rs.getInt("num");
				subject = rs.getString("subject");
				}
				
				rs.close();
			
			if (id > 0) {
				out.println("<td width=70 height=70 bgcolor=yellow>"); 
				url = "view.jsp?year="+year+"&month="+month+"&day="+i;
			}
				else {
					out.println("<td width=70 height=70>");
					url = "write.jsp?year="+year+"&month="+month+"&day="+i;
					}
					
					out.println("<a href='"+url+"'>");
					out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
					out.println(subject);
					out.println("</a></td>");
					subject="";
				if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SATURDAY) {
					out.println("</tr>");
					out.println("<tr align='right' valign='top'>");
				}
			}
			
			if (myCalendar.get(myCalendar.DAY_OF_WEEK) != myCalendar.SATURDAY) {
				out.println("<tr>");
			}
		%>
	</table>
	<br>
	
	</form>
</html>