<%-- 
    Document   : alerts
    Created on : Oct 10, 2018, 9:22:58 AM
    Author     : dilip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alerts Page</title>
    </head>
    <body>
        <script>
            <%
                String flag = (String)session.getAttribute("flag");
                if(flag=="enrollErrorAlert")
                {
            %>
                    alert("You have already enrolled for this event");
                    window.location = "loginSuccess.jsp";
            <%
                }
                else if(flag=="enrollSuccessAlert")
                {
            %>
                    alert("Event Enrolled SuccessFully");
                    window.location = "loginSuccess.jsp";
            <%
                }
                else if(flag=="eventUpdateErrorAlert")
                {
            %>
                    alert("<%=(StringBuffer)session.getAttribute("errors")%>");
                    window.location = "organiserEvents.jsp";
            <%
                }
                else if(flag=="eventUpdateAlert")
                {
            %>
                    alert("Event Updated Successfully");
                    window.location = "organiserEvents.jsp";
            <%
                }
                else if(flag=="eventDeleteAlert")
                {
            %>
                    alert("Event Deleted Successfully");
                    window.location = "organiserEvents.jsp";
            <%
                }
                else if(flag=="userRegisterSuccessAlert")
                {
            %>
                    alert("Participant Registered Successfully");
                    window.location = "loginSuccess.jsp";
            <%
                }
                else if(flag=="organiserRegisterSuccessAlert")
                {
            %>
                    alert("Organiser Registered Successfully");
                    window.location = "adminLogin.jsp";
            <%
                }
                else if(flag=="loginErrorAlert")
                {
            %>
                    alert("Please Register First");
                    window.location = "register.jsp";
            <%
                }
                else if(flag=="registerErrorAlert")
                {
            %>
                    alert("<%=(StringBuffer)session.getAttribute("errors")%>");
                    window.location = "register.jsp";
            <%
                }
                else if(flag=="userAlreadyRegistered")
                {
            %>
                    alert("You are Already Registered");
                    window.location = "login.jsp";
            <%
                }
                else if(flag=="eventInsertSuccess")
                {
            %>
                    alert("Event Inserted SuccessFully");
                    window.location = "adminLogin.jsp";
            <%
                }
                else if(flag=="eventInsertError")
                {
            %>
                    alert("<%=(StringBuffer)session.getAttribute("errors")%>");
                    window.location = "newEvent.jsp";
            <%
                }
            %>
        </script>
    </body>
</html>
