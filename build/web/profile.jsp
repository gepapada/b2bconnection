<%-- 
    Document   : profile
    Created on : Nov 16, 2016, 11:23:31 PM
    Author     : Georgio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css" type="text/css">
<!DOCTYPE html>
<html>  
    <div class="container">
<body>
    <div class="header">
    <h1 align="center">Welcome <%=session.getAttribute("username")%> </h1>
    </div>
    
    <div class="nav-bar">
			<div class="container">
				<ul class="nav">
					<li><a href="#">Nav item 1</a></li>
					<li><a href="#">Nav item 2</a></li>
					<li><a href="#">Nav item 3</a></li>
				</ul>
			</div>
		</div>
    
    <div class="content">
        
        <form method="POST"
    <center>
        <input type="SUBMIT">
    </center>
    </form>
        
        <div class="main">
  
    </div>
            <div class="aside">
                <h3>Profile details</h3>
                <form method="POST" action="logout.do">
                    Born: <%=session.getAttribute("birthyear")%><br/>
                    Mail: <%=session.getAttribute("mail")%><br/>
                    Users currently logged in: <%=session.getAttribute("totalsessions")%><br/>
                    <input type="hidden" name="hidden1" value="hidden?"/>
                    <input type="submit" value="logout" />
                </form>
                <br/>
                
            </div>
            </div>
</body>

<div class="footer">
    &copy; Copyright gepapada
</div>

</div> 
</html>
