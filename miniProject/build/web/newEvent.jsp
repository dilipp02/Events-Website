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
          <a href="adminLogin.jsp">Home</a>
          <a href="news.jsp">News</a>
          <a href="gallery.jsp">Gallery</a>
        </div>
        <div class="content">
        <form action="NewEventURL">
          <div class="container">
            <h1>Event Creation</h1>
            <p>Please fill in this form to create an Event.</p>
            <p style="color: red">All fields are mandatory</p>
            <hr>

            <label for="name"><b>Name</b></label>
            <input type="text" placeholder="Enter Name of Event" name="eventName" required>

            <label for="eventCollege"><b>Select College for the Event</b></label><br><br>
            <input type="radio" name="eventCollege" value="MIT-COE"> MIT-COE<br>
            <input type="radio" name="eventCollege" value="MIT-WPU"> MIT-WPU<br>
            <input type="radio" name="eventCollege" value="MIT"> MIT<br>
            <input type="radio" name="eventCollege" value="MIT-SOT"> MIT-SOT<br>
            <input type="radio" name="eventCollege" value="MIT-ADT"> MIT-ADT<br>
            <input type="radio" name="eventCollege" value="MIT-SOM"> MIT-SOM<br><br>

            <label for="eventCategory"><b>Select Type of the Event</b></label><br><br>
            <input type="radio" name="eventCategory" value="social"> social<br>
            <input type="radio" name="eventCategory" value="technical"> technical<br>
            <input type="radio" name="eventCategory" value="cultural"> cultural<br>
            <input type="radio" name="eventCategory" value="sports"> sports<br><br>

            <label for="date"><b>Date</b></label>
            <input type="text" placeholder="Enter a Date e.g DD/MM/YYYY" name="date" required>

            <label for="time"><b>Time</b></label>
            <input type="text" placeholder="Enter a Time e.g HH:MM AM/PM" name="time" required>

            <label for="fees"><b>Fees</b></label>
            <input type="text" placeholder="Enter Fees(not for social events)" name="fees" required>

            <label for="description"><b>Description</b></label>
            <input type="text" placeholder="Enter Description of the Event (min 50 words)" name="description" style="height: 150px" required>

            <hr>
            <button type="submit" class="registerbtn" value="event" name="event">Register the Event</button>
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
