<%-- 
    Document   : sports1
    Created on : Oct 6, 2018, 9:51:39 PM
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
            <img src="photos/sports1.jpg" alt="sports" style="width:100%;">
            <h3 style="font-size: 20px">
                A sports fest is one that that is primarily concerned with bringing out the physical side of the students who are generally into exercising only their brains during other times. It is an opportunity for sports enthusiasts to have their share of fun at college and show their skills and passion towards the sport. Most colleges encourage sports activities which are known to enhance the concentration capacities and academic performances of the students, besides serving as a healthy mid-studies break activity.Infrastructure is of paramount importance here. Many colleges, especially in crowded cities like Mumbai lack their own grounds, and hence, it is important to book rental grounds in advance. The same applies even to equipment. Thus, majority of the costs involved relate to rental fees. First aid, paramedics and doctors also have to be kept on standby in case of injuries. A college may have its own in-house referees/umpires or may call in a professional for the same.Most sporting events are common to all, such as Athletic track-n-field events, Cricket, Football, Rugby, Tug-of-War, Basketball, Volleyball, etc. A few colleges, depending on the infrastructure available, may also include sports such as swimming, polo, water polo, etc.
            </h3>
            <form action="eventController">
                <button type="submit" class="registerbtn" value="sports" name="sports">Show All SPORTS EVENTS</button>
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
