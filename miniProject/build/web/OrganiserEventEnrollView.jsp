<%-- 
    Document   : OrganiserEventEnrollView
    Created on : Oct 12, 2018, 1:11:42 AM
    Author     : dilip
--%>

<%@page import="Login.LoginData"%>
<%@page import="UserPack.UserList"%>
<%@page import="eventPack.UserEventData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eventPack.userEventList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="homeStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

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
        <h2>Name of the Students enrolled for the Event</h2>
        <table class="table table-hover">
            <thead>
              <tr>
                <th>Sr. No</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Contact</th>
              </tr>
            </thead>
        <%
            userEventList obju = new userEventList();
            ArrayList<UserEventData> userEvents = obju.getEventList();
            UserList objul = new UserList();
            ArrayList<LoginData> users = objul.getUserList();
            int e_id = Integer.parseInt(request.getParameter("view"));
            int k=0;
            for (int i = 0; i < userEvents.size(); i++) {
                if(userEvents.get(i).getE_id()==e_id)
                {
                    for(int j = 0; j < users.size(); j++)
                    {
                        if(userEvents.get(i).getU_id()==users.get(j).getU_id())
                        {
                            k++;
        %>
                        <tr>
                            <td><%=k%></td>
                            <td><%=users.get(j).getName()%></td>
                            <td><%=users.get(j).getSurname()%></td>
                            <td><%=users.get(j).getEmail()%></td>
                            <td><%=users.get(j).getGender()%></td>
                            <td><%=users.get(j).getContact()%></td>
                        </tr>
        <%
                        }
                    }
                }
            }
        %>
        </table>
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
