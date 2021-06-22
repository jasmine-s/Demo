
<%@ page import="java.util.*,java.sql.*" %>  

<%
//CONNECT  -> PROCESS  - > EXECUTE  - > CLOSE.
    /**
     * @param args the command line arguments
     */
    // Process //Prepare Queries //Execute
    
    
    
        // TODO code application logic here
    //REGISTER USER
    
    
            String uname, psw, utype;
            uname= request.getParameter("uname");  
            psw = request.getParameter("psw");  
            utype=request.getParameter("utype");  
            try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo1","root","root");       
                   PreparedStatement pst=null;
                     //ResultSet rs=null;
                   String query="INSERT INTO  `users`(`Uname`,`psw`,`type`)  VALUES(?,?,?);";
                        pst=con.prepareStatement(query);
                        pst.setString(1, uname);
                        pst.setString(2, psw);
                        pst.setString(3, utype);
                       int s=pst.executeUpdate();
                       if(s==1){
                      out.println("<script type=\"text/javascript\">");
                      out.println("alert('Succesfully Registered');</script>");
                       }
                       else 
                           out.println("<script type=\"text/javascript\">alert('Try again..........!User Already Exits..Try With Different USERNAME');</script>");
                   
                     
                 }    
          catch(SQLException e)
                {
                    out.println("<script type=\"text/javascript\">alert('Try again..........!User Already Exits..Try With Different USERNAME');</script>");
                }     
        
    
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
        <style>
            *{
                align-items: center;
            }
            body{
                margin: 10px 20px 10px 20px;
                background: #fff;
                color: #333;
                background-size: 50%;
            }
            form{
                margin: 10px;
                color:rgba(29,161,242,1.00);
            }
            input{
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <h1>Login Page</h1>
        <form action = "index.jsp" method = "GET">
         User Name  :  <input type = "text" name = "uname">
         <br /> 
         Psw        :   <input type = "text" name = "psw" />
         <br>
         Utype      :  <input type = "text" name = "utype" />
         <br>
         <input type = "submit" value = "Submit" />
      </form>
      
    </body>
</html>
