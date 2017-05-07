<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    Connection conn = null;
	try {
        Statement stmt=null;
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Connection Established");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/medex", "root", "root");
        System.out.println("Connection Established");  
        if(conn!=null){
        	stmt = conn.createStatement();
        	
        	String domain =  request.getParameter("domain");
        
        	int yoe =  Integer.parseInt(request.getParameter("yoe"));
        	
        	ResultSet rs = stmt.executeQuery("Select * from doctor where yoe>='" + yoe + "' and domain='" + domain + "';");
        	while(rs.next()){
        		String n1 = rs.getString("name");
        		String d1 = rs.getString("domain");
        		String g1 = rs.getString("gender");
        		String y1 = rs.getString("yoe");
        		
        		
        		out.println(n1);
        		out.println(d1);
        		out.println(g1);
        		out.println(y1);
        	}
        	
        	
        	        }
	}catch(Exception e){
		e.printStackTrace();
	}
	finally{
		 try{
			 if(conn!=null)
			conn.close();
		}
		catch(Exception e){
			
		}
	}

    
    
    %>
</body>
</html>