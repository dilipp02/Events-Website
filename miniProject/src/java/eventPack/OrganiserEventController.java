/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package eventPack;

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
public class OrganiserEventController extends HttpServlet {

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
        
        String delete = request.getParameter("delete");
        String view = request.getParameter("view");
        String update = request.getParameter("update");
        HttpSession ses = request.getSession();
        
        if(update!=null)
        {
            NewEventData eventData = new NewEventData();
            eventData.setE_id(Integer.parseInt(request.getParameter("id")));
            eventData.setName(request.getParameter("name"));
            eventData.setDate(request.getParameter("date"));
            eventData.setTime(request.getParameter("time"));
            eventData.setFees(request.getParameter("fees"));
            eventData.setDescription(request.getParameter("desc"));

            StringBuffer errors = validateData(eventData);
//            out.print(errors);
            if(errors.toString().equals(""))
            {
                int fees = Integer.parseInt(eventData.getFees());
                DBController objD = new DBController();
                objD.updateEvent(eventData.getE_id(), eventData.getName(), eventData.getDate(), eventData.getTime(), fees, eventData.getDescription());
                ses.setAttribute("flag", "eventUpdateAlert");
                RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
                rd.forward(request, response);
            }
            else
            {
                ses.setAttribute("errors", errors);
                ses.setAttribute("flag", "eventUpdateErrorAlert");
                RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
                rd.forward(request, response);
            }
        }
        else if(delete!=null)
        {
            userEventList obju = new userEventList();
            ArrayList<UserEventData> userEvents = obju.getEventList();
            OrganiserEventList objo = new OrganiserEventList();
            ArrayList<OrganiserEventData> organiserEvents = objo.getEventList();
            int e_id = Integer.parseInt(request.getParameter("delete"));
            DBController objD = new DBController();
            for (int i = 0; i < userEvents.size(); i++) {
                if(userEvents.get(i).getE_id()==e_id)
                {
                    objD.deleteEventUser(e_id);
                }
            }
            for (int i = 0; i < organiserEvents.size(); i++) {
                if(organiserEvents.get(i).getE_id()==e_id)
                {
                    objD.deleteAdminEvent(e_id);
                    break;
                }
            }
            objD.deleteEvent(e_id);
            ses.setAttribute("flag", "eventDeleteAlert");
            RequestDispatcher rd = request.getRequestDispatcher("alerts.jsp");
            rd.forward(request, response);
        }
    }

    StringBuffer validateData(NewEventData data)
    {
        Validation vf = new Validation();
        StringBuffer errors = new StringBuffer("");
        if(!vf.nameValidator(data.getName()))
            errors.append("Invalid Name");
        if(!vf.dateValidator(data.getDate()))
            errors.append("Invalid Date");
        if(!vf.timeValidator(data.getTime()))
            errors.append("Invalid Time");
        if(!vf.feesValidator(data.getFees()))
            errors.append("Invalid Fees");
        if(data.getDescription().length()<100)
            errors.append("Invalid Description");
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
