<%-- 
    Document   : social1
    Created on : Oct 6, 2018, 9:49:21 PM
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
            <img src="photos/social1.jpg" alt="social" style="width:100%;">
            <h3 style="font-size: 20px">
                A social event involving a public performance or entertainment. affair, function, occasion, social function, social occasion. a vaguely specified social event. competition, contest. an occasion on which a winner is selected from among two or more contestants.A cultural fest is a fest that showcases the culture adopted by the college organizing it. Every year, a college adopts a particular theme and organizes various events related to it. The college premises are also usually decorated accordingly, thus giving it all a “cultural” look. A cultural fest is the flagship event of the college and is open to students from all colleges irrespective of their fields/specializations, thus providing a great opportunity to mingle and network with others from various walks of life.Due to the huge scale on which a cultural fest operates, it is much more tedious to organize and implement successfully. Preparations for the next year’s fest begin almost soon as the current year’s fest ends. The hierarchal positions are filled and each department goes into brainstorming for its events. Sponsors are of utmost importance since the money of the fest almost entirely is raised by them. Advertising campaigns are also held as the fest date nears so as to ensure maximum turnout for all events.A cultural fest provides the broadest scope to organize a myriad of types of events. Some of them include Performing Arts like Group/Solo Singing, Dancing, Dramatics, Beatboxing, etc.; Literary Events like Word Games, Poetry, Creative Writing, etc.; Artistic events like pottery, painting, t-shirt painting, etc.; Gaming Events like football, tennis, tug-of-war, FIFA, foosball, etc.; Pro-Shows like DJ Nights, Fashion Shows, etc.; and many more. The scope for creativity in organizing events is virtually limitless.
            </h3>
            <form action="eventController">
                <button type="submit" class="registerbtn" value="social" name="social">Show All SOCIAL EVENTS</button>
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
