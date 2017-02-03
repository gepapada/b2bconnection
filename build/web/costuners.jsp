<%-- 
    Document   : costuners
    Created on : Feb 2, 2017, 8:34:16 PM
    Author     : Georgio
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css">
        <title>JSP Page</title>
    </head>
    
    <div class="container"> 
    <body>

        <div class="header" style="background-color:powderblue;">
            <h3 style="text-align: center">All registers</h3>          
            <div class="nav-bar">
        	<div class="container">
			<ul class="nav">
				<li><a href="index.jsp">HOME</a></li>
			</ul>
		</div>        
            </div> 
        </div> 
        
        <div class="content">  
                
           <%

            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://83.212.99.180:3306/b2b","user", "geor2466");
            PrintWriter out1 = response.getWriter();

            ResultSet rsdoLogin = null;
            PreparedStatement psdoLogin=null;

            int flag = 0;

            String user_name = "";
            String password = "";
            String conf_password = "";
            String first_name = "";
            String last_name = "";
            String profession = "";
            String address = "";
            String city = "";
            String streetno = "";
            String zipcode = "";
            String doy = "";
            String afm = "";
            String telephone = "";
            String fax = "";
            String cellphone = "";
            String email = "";
            String website = "";
            String activated = "";


            String path = request.getContextPath();

            String getProtocol=request.getScheme();
            String getDomain=request.getServerName();
            String getPort=Integer.toString(request.getServerPort());

            String getPath = getProtocol+"://"+getDomain+":"+getPort+path+"/";

             String activationLink = getPath+"activate.jsp?user_name="+user_name ;

            String error="Username_already_exists ";

            try{
                String sqlOption="SELECT * FROM userregister;";
                psdoLogin=conn.prepareStatement(sqlOption);
                rsdoLogin=psdoLogin.executeQuery();
                
                
            while (rsdoLogin.next()) {
                first_name = rsdoLogin.getString(5);
                last_name = rsdoLogin.getString(6);
                profession = rsdoLogin.getString(7);
                city = rsdoLogin.getString(9);
                %>
                 
                <div style="text-align: center">
                    <a href="user_profil.jsp" ><img src="images/profil.png" id="profil" >
                         <%=first_name%> <%=last_name%>, <%=profession%>, <%=city%></a>
                        
                    
                </div><br>
            <%
            }

            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            /// close object and connection
            try{
                 if(psdoLogin!=null){
                     psdoLogin.close();
                 }
                 if(rsdoLogin!=null){
                     rsdoLogin.close();
                 }        
                 if(conn!=null){
                  conn.close();
                 }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }

        %>
 
        
        </div>                 
          
    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
    </body>   
    </div> 
</html>
