package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import eventPack.eventList;
import eventPack.NewEventData;
import java.util.ArrayList;

public final class enrollmentPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    ");

//        ArrayList<NewEventData> eventList;
//        eventList eventData = new eventList();
//        eventList = eventData.getEventList();
//        String status = (String)session.getAttribute("status");
//        for (int i = 0; i < eventList.size(); i++) 
//        {
            
    
      out.write("\n");
      out.write("        \n");
      out.write("    ");

//            if(status.equals("social") && eventList.get(i).getEventCategory().equals("social"))
//            {
//                out.print("<p>" + eventList.get(i).getName() + "</p>");
//                out.print("<p>" + eventList.get(i).getEventCategory()+ "</p>");
//                out.print("<p>" + eventList.get(i).getEventCollege()+ "</p>");
//                out.print("<p>" + eventList.get(i).getTime()+ "</p>");
//                out.print("<p>" + eventList.get(i).getDate()+ "</p>");
//                out.print("<p>" + eventList.get(i).getFee()+ "</p>");
//                out.print("<p>" + eventList.get(i).getDescription() + "</p>");
//            }
//            else if(status.equals("cultural") && eventList.get(i).getEventCategory().equals("cultural"))
//            {
//                out.print("<p>" + eventList.get(i).getName() + "</p>");
//                out.print("<p>" + eventList.get(i).getEventCategory()+ "</p>");
//                out.print("<p>" + eventList.get(i).getEventCollege()+ "</p>");
//                out.print("<p>" + eventList.get(i).getTime()+ "</p>");
//                out.print("<p>" + eventList.get(i).getDate()+ "</p>");
//                out.print("<p>" + eventList.get(i).getFee()+ "</p>");
//                out.print("<p>" + eventList.get(i).getDescription() + "</p>");
//            }
//            else if(status.equals("technical") && eventList.get(i).getEventCategory().equals("technical"))
//            {
//                out.print(eventList.get(i).getName() + "               ");
//                out.print(eventList.get(i).getEventCategory()+ "               ");
//                out.print(eventList.get(i).getEventCollege()+ "               ");
//                out.print(eventList.get(i).getTime()+ "               ");
//                out.print(eventList.get(i).getDate()+ "               ");
//                out.print(eventList.get(i).getFee()+ "               ");
//                out.print(eventList.get(i).getDescription()+ "               ");
//            }
//            else
//            {
//                out.print(eventList.get(i).getName() + "               ");
//                out.print(eventList.get(i).getEventCategory()+ "               ");
//                out.print(eventList.get(i).getEventCollege()+ "               ");
//                out.print(eventList.get(i).getTime()+ "               ");
//                out.print(eventList.get(i).getDate()+ "               ");
//                out.print(eventList.get(i).getFee()+ "               ");
//                out.print(eventList.get(i).getDescription()+ "               ");
//            }
//        }
    
      out.write("\n");
      out.write("        <div>\n");
      out.write("            <img src=\"photos/aarh.jpg\" style=\"float: left; height: 500px; width: 500px\" /><br>\n");
      out.write("            <img src=\"photos/dhanak.jpg\" style=\"float: left;  height: 500px; width: 500px\" /><br>\n");
      out.write("            <img src=\"photos/tarang.jpg\" style=\"float: left;  height: 500px; width: 500px\" />\n");
      out.write("        </div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
