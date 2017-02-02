<%-- 
    Document   : profile
    Created on : Nov 16, 2016, 11:23:31 PM
    Author     : Georgio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css">
        <title>Profile Page</title>        
    </head>
    
<body>
    <div class="conteiner">
    <header>
            <jsp:include page="loged_header.jsp"/>      
    </header>
 
    <div class="nav-bar">
	<ul class="nav">
            <li><a href="#">My partners</a></li>
            <li><a href="#">find a partner</a></li>
            <li><a href="costuners.jsp">All registers</a></li>
            <li><a href="http://83.212.99.180/">About us</a></li>
            
	</ul>       
    </div>
    
    <div class="content">
        <div class="main"> 
            
        </div>
        <div class="aside">
                <h3>Profile details</h3>
                Born: <%=session.getAttribute("birthyear")%><br/>
                Mail: <%=session.getAttribute("mail")%><br/><br/><br/><br/>
                Users currently logged in: <%=session.getAttribute("totalsessions")%><br/>
                <form method="POST" action="logout.do">
                    <input type="hidden" name="hidden1" value="hidden?"/>
                    <input type="submit" value="logout" />                       
                </form>
                <form class="register" method="post" action="register.jsp" >
                    <input type="submit" name="Submit" value="Εγγραφείτε τώρα!">
                </form>
      
                
            </div>
                        
    </div>
                    
  <footer>
    <jsp:include page="footer.jsp"/>
</footer>
</div>
</body>
</html>
