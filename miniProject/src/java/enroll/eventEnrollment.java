/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package enroll;

import Login.LoginData;
import UserPack.UserList;
import db.DBController;
import eventPack.UserEventData;
import eventPack.userEventList;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dilip
 */
public class eventEnrollment extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession ses = request.getSession();
        int e_id = Integer.parseInt((String)(ses.getAttribute("event_id")));
        String user = (String)ses.getAttribute("user");
        UserList objUsers = new UserList();
        ArrayList<LoginData> users = objUsers.getUserList();
        userEventList objue = new userEventList();
        ArrayList<UserEventData> userEvents = objue.getEventList();
        int data = 10;
        for (int i = 0; i < users.size(); i++) {
            if(user.equals(users.get(i).getEmail()))
            {
                for (int j = 0; j < userEvents.size(); j++) {
                    if(userEvents.get(j).getE_id()==e_id && users.get(i).getU_id()==userEvents.get(j).getU_id())
                    {
                        ses.setAttribute("flag", "enrollErrorAlert");
                        RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
                        rd.forward(request, response);
                    }
                }
                DBController objdb = new DBController();
                objdb.enrollEvent(users.get(i).getU_id(), e_id);
                ses.setAttribute("flag", "enrollSuccessAlert");
                RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
                rd.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
