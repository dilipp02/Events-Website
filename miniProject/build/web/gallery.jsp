<!DOCTYPE html>
<html>
<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
}

.header {
    text-align: center;
    padding: 32px;
}

.row {
    display: -ms-flexbox; /* IE 10 */
    display: flex;
    -ms-flex-wrap: wrap; /* IE 10 */
    flex-wrap: wrap;
    padding: 0 4px;
}

/* Create two equal columns that sits next to each other */
.column {
    -ms-flex: 50%; /* IE 10 */
    flex: 50%;
    padding: 0 4px;
}

.column img {
    margin-top: 8px;
    vertical-align: middle;
}

/* Style the buttons */
.btn {
    border: none;
    outline: none;
    padding: 10px 16px;
    background-color: #f1f1f1;
    cursor: pointer;
    font-size: 18px;
}

.btn:hover {
    background-color: #ddd;
}

.btn.active {
    background-color: #666;
    color: white;
}
</style>
<body>

<!-- Header -->
<div class="header" id="myHeader">
  <h1>Image Grid</h1>
  <p>Click on the buttons to change the grid view.</p>
  <button class="btn active" onclick="two()">2</button>
  <button class="btn" onclick="four()">3</button>
</div>

<!-- Photo Grid -->
<div class="row"> 
  <div class="column">
    <img src="photos/1.jfif" style="width:100%">
    <img src="photos/2.jfif" style="width:100%">
    <img src="photos/3.jfif" style="width:100%">
    <img src="photos/4.jfif" style="width:100%">
    <img src="photos/5.JPG" style="width:100%">
    <img src="photos/6.jpg" style="width:100%">
    <img src="photos/7.jpg" style="width:100%">
    <img src="photos/53.jpg" style="width:100%">
  </div>
  <div class="column">
    <img src="photos/8.jpg" style="width:100%">
    <img src="photos/9.jfif" style="width:100%">
    <img src="photos/10.jpg" style="width:100%">
    <img src="photos/11.jpg" style="width:100%">
    <img src="photos/12.jpg" style="width:100%">
    <img src="photos/13.jpg" style="width:100%">
    <img src="photos/41.jpg" style="width:100%">
    <img src="photos/42.jpg" style="width:100%">
    <img src="photos/52.jpg" style="width:100%">
    <img src="photos/54.jpg" style="width:100%">
  </div>  
  <div class="column">
    <img src="photos/14.jpg" style="width:100%">
    <img src="photos/15.jpg" style="width:100%">
    <img src="photos/16.jpg" style="width:100%">
    <img src="photos/17.jpg" style="width:100%">
    <img src="photos/18.jpeg" style="width:100%">
    <img src="photos/19.jpg" style="width:100%">
    <img src="photos/20.jpg" style="width:100%">
    <img src="photos/43.jpg" style="width:100%">
    <img src="photos/44.jpg" style="width:100%">
  </div>
  <div class="column">
    <img src="photos/21.jpg" style="width:100%">
    <img src="photos/22.jpg" style="width:100%">
    <img src="photos/23.jpg" style="width:100%">
    <img src="photos/24.jpg" style="width:100%">
    <img src="photos/25.jpg" style="width:100%">
    <img src="photos/26.jpg" style="width:100%">
    <img src="photos/45.jpg" style="width:100%">
    <img src="photos/46.jpg" style="width:100%">
    <img src="photos/51.jpg" style="width:100%">
  </div>
  <div class="column">
    <img src="photos/27.jpg" style="width:100%">
    <img src="photos/28.jpg" style="width:100%">
    <img src="photos/29.jpeg" style="width:100%">
    <img src="photos/30.jfif" style="width:100%">
    <img src="photos/31.jpg" style="width:100%">
    <img src="photos/32.jpg" style="width:100%">
    <img src="photos/33.jpg" style="width:100%">
    <img src="photos/47.jpg" style="width:100%">
    <img src="photos/48.jpg" style="width:100%">
  </div>
  <div class="column">
    <img src="photos/34.jpg" style="width:100%">
    <img src="photos/35.jpg" style="width:100%">
    <img src="photos/36.jpg" style="width:100%">
    <img src="photos/37.jpg" style="width:100%">
    <img src="photos/38.jpeg" style="width:100%">
    <img src="photos/39.jpg" style="width:100%">
    <img src="photos/40.jpg" style="width:100%">
    <img src="photos/49.jpg" style="width:100%">
    <img src="photos/50.jpg" style="width:100%">
    <img src="photos/55.jpg" style="width:100%">
  </div>
</div>

<script>
// Get the elements with class="column"
var elements = document.getElementsByClassName("column");

// Declare a loop variable
var i;

// Full-width images
function one() {
    for (i = 0; i < elements.length; i++) {
        elements[i].style.msFlex = "100%";  // IE10
        elements[i].style.flex = "100%";
    }
}

// Two images side by side
function two() {
    for (i = 0; i < elements.length; i++) {
        elements[i].style.msFlex = "50%";  // IE10
        elements[i].style.flex = "50%";
    }
}

// Four images side by side
function four() {
    for (i = 0; i < elements.length; i++) {
        elements[i].style.msFlex = "25%";  // IE10
        elements[i].style.flex = "25%";
    }
}

// Add active class to the current button (highlight it)
var header = document.getElementById("myHeader");
var btns = header.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>

</body>
</html>
