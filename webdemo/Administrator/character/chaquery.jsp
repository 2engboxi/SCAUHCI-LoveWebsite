<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.scau.zengboxi.Characters"%>
<%@page import="java.util.*"%>
<%!
	public static final String DBDRIVER="com.mysql.jdbc.Driver";
	public static final String DBURL="jdbc:mysql://localhost:3306/mldn";
	public static final String DBUSER="root";
	public static final String DBPASS="root";
%>
<%	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
%>
<%
	try{
		Class.forName(DBDRIVER);
		conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
		String sql="select * from characte";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		List<Characters> list=new ArrayList<Characters>();
	while(rs.next()){
		Characters person =new Characters();
		person.setCharacId(rs.getInt("characId"));
		person.setCharacName(rs.getString("characName"));
		person.setStory(rs.getString("story"));
		person.setPhotoUrl(rs.getString("photoUrl"));
		list.add(person);
		}
		request.setAttribute("person",list);
	}
	catch(Exception e){
		out.println(e);
	}
	finally{
		rs.close();
		pstmt.close();
		conn.close();
	}
%>
	<jsp:forward page="showCharac.jsp"/>