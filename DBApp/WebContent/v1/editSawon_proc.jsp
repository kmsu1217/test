<%@ page contentType="text/html; charset=EUC-KR"%> 
<%@ page import="java.sql.*"%> 
 
 
 <% 
 	request.setCharacterEncoding("euc-kr"); 
 	response.setCharacterEncoding("euc-kr"); 
 	 
 	String no = request.getParameter("no"); 
 	String id = request.getParameter("id"); 
 	String name = request.getParameter("name"); 
 	String pass = request.getParameter("pass"); 
 	String age = request.getParameter("age"); 
 	String addr = request.getParameter("addr"); 
 	String ext = request.getParameter("ext"); 
 	String dept = request.getParameter("dept"); 
 	 
 	//out.println(no + ", " + id + ", " + name + ", " + pass + ", " + 
 	//	age + ", " + addr + ", " + ext + ", " + dept); 
 	 
 	Connection con = null; 
 	PreparedStatement pstmt = null; 
 	 
 	String url = "jdbc:oracle:thin:@localhost:1521:orcl"; 
 		 
 	try{ 
 		Class.forName("oracle.jdbc.driver.OracleDriver"); 
 		con = DriverManager.getConnection(url, "scott", "1111"); 
 		 
 		String sql = "update tblsawon set id=?, name=?, pass=?, age=?, addr=?, ext=?, dept=? " 
 			+ "where no=?"; 
 		 
 		pstmt = con.prepareStatement(sql); 
 		pstmt.setString(1, id); 
 		pstmt.setString(2, name); 
 		pstmt.setString(3, pass); 
 		pstmt.setString(4, age); 
 		pstmt.setString(5, addr); 
 		pstmt.setString(6, ext); 
 		pstmt.setString(7, dept); 
 		pstmt.setString(8, no); 
 		 
 		pstmt.executeUpdate(); 
 %> 
 	<script> 
 		alert("Àß ¼öÁ¤µÇ¾ú½À´Ï´Ù."); 
 		location.href="index.jsp"; 
 	</script> 
 <% 
 	} 
 	catch(Exception err){ 
 		System.out.println("editSawon_proc.jsp : " + err); 
 	} 
 	finally{ 
 		if(pstmt!=null) try{ pstmt.close(); } catch(Exception err){} 
 		if(con!=null) try{ con.close(); } catch(Exception err){} 
 	} 
 %> 
