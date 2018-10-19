<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="homeStyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.container {
  border: 2px solid #ccc;
  background-color: #eee;
  border-radius: 5px;
  padding: 16px;
  margin: 16px 0;
  color: black;
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  margin-right: 20px;
  border-radius: 50%;
}

.container span {
  font-size: 20px;
  margin-right: 15px;
}

@media (max-width: 500px) {
  .container {
      text-align: center;
  }
  .container img {
      margin: auto;
      float: none;
      display: block;
  }
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
            <center><h2>We are the students of MITCOE-TE B IT</h2></center>
            <div class="container">
              <img src="photos/img_avatar.png" alt="Avatar" style="width:90px">
              <p><span>Suyash Lagad</span></p>
              <p>Roll No: 3164069</p>
              <a href="https://www.instagram.com/suyashlagad/?hl=en"><i class="fa fa-instagram" style="font-size:36px; color: red"></i></a>
            </div>

            <div class="container">
              <img src="photos/img_avatar.png" alt="Avatar" style="width:90px">
              <p><span>Neeraj Murge</span></p>
              <p>Roll No: 3164081</p>
              <a href="https://www.facebook.com/neeraj.murge"><i class="fa fa-facebook-square" style="font-size:36px; color: blue"></i></a>
              <a href="https://www.instagram.com/_neeraj_m_/?hl=en"><i class="fa fa-instagram" style="font-size:36px; color: red"></i></a>
            </div>

            <div class="container">
              <img src="photos/img_avatar.png" alt="Avatar" style="width:90px">
              <p><span>Kshitij Nayyar</span></p>
              <p>Roll No: 3164083</p>
              <a href="https://www.facebook.com/kshitij.nayyar"><i class="fa fa-facebook-square" style="font-size:36px; color: blue"></i></a>
              <a href="https://www.instagram.com/kshitijnayyar/?hl=en"><i class="fa fa-instagram" style="font-size:36px; color: red"></i></a>
            </div>

            <div class="container">
              <img src="photos/img_avatar.png" alt="Avatar" style="width:90px">
              <p><span>Dilip Panwar</span></p>
              <p>Roll No: 3164088</p>
              <a href="https://www.facebook.com/dilip.panwar002"><i class="fa fa-facebook-square" style="font-size:36px; color: blue"></i></a>
              <a href="https://www.instagram.com/i_m_ryuk/?hl=en"><i class="fa fa-instagram" style="font-size:36px; color: red"></i></a>
            </div>
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
