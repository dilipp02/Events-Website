/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package eventPack;

import Login.LoginData;
import RegisterPack.RegisterData;
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
public class NewEventController extends HttpServlet {

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
        
        NewEventData eventData = new NewEventData();
        eventData.setName(request.getParameter("eventName"));
        eventData.setEventCollege(request.getParameter("eventCollege"));
        eventData.setEventCategory(request.getParameter("eventCategory"));
        eventData.setDate(request.getParameter("date"));
        eventData.setTime(request.getParameter("time"));
        eventData.setFees(request.getParameter("fees"));
        eventData.setDescription(request.getParameter("description"));
        HttpSession ses = request.getSession();
        
        StringBuffer errors = validateData(eventData);
//        out.print(errors);
        
        if(errors.toString().equals(""))
        {
            int fees = Integer.parseInt(eventData.getFees());
            if(eventData.getEventCategory().equals("social"))
                fees = 0;
            DBController objD = new DBController();
            String organiser = (String)ses.getAttribute("organiser");
            UserList obju = new UserList();
            ArrayList<LoginData> users = obju.getUserList();
            objD.insertEvent(eventData.getName(), eventData.getDescription(), eventData.getTime(), eventData.getDate(), eventData.getEventCollege(), eventData.getEventCategory(), fees);
            eventList obje = new eventList();
            ArrayList<NewEventData> events =  obje.getEventList();
            for (int j = 0; j < users.size(); j++) {
                if(organiser.equals(users.get(j).getEmail()))
                {
                    objD.insertOrganiserEvent(users.get(j).getU_id(), events.get(events.size()-1).getE_id());
                    ses.setAttribute("flag", "eventInsertSuccess");
                    RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
                    rd.forward(request, response);
                }
            }
        }
        else
        {
            ses.setAttribute("flag", "eventInsertError");
            ses.setAttribute("errors", errors);
            RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
            rd.forward(request, response);
        }
    }

    StringBuffer validateData(NewEventData data)
    {
        Validation vf = new Validation();
        StringBuffer errors = new StringBuffer("");
        if(!vf.eventNameValidator(data.getName()))
            errors.append("Invalid Name, ");
        if(!vf.dateValidator(data.getDate()))
            errors.append("Invalid Date, ");
        if(!vf.timeValidator(data.getTime()))
            errors.append("Invalid Time, ");
        if(!vf.feesValidator(data.getFees()))
            errors.append("Invalid Fees, ");
        if(data.getDescription().length()<100)
            errors.append("Invalid Description, ");
        if(data.getEventCategory()==null)
            errors.append("Invalid Type of Event, ");
        if(data.getEventCollege()==null)
            errors.append("Invalid College, ");
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
