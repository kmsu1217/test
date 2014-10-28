<!-- addSawon_proc.jsp 프로시져  --> 
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	String ext = request.getParameter("ext");
	String dept = request.getParameter("dept");
	
	//out.println(id + ", " + name + ", " + pw + ", " + age + ", " + addr + ", " + ", " + ext + ", " + dept);
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, "scott", "1111");
		
		String sql = "insert into tblsawon(no, id, name, pass, age, addr, dept)" + "values(seq_no.nextVal, ?, ?, ?,?,?,?,?)";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id); 
		pstmt.setString(2, name); 
		pstmt.setString(3, pass); 
		pstmt.setString(4, age); 
		pstmt.setString(5, addr); 
		pstmt.setString(6, ext); 
		pstmt.setString(7, dept); 
	 
		pstmt.executeUpdate(); 
%>	
	<h2>사원 정보가 잘 추가되었다.</h2> 
 	<a href="addSawon.html">입력 화면으로</a><br/><br/> 
 	<a href="index.jsp">메인 화면으로</a> 
 <% 
	}
	catch(Exception err){
		System.out.println("addSawon_proc.jsp : " + err);
	}
	finally{
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
	} // 예외 처리
%>