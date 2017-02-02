<%-- 
    Document   : forgot_password
    Created on : Nov 20, 2016, 9:47:30 PM
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
        
        
    <div class="header" style="background-color: lightcoral">
        <h1 align="center">FORGOT YOUR PASSWORD? </h1>
    
        
     <div class="nav-bar">

        	<div class="container">
			<ul class="nav">
				<li><a href="index.jsp">HOME</a></li>
			</ul>
		</div>
        </div>
        </div>
    <div class="content">
            

        
        <div id="forma">
            <h4>
               Σε περίπτωση που ξέχασες τον κωδικό σου, μπορείς εύκολα να τον αλλάξεις.<br><br>
               Συμπλήρωστε το e-mail που χρησιμοποίησατε για τη δημιουργία του λογαριασμού σας <br>και θα σας αποσταλούν οι σχετικές οδηγίες .
            </h4>
        <form name ="theform"  method="post" name="forgot_password" action="" >
            <div id="contents">
                
            <table width="474" border="0" cellpadding="5" cellspacing="5">
              <tr>
                <td width="131">Email</td>
                <td width="308">*&nbsp;
                <input name="email" class="required" id="email" type="email" size="30" maxlength="30" autofocus required placeholder="Παρακαλώ εισάγετε το e-mail σας"/></td>
              </tr>   
            </table>
              
          
        </div>
        
        <div id="button">
           <input name="submit" type="submit" value="Υποβολή" />&nbsp;&nbsp;
           
        </div>
        </form>
            </div>
            
        </div>
        
</body>
    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
    </div>
</html>