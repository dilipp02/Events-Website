/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package RegisterPack;

import Login.LoginData;
import UserPack.UserList;
import ValidationPack.Validation;
import db.DBController;
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
public class registerController extends HttpServlet {

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
        
        RegisterData data = new RegisterData();
        data.setName(request.getParameter("name"));
        data.setSurname(request.getParameter("surname"));
        data.setGender(request.getParameter("gender"));
        data.setPassword(request.getParameter("psw"));
        data.setConPassword(request.getParameter("psw-repeat"));
        data.setMail(request.getParameter("email"));
        data.setContact(request.getParameter("phnumber"));
        data.setDOB(request.getParameter("dob"));
        
        String participant = request.getParameter("participant");
        String organiser = request.getParameter("organiser");
        
        StringBuffer errors = validateData(data);
        HttpSession ses = request.getSession();
//        out.print(errors);
        if(errors.toString().equals(""))
        {
            DBController objD = new DBController();
            UserList obju = new UserList();
            ArrayList<LoginData> users = obju.getUserList();
            for (int i = 0; i < users.size(); i++) {
                out.print(users.get(i).getEmail());
                if(users.get(i).getEmail().equals(data.getMail()))
                {
                    out.print("hello");
                    out.print(data.getMail());
                    ses.setAttribute("flag", "userAlreadyRegistered");
                    RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
                    rd.forward(request, response);
                }
            }
            if(participant!=null)
            {
                ses.setAttribute("user", data.getMail());
                data.setUser(participant);
                objD.insertUser(data.getName(), data.getSurname(), data.getGender(), data.getMail(), data.getPassword(), data.getContact(), data.getDOB(), data.getUser());
                ses.setAttribute("flag", "userRegisterSuccessAlert");
                RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
                rd.forward(request, response);
            }
            else
            {
                ses.setAttribute("organiser", data.getMail());
                data.setUser(organiser);
                objD.insertUser(data.getName(), data.getSurname(), data.getGender(), data.getMail(), data.getPassword(), data.getContact(), data.getDOB(), data.getUser());
                ses.setAttribute("flag", "organiserRegisterSuccessAlert");
                RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
                rd.forward(request, response);
            }
            
        }
        else
        {
            ses.setAttribute("flag", "registerErrorAlert");
            ses.setAttribute("errors", errors);
            RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
            rd.forward(request, response);
        }
    }

    StringBuffer validateData(RegisterData data)
    {
        Validation vf = new Validation();
        StringBuffer errors = new StringBuffer("");
        if(!vf.nameValidator(data.getName()))
            errors.append("Invalid Name");
        if(!vf.nameValidator(data.getSurname()))
            errors.append("Invalid SurName");
        if(vf.password1Validator(data.getPassword()))
        {
            if(!data.getConPassword().equals(data.getPassword()))
                errors.append("Invalid Confirmed Password ");
        }
        else
        {
            errors.append("Invalid Password ");
            errors.append("Invalid Confirmed Password ");
        }
        if(!vf.mailValidator(data.getMail()))
            errors.append("Invalid Email ");
        if(!vf.contactValidator(data.getContact()))
            errors.append("Invalid Contact Number ");
        if(!vf.dateValidator(data.getDOB()))
            errors.append("Invalid Date of Birth");
        if(data.getGender()==null)
            errors.append("Invalid gender");
        return errors;
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
