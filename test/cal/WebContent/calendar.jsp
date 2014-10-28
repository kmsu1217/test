<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import = "java.sql.*, java.io.*, java.util.*" %>
<!----------- DataBase Connect --------------------->
<%
	Connection con;
	Statement stmt=null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger"); //DB접속 문자열입니다. 적절히 고치세요~ 
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
<head><title>캘린더</title></head>
<body bgcolor="#FFFFFF" text="#000000">
<br><br>
	<form method="post" action="calendar.jsp">
		<table border="0" cellspacing="0" cellpadding="3" align="center">
		<tr align="center">
			<td><h3><%=year%>년 <%=month%>월</h3></td>
		</tr>
		</table>
		<table border="0" cellspacing="0" cellpadding="3" align="center">
			<tr align="left">
			<td>
				<input type="text" name="year" value=<%=year%> size="5">년  
				<input type="text" name="month" value=<%=month%> size="3">월  
				<input type="submit" value="이동">
			</td>
			</tr>
		</table>
		
		<table border="1" cellspaceing="0" cellpadding="3" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
			<tr align="center">
				<th><font color=red>일요일</font></th>
				<th>월요일</th>
				<th>화요일</th>
				<th>수요일</th>
				<th>목요일</th>
				<th>금요일</th>
				<th>토요일</th>
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
				//해당 날짜의 일정을 검사
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