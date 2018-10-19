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

       .btn {
        background-color: #f4511e;
        border: none;
        color: white;
        padding: 10px 22px;
        text-align: center;
        font-size: 16px;
        margin: 4px 2px;
        opacity: 1;
        transition: 0.3s;
      }

      .btn:hover {opacity: 0.6} 
      
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
        OrganiserEventList obju = new OrganiserEventList();
        ArrayList<OrganiserEventData> organiserEventList = obju.getEventList();
        String user = (String)session.getAttribute("organiser");
        UserList objul = new UserList();
        ArrayList<LoginData> users = objul.getUserList();
        eventList obje = new eventList();
        ArrayList<NewEventData> events = obje.getEventList();
        for(int i=0 ;i < users.size() ;i++)
        {
            if(user.equals(users.get(i).getEmail()))
            {
    %>
                <table class="table table-hover">
                <thead>
                  <tr>
                    <th>Sr. No</th>
                    <th>Name of event</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Venue</th>
                    <th>Fees</th>
                  </tr>
                </thead>
                <%
                    for(int j = 0; j < organiserEventList.size() ; j++)
                    {
                        if(organiserEventList.get(j).getU_id()==users.get(i).getU_id())
                        {
                            for(int  k = 0; k < events.size(); k++)
                            {
                                if(events.get(k).getE_id()==organiserEventList.get(j).getE_id())
                                {
                %>
                                    <tr>
                                        <td><%=j%></td>
                                        <td><%=events.get(k).getName()%></td>
                                        <td><%=events.get(k).getDate()%></td>
                                        <td><%=events.get(k).getTime()%></td>
                                        <td><%=events.get(k).getEventCollege()%></td>
                                        <td><%=events.get(k).getFee()%></td>
                                        <td>
                                            <form action="organiserUpdateEvents.jsp">
                                                <button class="btn" name="update" value="<%=events.get(k).getE_id()%>">Update</button>
                                            </form>
                                            <form action="OrganiserEventController">
                                                <button class="btn" name="delete" value="<%=events.get(k).getE_id()%>">Delete</button>
                                            </form>
                                            <form action="OrganiserEventEnrollView.jsp">
                                                <button class="btn" name="view" value="<%=events.get(k).getE_id()%>">View Reports</button>
                                            </form>
                                        </td>
                                    </tr>
                <%
                                }
                            }
                        }
                    }
                %>
                </table>
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
