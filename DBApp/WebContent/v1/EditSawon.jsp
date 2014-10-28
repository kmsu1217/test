
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	String no = request.getParameter("no");

	Connection con = null; 
 	PreparedStatement pstmt = null; 
 	ResultSet rs = null; 
 	String url = "jdbc:oracle:thin:@localhost:1521:orcl"; 
 	String id=null, name=null, age=null, pass=null, addr=null, ext=null, dept=null; 
 	 
 	try{ 
 		Class.forName("oracle.jdbc.driver.OracleDriver"); 
 		con = DriverManager.getConnection(url, "scott", "1111"); 
 		 
 		String sql = "select * from tblsawon where no=?"; 
 		pstmt = con.prepareStatement(sql); 
 		pstmt.setString(1, no); 
 		rs = pstmt.executeQuery(); 
 		 
 		if(rs.next()){ 
			id = rs.getString("id"); 
 			name = rs.getString("name"); 
 			age = new String().valueOf(rs.getInt("age")); 
 			pass = rs.getString("pass"); 
			addr = rs.getString("addr"); 
 			ext = rs.getString("ext"); 
 			dept = rs.getString("dept"); 
 		} 
 	} 
 	catch(Exception err){ 
 		System.out.println("editSawon.jsp : " + err); 
 	} 
 	finally{ 
 		if(rs!=null) try{ rs.close(); } catch(Exception err){} 
 		if(pstmt!=null) try{ pstmt.close(); } catch(Exception err){} 
 		if(con!=null) try{ con.close(); } catch(Exception err){} 
 	} 
 %> 
<h1>��� ����</h1>
	<form method="post" action="editSawon_proc.jsp">
	<input type="hidden" name="no" value="<%=no%>" /> 
	<table border="1">
		<tr>
			<td>���̵� : </td>
			<td><input type="text" name="id" value="<%=id%>" /></td>
		</tr>
		<tr>
			<td>�̸� : </td>
			<td><input type="text" name="name" value="<%=name%>" /></td>
		</tr>
		<tr>
			<td>���� : </td>
			<td><input type="text" name="age" value="<%=age%>" /></td>
		</tr>
		<tr>
			<td>�н����� : </td>
			<td><input type="text" name="pass" value="<%=pass%>" /></td>
		</tr>
		<tr>
			<td>�ٹ��� : </td>
			<td>
				<select name="addr"> 
					<option value="����" <%if(addr.equals("����")){ %> selected="true" <%}%>>����</option> 
					<option value="����" <%if(addr.equals("����")){ %> selected="true" <%}%>>����</option> 
					<option value="�λ�" <%if(addr.equals("�λ�")){ %> selected="true" <%}%>>�λ�</option> 
					<option value="���" <%if(addr.equals("���")){ %> selected="true" <%}%>>���</option> 
				</select> 
			</td> 
		</tr>
		<tr>
			<td>������ȣ : </td>
			<td><input type="text" name="ext" value="<%=ext %>" /></td>
		</tr>
		<tr>
			<td>�μ��� : </td>
			<td>
				<select name="dept"> 
	 				<option value="����" <%if(addr.equals("����")){ %> selected="true" <%}%>>����</option> 
					<option value="���" <%if(addr.equals("���")){ %> selected="true" <%}%>>���</option> 
	 				<option value="��ȹ" <%if(addr.equals("��ȹ")){ %> selected="true" <%}%>>��ȹ</option> 
				</select> 
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"> 
				<input type="submit" value="����" />&nbsp;&nbsp;&nbsp; 
				<input type="reset" value="�ٽ� �ۼ�" /> 
	 		</td> 
		</tr> 
	</table>
	</form>
</body>
</html>










