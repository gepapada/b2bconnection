<%-- 
    Document   : doRegister
    Created on : Nov 19, 2016, 2:54:27 AM
    Author     : Georgio
--%>

<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%

    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://83.212.99.180:3306/b2b","user", "geor2466");
    PrintWriter out1 = response.getWriter();
    
    ResultSet rsdoLogin = null;
    PreparedStatement psdoLogin=null;
    
    int flag = 0;
    
    String user_name = request.getParameter("user_name");
    String password = request.getParameter("password");
    String conf_password = request.getParameter("conf_password");
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String profession = request.getParameter("profession");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String streetno = request.getParameter("streetno");
    String zipcode = request.getParameter("zipcode");
    String doy = request.getParameter("doy");
    String afm = request.getParameter("afm");
    String telephone = request.getParameter("telephone");
    String fax = request.getParameter("fax");
    String cellphone = request.getParameter("cellphone");
    String email = request.getParameter("email");
    String website = request.getParameter("website");
    String activated = "0";
   
    
    String path = request.getContextPath();
  
    String getProtocol=request.getScheme();
    String getDomain=request.getServerName();
    String getPort=Integer.toString(request.getServerPort());
  
    String getPath = getProtocol+"://"+getDomain+":"+getPort+path+"/";
    
     String activationLink = getPath+"activate.jsp?user_name="+user_name ;
    
    String error="Username_already_exists ";
    
    try{
        String sqlOption="SELECT * FROM userregister WHERE Username=? OR Afm=? OR Email=?;";
        psdoLogin=conn.prepareStatement(sqlOption);
        psdoLogin.setString(1,user_name);
        psdoLogin.setString(2,afm);
        psdoLogin.setString(3,email);
        rsdoLogin=psdoLogin.executeQuery();
         
         
        if(rsdoLogin.next()){
      
              request.getSession().setAttribute("Error","Username, Afm, or Email already exists!\nPlease try another one.");
              response.sendRedirect(request.getHeader("Referer")+"?error="+error);
              flag = 1;
        }
        else{

            conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://83.212.99.180:3306/b2b","user", "geor2466");

                error="Registered_succesfully" ;

                  String sql = "insert into userregister(Username,Password,ConfPassword,FirstName,LastName,Profession,Address,City,StreetNumber,Zipcode,Doy,Afm,Telephone,Fax,Cellphone,Email,Website,Activated) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
                  psdoLogin=conn.prepareStatement(sql);

                  psdoLogin.setString(1,user_name);
                  psdoLogin.setString(2,password);
                  psdoLogin.setString(3,conf_password);
                  psdoLogin.setString(4,first_name);
                  psdoLogin.setString(5,last_name);
                  psdoLogin.setString(6,profession);
                  psdoLogin.setString(7,address);
                  psdoLogin.setString(8,city);
                  psdoLogin.setString(9,streetno);
                  psdoLogin.setString(10,zipcode);
                  psdoLogin.setString(11,doy);
                  psdoLogin.setString(12,afm);
                  psdoLogin.setString(13,telephone);
                  psdoLogin.setString(14,fax);
                  psdoLogin.setString(15,cellphone);
                  psdoLogin.setString(16,email);
                  psdoLogin.setString(17,website);
                  psdoLogin.setString(18,activated);
                  psdoLogin.executeUpdate();

                  //response.sendRedirect("error.jsp?error="+message);
                    response.sendRedirect(request.getContextPath()+"/profile.jsp");
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