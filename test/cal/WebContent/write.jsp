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
	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	String sql="", created="";
	int id=0;
	
	if (year==null) { year=""; }
	if (month==null) { month=""; }
	if (day==null) { day=""; }
	
	if (request.getParameter("submit") != null) {
		id = Integer.parseInt(request.getParameter("id"));
	
	Connection con;
	Statement stmt=null;
	ResultSet rs=null;
	
	sql = "insert into diary (num, year, month, day, subject, contents) values (seq_diary_id.nextval,";
	sql = sql + "'" + year + "','" + month + "','" + day + "','" + Uni2Ksc(subject) + "','" + Uni2Ksc(contents) + "')";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@***.***.***.***:1521:wink", "scott", "tiger");
	stmt = con.createStatement(); 
	
	stmt.executeUpdate(sql);
}
	catch(ClassNotFoundException e) { 
		out.println("Couldn't load database driver: " + e.getMessage());
	}
	catch(SQLException e) { 
		out.println("SQLException: " + e.getMessage());
	}
}
%>

<html>
<head><title>diary 입력화면</title></head>
<body bgcolor="#FFFFFF" text="#000000">
<br><br> 
	<form method="post" action="write.jsp">
		<table width="600">
			<tr><td align="center"><h3>Diary 입력화면</h3></td></tr>
		</table>
		<table width="600" border="1" cellspacing="0" cellpadding="3" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
			
			<tr>
			<th width="22%" align="center" bgcolor="#00CCFF">날짜</th>
			<td width="78%">
				<input type="text" name="year" value="<%=year%>" size="4">년
				<input type="text" name="month" value="<%=month%>" size="2">월
				<input type="text" name="day" value="<%=day%>" size="2">일
			</td>
			</tr>
			<tr>
			<th width="22%" align="center" bgcolor="#00CCFF">제목</th>
				<td width="78%">
					<input type="text" name="subject" value="" size="50" maxlength="100">
				</td>
			</tr>
			<tr>
			<th width="22%" align="center" bgcolor="#00CCFF">내용</th>
				<td width="78%">
					<textarea name="contents" cols="60" rows="10"></textarea>
				</td>
			</tr>
		</table>
		<table width="600" border="0" cellspacing="0" cellpadding="3" align="center">
		<tr align="center">
			<td colspan="2">
				<input type="hidden" name="mode" value="<%=mode%>">
				<input type="hidden" name="id" value="<%=id%>">
				<input type="submit" name="submit" value="전송">
				<input type="reset" value="다시쓰기">
				<input type="button" value="캘린더보기" onClick="location='calendar.jsp'">
			</td>
		</tr>
		</table>
	</form>
</body>
</html> 