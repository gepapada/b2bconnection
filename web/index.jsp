<%-- 
    Document   : index
    Created on : Nov 16, 2016, 7:40:33 PM
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
    
    <body>
        <div class="conteiner">
         <header>
            <jsp:include page="header.jsp"/>
        </header>
        <div class="nav-bar">

			<ul class="nav">
				<li><a href="index.jsp">HOME</a></li>
                                <li><a href="costuners.jsp">All registers</a></li>
				<li><a href="contact.jsp">Contact us </a></li>
				<li><a href="http://83.212.99.180/">About us</a></li>
                                
			</ul>

        </div>

                                     
        <div class="content">
            
        <div class="main">
                
        </div>
        
            <div class="aside">

                    <%
                    session = request.getSession(false);
                    if(session == null || session.getAttribute("username")==null){
                    %>
                    <form name="myForm" method="POST" action="login.do">

                        Username:<input type="text" name="username" /><br/><br/>
                        Password:<input type="password" name="password" /><br/>
                        <input type="hidden" name="hidden1" value="hidden?"/><br/>
                        <input type="submit" value="login" /><br/><br/>
                        <a id="forgot" href="<%=request.getContextPath()%>/forgot_password.jsp">Ξεχάσατε τον κωδικό σας?</a><br/><br/>

                    </form>
                    <%
                    }
                    else{

                        String redirectURL = "profile.jsp";
                        response.sendRedirect(redirectURL);

                    }
                    %>
                
                <h3>Summary</h3>
                <p>Here you can develop an network <br/> with your fellow workers!</p>
                <img src="images/join.png" id="join" >
            </div>
                    
                    

        </div>
      
                 
 
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
  </div>

</body>                               
</html>
