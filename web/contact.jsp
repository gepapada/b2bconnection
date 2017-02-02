<%-- 
    Document   : contact
    Created on : Feb 1, 2017, 11:26:54 PM
    Author     : Georgio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css">
        <title>JSP Page</title>
    </head>
        <div class="container">
 
    <body>
        
	<div id="forma">
            <div class="header" style="background-color:powderblue;">
                <h3>Φόρμα εγγραφής</h3>
           
            
            <div class="nav-bar">

        	<div class="container">
			<ul class="nav">
				<li><a href="index.jsp">HOME</a></li>
			</ul>
		</div>        
        </div> 
                 </div> 
        <div class="content">  
                

        <form action="mailto:gepapada@uth.gr" method="post" enctype="text/plain">
        Name:<br>
        <input type="text" name="name"><br>
        E-mail:<br>
        <input type="text" name="mail"><br>
        Comment:<br>
        <input type="text" name="comment" size="50"><br><br>
        <input type="submit" value="Send">
        <input type="reset" value="Reset">
        </form>    
        
          </div>           
        </div>       
          
    </body>

    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
    
    </div> 
</html>
