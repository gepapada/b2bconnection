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
    <div class="container">
    <body>
        <div class="header">
        <h1 id="h1-header">Welcome to b2b connection application!</h1>
        </div>
        
        <div class="nav-bar">

        	<div class="container">
			<ul class="nav">
				<li><a href="index.jsp">HOME</a></li>
				<li><a href="#">Nav item 2</a></li>
				<li><a href="#">Nav item 3</a></li>
			</ul>
		</div>
        </div>

                                     
        <div class="content">
            
        <div class="main">
        <%
	session = request.getSession(false);
        if(session == null || session.getAttribute("username")==null){
	%>
        <form name="myForm" method="POST" action="login.do">
            
            Username:<input type="text" name="username" /><br/>
            Password:<input type="password" name="password" /><br/>
            <input type="hidden" name="hidden1" value="hidden?"/>
            <input type="submit" value="login" />
            <a id="forgot" href="<%=request.getContextPath()%>/forgot_password.jsp">Ξεχάσατε τον κωδικό σας?</a>

        </form>
	<%
	}
	else{
            
            String redirectURL = "profile.jsp";
            response.sendRedirect(redirectURL);

        }
        %>
        </div>
            <div class="aside">
                <h3>Summary</h3>
                <p>Here you can develop an network <br/> with your fellow workers!</p>
            </div>
        
        </div>
        
</body>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</div> 
</html>
