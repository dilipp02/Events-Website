<%-- 
    Document   : paymentReceipt
    Created on : Oct 9, 2018, 1:08:29 PM
    Author     : dilip
--%>

<%@page import="eventPack.eventList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eventPack.NewEventData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="homeStyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="paymentStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            NewEventData eventData1 = new NewEventData();
            ArrayList<NewEventData> eventList;
            eventList eventData = new eventList();
            eventList = eventData.getEventList();
            eventData1.setE_id(Integer.parseInt(request.getParameter("event")));
            session.setAttribute("event_id", request.getParameter("event"));
            for (int i = 0;i < eventList.size(); i++) {
                if(eventList.get(i).getE_id()==eventData1.getE_id()){
        %>
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
          <a href="loginSuccess.jsp">Home</a>
          <a href="news.jsp">News</a>
          <a href="gallery.jsp">Gallery</a>
        </div>
        <div class="content">
                <div class="row">
                <div class="col-75">
                  <div class="container">
                      <div class="row">
                        <div class="col-50">
                          <h2> Payment Receipt</h2>
                          <label for="cname" class="receipt"><b>Name of Event:</b></label>
                          <span><%=eventList.get(i).getName()%></span><br><br>
                          <label for="ccnum" class="receipt"><b>Venue of the Event:</b></label>
                          <span><%=eventList.get(i).getEventCollege()%></span><br><br>
                          <label for="cname" class="receipt"><b>Date of Event:</b></label>
                          <span><%=eventList.get(i).getDate()%></span><br><br>
                          <label for="ccnum" class="receipt"><b>Time of Event:</b></label>
                          <span><%=eventList.get(i).getTime()%></span><br><br>
                          <label for="ccnum" class="receipt"><b>Fees of Event:</b></label>
                          <span><%=eventList.get(i).getFee()%></span><br><br>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
                          
                          
            <div class="row">
            <div class="col-75">
              <div class="container">
                <form action="eventEnrollment">
                  <div class="row">
                    <div class="col-50">
                      <h2>Payment</h2>
                      <label for="fname">Accepted Cards</label>
                      <div class="icon-container">
                        <i class="fa fa-cc-visa" style="color:navy;"></i>
                        <i class="fa fa-cc-amex" style="color:blue;"></i>
                        <i class="fa fa-cc-mastercard" style="color:red;"></i>
                        <i class="fa fa-cc-discover" style="color:orange;"></i>
                      </div>
                    </div>
                  </div>
                  <input type="submit" value="Continue to checkout" class="btn">
                </form>
                <form action="loginSuccess.jsp">
                    <input type="submit" value="Cancel" class="btn">
                </form>
              </div>
            </div>
          </div>
        <%
                    break;
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
