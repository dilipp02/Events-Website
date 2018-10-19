<%@page import="eventPack.OrganiserEventData"%>
<%@page import="eventPack.OrganiserEventList"%>
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
            background-color: lightblue;
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
          <a href="adminLogin.jsp">Home</a>
          <a href="news.jsp">News</a>
          <a href="gallery.jsp">Gallery</a>
        </div>
        <div class="content">
    <%
        String user = (String)session.getAttribute("organiser");
        UserList objul = new UserList();
        ArrayList<LoginData> users = objul.getUserList();
        for(int i=0 ;i < users.size() ;i++)
        {
            if(user.equals(users.get(i).getEmail()))
            {
    %>
            <h2 style="text-align:center">Organiser Profile Card</h2>
            <div class="card">
              <img src="photos/team.png" alt="<%=users.get(i).getName()%>" style="width:100%">
              <h1 style="color:grey"><%=users.get(i).getName()%> <%=users.get(i).getSurname()%></h1>
              <p class="title"><%=users.get(i).getEmail()%></p>
              <p style="color:grey"><%=users.get(i).getDob()%></p>
              <p style="color:grey"><%=users.get(i).getContact()%></p>
              <form action="organiserEvents.jsp">
                <button>Show My Coducted Events</button>
              </form>
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
