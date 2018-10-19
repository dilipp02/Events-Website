<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="loginStyle.css">
    </head>
<body>
    <div class="bg-img">
      <form action="loginURL" class="container">
        <h1>Login</h1>
        <label for="email"><b>Email</b></label>
        <input type="text" placeholder="Enter Email" name="email" required>

        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" required>

        <button type="submit" class="btn">Login</button><br><br>
        <div class="popup" onclick="myFunction()">
            Are you Registered
            <div class="popclick"><i class="fa fa-exclamation-circle" style="font-size:24px"></i></div>
            <span class="popuptext" id="myPopup">Register clicking below!!!</span>
        </div><br>
        <p>Have not registered yet? <a href="register.jsp">Sign Up</a>.</p>
     </form>
    </div>
    
    <script>
    // When the user clicks on div, open the popup
    function myFunction() {
        var popup = document.getElementById("myPopup");
        popup.classList.toggle("show");
    }
    </script>

</body>
</html>
