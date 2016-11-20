/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author Georgio
 */
@WebListener()
public class SessionListener implements HttpSessionListener {
    private static int sessionCount=0;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        synchronized (this) {
            sessionCount++;
            System.out.println("Session Created: " + se.getSession().getId());
            
            System.out.println("Total Sessions: " + sessionCount);
            se.getSession().setAttribute("totalsessions", sessionCount);
        }
       
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        synchronized (this) {
            sessionCount--;
            
            se.getSession().setAttribute("totalsessions", sessionCount);
            System.out.println("Session Destroyed: " + se.getSession().getId());
            System.out.println("Total Sessions: " + sessionCount);
        }
     
    }
}
