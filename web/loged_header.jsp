<%-- 
    Document   : loged_header
    Created on : Feb 1, 2017, 9:31:02 PM
    Author     : Georgio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="header.css">
<div id="header">
    <h1 id="text1">Welcome <%=session.getAttribute("username")%> </h1> to b2b connection application!</h1>
</div>