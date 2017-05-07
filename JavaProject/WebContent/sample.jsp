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
        	
        	String n =  request.getParameter("name");
        	String domain =  request.getParameter("domain");
        	String gender =  request.getParameter("gender");
        	int yoe =  Integer.parseInt(request.getParameter("yoe"));
        	
        	stmt.executeUpdate("Insert into doctor(name,domain,gender,yoe) values ('" + n + "','" + domain + "','" + gender + "'," + yoe + ");");
        	
        	
        	
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