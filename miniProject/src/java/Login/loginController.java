/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import UserPack.UserList;
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
public class loginController extends HttpServlet {

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
        
        String user = "";
        LoginData data = new LoginData();
        data.setEmail(request.getParameter("email"));
        data.setPassword(request.getParameter("psw"));
        if(request.getParameter("cancel")!=null)
        {
            RequestDispatcher rd = request.getRequestDispatcher("homePage.jsp");
            rd.forward(request, response);
        }
        
        UserList objUsers = new UserList();
        ArrayList<LoginData> users = objUsers.getUserList();
        HttpSession ses = request.getSession();
        
        for(int i=0 ; i<users.size() ; i++)
        {
            if(users.get(i).getEmail().equals(data.getEmail()) && users.get(i).getPassword().equals(data.getPassword()))
            {
                user = users.get(i).getCategory();
                if(user.equals("participant"))
                {
                    ses.setAttribute("user", users.get(i).getEmail());
                    RequestDispatcher rd = request.getRequestDispatcher("loginSuccess.jsp");
                    rd.forward(request, response);
                }
                else
                {
                    ses.setAttribute("organiser", users.get(i).getEmail());
                    RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
                    rd.forward(request, response);
                }
            }
        }
        
        ses.setAttribute("flag", "loginErrorAlert");
        RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
        rd.forward(request, response);
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
