<%@ page contentType="text/html; charset=EUC-KR"%> 
 <%@ page import="java.sql.*"%> 
 
 
 <% 
 	String no = request.getParameter("no"); 
 	 
 	Connection con = null; 
 	PreparedStatement pstmt = null; 
 	 
 	String url = "jdbc:oracle:thin:@localhost:1521:orcl"; 
 		 
 	try{ 
 		Class.forName("oracle.jdbc.driver.OracleDriver"); 
 		con = DriverManager.getConnection(url, "scott", "1111"); 
 		 
 		String sql = "delete from tblsawon where no=?"; 
 		 
 		pstmt = con.prepareStatement(sql); 
 		pstmt.setString(1, no); 
 		 
 		pstmt.executeUpdate(); 
 %> 
 	<script> 
 		alert("Àß »èÁ¦µÇ¾ú½À´Ï´Ù."); 
 		location.href="index.jsp"; 
 	</script> 
 <% 
 	} 
 	catch(Exception err){ 
 		System.out.println("deleteSawon_proc.jsp : " + err); 
 	} 
 	finally{ 
 		if(pstmt!=null) try{ pstmt.close(); } catch(Exception err){} 
 		if(con!=null) try{ con.close(); } catch(Exception err){} 
 	} 
 %> 
