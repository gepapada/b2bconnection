<%-- 
    Document   : error
    Created on : Nov 19, 2016, 7:37:18 PM
    Author     : Georgio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
        <font color="red"><%=session.getAttribute("Error")%></font>
        
        
        <%
        
        request.getSession(false).removeAttribute("Error");
        
        %>
    </body>
</html>