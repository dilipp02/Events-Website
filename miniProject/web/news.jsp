<%-- 
    Document   : news
    Created on : Oct 15, 2018, 12:45:42 PM
    Author     : dilip
--%>

<%@page import="updatedEvents.updatedEventData"%>
<%@page import="updatedEvents.updatedEventList"%>
<%@page import="Login.LoginData"%>
<%@page import="UserPack.UserList"%>
<%@page import="eventPack.NewEventData"%>
<%@page import="eventPack.eventList"%>
<%@page import="eventPack.UserEventData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eventPack.userEventList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="homeStyle.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
          <a href="javascript:void(0)">News</a>
          <a href="gallery.jsp">Gallery</a>
        </div>
        <div class="content">
            <%
//                int[] a = new int[100];
//                int w,x,y,z;
//                for(int j = 0; j < a.length; j++)
//                {
//                    a[j]=0;
//                }
//                for(int i = 0; i < userEvents.size(); i++)
//                {
//                    a[userEvents.get(i).getE_id()]+=1;
//                }
//                for(int i = 0; i < a.length; i++)  
//                {
//                    int max1=0;
//                    int max2=0;
//                    int max3=0;
//                    int max4=0;
//                    for(int j = 0; j < events.size(); j++)
//                    {
//                        if(a[events.get(j).getE_id()]>=max1 && events.get(j).getEventCategory().equals("cultural"))
//                        {
//                            w=i;
//                        }
//                    }
//                }
            String user = (String)session.getAttribute("user");
            if(!user.equals(""))
            {
            %>
            <h3>Updated Information For your enrolled event(s)</h3>
            <table class="table table-dark table-hover">
                <thead>
                  <tr>
                    <th>Sr. No</th>
                    <th>Name of event</th>
                    <th>Old Date</th>
                    <th>New Date</th>
                    <th>Old Time</th>
                    <th>New Time</th>
                    <th>Venue</th>
                    <th>Fees</th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
            <%
                userEventList obju = new userEventList();
                ArrayList<UserEventData> userEvents = obju.getEventList();
                UserList objuser = new UserList();
                ArrayList<LoginData> users = objuser.getUserList();
                updatedEventList objue = new updatedEventList();
                ArrayList<updatedEventData> updatedEvents = objue.getEventList();
                for(int i = 0; i < users.size() ; i++)
                {
                    if(user.equals(users.get(i).getEmail()))
                    {
                        for(int j = 0; j < userEvents.size() ; j++)
                        {
                            if(users.get(i).getU_id()==userEvents.get(j).getU_id())
                            {
                                for(int k = 0; k < updatedEvents.size() ; k++)
                                {
                                    if(userEvents.get(j).getE_id()==updatedEvents.get(k).getE_id())
                                    {
            %>
                                        <tr>
                                            <td><%=k%></td>
                                            <td><%=updatedEvents.get(k).getName()%></td>
                                            <td><%=updatedEvents.get(k).getOlddate()%></td>
                                            <td><%=updatedEvents.get(k).getDate()%></td>
                                            <td><%=updatedEvents.get(k).getOldtime()%></td>
                                            <td><%=updatedEvents.get(k).getTime()%></td>
                                            <td><%=updatedEvents.get(k).getEventCollege()%></td>
                                            <td><%=updatedEvents.get(k).getFee()%></td>
                                            <td><%=updatedEvents.get(k).getDescription()%></td>
                                        </tr>
            <%
                                    }
                                }
                            }
                        }
                    }
                }
            %>
                </tbody>
            </table>
            <%
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
