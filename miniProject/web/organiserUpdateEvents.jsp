<%-- 
    Document   : organiserUpdateEvents
    Created on : Oct 10, 2018, 9:49:30 AM
    Author     : dilip
--%>

<%@page import="eventPack.NewEventData"%>
<%@page import="eventPack.eventList"%>
<%@page import="Login.LoginData"%>
<%@page import="UserPack.UserList"%>
<%@page import="eventPack.OrganiserEventData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eventPack.OrganiserEventList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="homeStyle.css">
        <link rel="stylesheet" type="text/css" href="paymentStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header">
            <h1>EventMania.com</h1>
        </div>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="aboutUs.jsp">About Us</a>
            <a href="contactUs.jsp">Contact</a>
        </div>
        <div id="navbar">
          <a class="active" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</a>
          <a href="adminLogin.jsp">Home</a>
          <a href="news.jsp">News</a>
          <a href="gallery.jsp">Gallery</a>
        </div>
        <div class="content">
    <%
        String update = request.getParameter("update");
        int update1 = Integer.parseInt(update);
        eventList obje = new eventList();
        ArrayList<NewEventData> events = obje.getEventList();
        for(int  k = 0; k < events.size(); k++)
        {
            if(events.get(k).getE_id()==update1)
            {
    %>
            <div class="row">
            <div class="col-75">
              <div class="container">
                <form action="OrganiserEventController">
                  <div class="row">
                    <div class="col-50">
                      <h2>Payment</h2>
                      <label for="cname">Id of the Event</label>
                      <input type="text" name="id" value="<%=events.get(k).getE_id()%>" style="color: grey" readonly>
                      <label for="ccnum">Name of the Event</label>
                      <input type="text" name="name" value="<%=events.get(k).getName()%>">
                      <label for="cname">Venue</label>
                      <input type="text" name="college" value="<%=events.get(k).getEventCollege()%>" style="color: grey" readonly>
                      <label for="ccnum">Date</label>
                      <input type="text" name="date" value="<%=events.get(k).getDate()%>">
                      <label for="cname">Time</label>
                      <input type="text" name="time" value="<%=events.get(k).getTime()%>">
                      <label for="cname">Fees per Entry</label>
                      <input type="text" name="fees" value="<%=events.get(k).getFee()%>">
                      <label for="ccnum">Description</label>
                      <input type="text" name="desc" value="<%=events.get(k).getDescription()%>" style="height: 100px">    
                    </div>
                  </div>
                    <input type="submit" name="update" value="Update" class="btn">
                </form>
                <form action="adminLogin.jsp">
                    <input type="submit" value="Cancel" class="btn">
                </form>
              </div>
            </div>
          </div>
<%
            }
        }
%>
    </div>
        <script>
            window.onscroll = function() {myFunction()};

            var navbar = document.getElementById("navbar");
            var sticky = navbar.offsetTop;

            function myFunction() {
              if (window.pageYOffset >= sticky) {
                navbar.classList.add("sticky")
              } else {
                navbar.classList.remove("sticky");
              }
            }

            function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
            document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft= "0";
                document.body.style.backgroundColor = "white";
            }
        </script>
    </body>
</html>
