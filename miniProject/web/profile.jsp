<%@page import="eventPack.NewEventData"%>
<%@page import="eventPack.eventList"%>
<%@page import="UserPack.UserList"%>
<%@page import="Login.LoginData"%>
<%@page import="eventPack.userEventList"%>
<%@page import="eventPack.UserEventData"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="homeStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <style>
        img {
          border-radius: 50%;
          max-height: 300px;
        }
        .card {
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          max-width: 300px;
          max-height: 600px;
          margin: auto;
          text-align: center;
          font-family: arial;
        }

        .title {
          color: grey;
          font-size: 18px;
        }

        button {
          border: none;
          outline: 0;
          display: inline-block;
          padding: 8px;
          color: white;
          background-color: #000;
          text-align: center;
          cursor: pointer;
          width: 100%;
          font-size: 18px;
        }

        a {
          text-decoration: none;
          font-size: 22px;
          color: black;
        }

        button:hover, a:hover {
          opacity: 0.7;
        }

        #myDIV {
            width: 100%;
            padding: 50px 0;
            text-align: center;
            margin-top: 20px;
        }
    </style>
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
          <a href="loginSuccess.jsp">Home</a>
          <a href="news.jsp">News</a>
          <a href="gallery.jsp">Gallery</a>
        </div>
        <div class="content">
    <%
        userEventList obju = new userEventList();
        ArrayList<UserEventData> userEventList = obju.getEventList();
        String user = (String)session.getAttribute("user");
        UserList objul = new UserList();
        ArrayList<LoginData> users = objul.getUserList();
        eventList obje = new eventList();
        ArrayList<NewEventData> events = obje.getEventList();
        for(int i=0 ;i < users.size() ;i++)
        {
            if(user.equals(users.get(i).getEmail()))
            {
    %>
            <h2 style="text-align:center">User Profile Card</h2>
            <div class="card">
            <%
                if(users.get(i).getGender().equals("male"))
                {
            %>
              <img src="photos/img_avatar.png" alt="<%=users.get(i).getName()%>" style="width:100%">
            <%
                }
                else
                {
            %>
              <img src="photos/img_avatar2.png" alt="<%=users.get(i).getName()%>" style="width:100%">
            <%
                }
            %>
            <h1 style="color: black"><%=users.get(i).getName()%> <%=users.get(i).getSurname()%></h1>
              <p class="title"><%=users.get(i).getEmail()%></p>
              <p style="color: black"><%=users.get(i).getDob()%></p>
              <p style="color: black"><%=users.get(i).getContact()%></p>
              <p><button onclick="myFunction()">Hide/Show My Enrolled Events</button></p>
            </div>
            <div id="myDIV">
                <table class="table table-dark table-hover">
                <thead>
                  <tr>
                    <th>Sr. No</th>
                    <th>Name of event</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Venue</th>
                  </tr>
                </thead>
                <%
                    for(int j = 0; j < userEventList.size() ; j++)
                    {
                        if(userEventList.get(j).getU_id()==users.get(i).getU_id())
                        {
                            for(int  k = 0; k < events.size(); k++)
                            {
                                if(events.get(k).getE_id()==userEventList.get(j).getE_id())
                                {
                %>
                                    <tr>
                                        <td><%=1.%></td>
                                        <td><%=events.get(k).getName()%></td>
                                        <td><%=events.get(k).getDate()%></td>
                                        <td><%=events.get(k).getTime()%></td>
                                        <td><%=events.get(k).getEventCollege()%></td>
                                    </tr>
                <%
                                }
                            }
                        }
                    }
                %>
                </table>
            </div>
    <%
            }
        }
    %>
    </div>
    <script>
            function myFunction() {
                var x = document.getElementById("myDIV");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }

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
