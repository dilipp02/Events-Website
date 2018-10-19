<%-- 
    Document   : technical1
    Created on : Oct 6, 2018, 9:13:12 PM
    Author     : dilip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="homeStyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="registerStyle.css">
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
          <%
              String user = (String)session.getAttribute("user");
              String organiser = (String)session.getAttribute("organiser");
              if(!user.equals(""))
              {
          %>
                <a href="loginSuccess.jsp">Home</a>
          <%
              }
              else if(!organiser.equals(""))
              {
          %>
                <a href="adminLogin.jsp">Home</a>
          <%
              }
              else
              {
          %>
                <a href="homePage.jsp">Home</a>
          <%
              }
          %>
          <a href="news.jsp">News</a>
          <a href="gallery.jsp">Gallery</a>
        </div>
        <div class="content">
            <img src="photos/technical1.jpg" alt="technical" style="width:100%;">
            <h3 style="font-size: 20px">
                As the name suggests, a technical fest is a festival organized by engineering colleges to host events related to various technical aspects of what they learn. It is a means for students to showcase their practical talent in the field they’re learning, and not just limit themselves to bookish knowledge. Each branch – mechanical, computers, electronics, etc can have its own version of technical events/fests testing the participants on the knowledge and applications of that field.Quit racking your brains – TheCollegeFever is here with the solution. Sponsorship is the most important aspect of any fest, and if you don’t get the requisite money on time, there’s no way you can organize a successful fest. Cast away those worries by teaming up with TheCollegeFever – your one-stop shop for all things monetary. Not only does TheCollegeFever help you get sponsors in a jiffy, it also provides a single, huge platform on which to advertise your event to thousands of college-goers at once. It also manages bookings, so you can sleep in peace you will have hoards of students swarming your event!As mentioned before, each different branch of learning comes with its own set of technical skills. Though the creative possibilities are endless, some popular types of events include Hackathons, Robotics, Coding, Decoding, eco-friendly vehicles/drones/buildings models, computer simulations, Paper Presentations, Exhibitions, Drone Making, workshops
            </h3>
            <form action="eventController">
                <button type="submit" class="registerbtn" value="technical" name="technical">Show All TECHNICAL EVENTS</button>
            </form>
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
