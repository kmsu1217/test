<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<script>
	function fnDeleteChk(){
		var result = confirm("���� �����Ͻðڽ��ϱ�?");
		
		if(result == true){
			location.href= "deleteSawon.jsp?no=" + no;	
		}
		
	}</script>
</head>
<body>
<h1>���� ���� ����Ʈ</h1>
<a href="addsawon.html">���� �߰�</a>
<br/><br/>
	<form method="post" action="index.jsp">
		<select name="search">
			<option value="id">���̵�</option>
			<option value="addr">�̸�</option>
			<option value="dept">�μ�</option>
			<option value="addr">�ٹ���</option>
		</select>
		<input type="text" name="searchText" />
		<input type="submit" value="�˻�" />
	</form>
	<table border="1">
		<tr>
			<th>���</th><th>ID</th><th>�̸�</th>
			<th>�н�����</th><th>����</th><th>�ٹ���</th>
			<th>�μ���</th><th>������ȣ</th>
			<th>����</th><th>����</th>
		</tr>
		<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "scott";
			String pw = "1111";
			
			request.setCharacterEncoding("euc-kr");
			String search = request.getParameter("search");
			String searchText = request.getParameter("searchText");
			String sql ="";
			//�μ� �˻� �� ȭ���� �ٲ�µ� ������ ���� �״�� �����ְ�
			
			try{
				if(searchText.isEmpty()){
					sql = "select * from tblsawon";
				}
				else{
					sql = "select * from tblsawon where " + search + " like '%" + searchText + "%'";
				}
			}
			catch(NullPointerException err){
				sql = "select * from tblsawon";
			}
			
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection(url, id, pw);
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
		%>
			<tr>
				<td><%=rs.getInt("no") %></td>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("pass") %></td>
				<td><%=rs.getInt("age") %></td>
				<td><%=rs.getString("addr") %></td>
				<td><%=rs.getString("dept") %></td>
				<td><%=rs.getInt("ext") %></td>
				<td><a href="editSawon.html?no=<%=rs.getInt("no") %>">����</a></td>
				<td><a href="javascript:fnDeleteChk('<%=rs.getInt("no") %>')">����</a></td>
			</tr>
		<%
				}
			}
			catch(Exception err){
				System.out.println("index.jsp :" + err);
			}
			finally{
				if(rs!=null)
				try{
					rs.close();
				}
				catch(Exception err){}
				if(pstmt!=null)
					try{
						pstmt.close();
					}
					catch(Exception err){}
				if(con!=null)
					try{
						con.close();
					}
					catch(Exception err){}
			} // ���� ó��
		%>
	</table>
</body>
</html>











