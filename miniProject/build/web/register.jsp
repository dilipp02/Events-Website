<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="homeStyle.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
          <a href="homePage.jsp">Home</a>
          <a href="news.jsp">News</a>
          <a href="gallery.jsp">Gallery</a>
        </div>
        <div class="content">
        <form action="registerURL">
          <div class="container">
            <h1>Register</h1>
            <p>Please fill in this form to create an account.</p>
            <hr>

            <label for="name"><b>Name</b></label>
            <input type="text" placeholder="Enter Name" name="name" required>

            <label for="Surname"><b>Surname</b></label>
            <input type="text" placeholder="Enter Surname" name="surname" required>

            <label for="gender"><b>Enter your Gender</b></label><br><br>
            <input type="radio" name="gender" value="male"> Male<br>
            <input type="radio" name="gender" value="female"> Female<br>
            <input type="radio" name="gender" value="other"> Other<br><br>

            <label for="email"><b>Email</b></label>
            <input type="text" placeholder="Enter Email" name="email" required>

            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required>

            <label for="psw-repeat"><b>Repeat Password</b></label>
            <input type="password" placeholder="Repeat Password" name="psw-repeat" required>

            <label for="phnumber"><b>Phone Number</b></label>
            <input type="text" placeholder="Enter Phone Number" name="phnumber" required>

            <label for="dob"><b>Date of Birth</b></label>
            <input type="text" placeholder="Enter Date of Birth e.g. DD/MM/YYYY" name="dob" required>

            <hr>
            <button type="submit" class="registerbtn" value="participant" name="participant">Register as Participant</button>
            <button type="submit" class="registerbtn" value="organiser" name="organiser">Register as Organiser</button>
          </div>

          <div class="container signin">
              <p style="color: black">Already have an account? <a href="login.jsp">Sign in</a>.</p>
          </div>
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
