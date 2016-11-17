package com.example.web; 


import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Georgio
 */
@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String hidden = request.getParameter("hidden1");
        
        com.uthldap.Uthldap ldap = new com.uthldap.Uthldap(username,password);

        if(ldap.auth()){
            //out.println("<html><body>Autheticated Youre name is:" + ldap.getName() +"</body></html>");
            HttpSession session = request.getSession();
            session.setAttribute("username", ldap.getName());
            session.setAttribute("birthyear", ldap.getBirthYear());
            session.setAttribute("mail", ldap.getMail());
            RequestDispatcher view = request.getRequestDispatcher("profile.jsp");
            view.forward(request, response);
        }
        else{

           
           /**RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);**/
            PrintWriter out = response.getWriter();  
            response.setContentType("text/html");  
            out.println("<script type=\"text/javascript\">");  
            out.println("alert('deadbeef');");  
            out.println("</script>");
            
            
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        }
        
    }
}
    