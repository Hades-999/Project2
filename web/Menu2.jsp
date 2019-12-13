<%-- 
    Document   : Menu2
    Created on : Nov 14, 2019, 10:43:38 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="index2_files/w3.css">
<title>Food Order Service</title>
<style>
body {font-family: "Times New Roman", Georgia, Serif;}
h1, h2, h3, h4, h5, h6 {
  font-family: "Playfair Display";
  letter-spacing: 5px;
}

.btn{
	color:white;
	background-color:dodgerblue;
	border:none;
	padding:12px 24px;
	display: block;
	width:100px;
}

.btn:hover{
	box-shadow:0px 10px 10px black;
	transform: translate(0px,-5px);
}

.rest:hover{
  box-shadow: 0px 10px 10px black;
  transform: translate(0px,-5px);
}

.add-input {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

.btn2 {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

.btn2:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.addcontainer {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
<script>
  // Get the modal
  var modal = document.getElementById('id01');
  
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
      if (event.target == modal) {
          modal.style.display = "none";
      }
  }
    function myValidation(){
      var contact=document.forms["orders"]["contact"];
      var add=document.forms["orders"]["add"];
      if(contact===""&&add===""){
          alert("Please fill in the empty fields");
      }
      else if(contact===""){
          alert("Please enter your contact no.");
      }
      else if(add===""){
          alert("Please enter your address");
      }
      else{
          return true;
      }
      return false;
  }
  </script>
</head><body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
    <a href="#home" class="w3-bar-item w3-button">Food Order Service</a>
    <!-- Right-sided navbar links. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="#about" class="w3-bar-item w3-button">Popular</a>
      <a href="#menu" class="w3-bar-item w3-button">Menu</a>
      <a href="#contact" class="w3-bar-item w3-button">Contact</a>
    </div>
  </div>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="home">
  <img class="w3-image" src="index2_files/hamburger.jpg" alt="Hamburger Catering" width="1600" height="800">
  <div class="w3-display-bottomleft w3-padding-large w3-opacity">
    <h1 class="w3-xxlarge">Welcome!</h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content" style="max-width:1200px;margin-top:100px">
  <div class="w3-row w3-padding-64" id="about">
      <table class="w3-table w3-striped">
        <tr>
            <td>S No.</td>
            <td>ITEM</td>
            <td>PRICE</td>
            <td>BUY</td>
        </tr>
        <%
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/hades";
            String username="root";
            String password="";
            String query="select * from menu2";
            Connection conn=DriverManager.getConnection(url,username,password);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {
                String sno=rs.getString("sno");
                String item=rs.getString("item");
                String price=rs.getString("price");
        %>
        <tr>
                <td><%out.print(sno); %></td>
                <td><%out.print(item); %></td>
                <td><%out.print(price); %></td>
                <td><button class="btn" onclick="document.getElementById('id01').style.display='block'">Order</button></td>
        </tr>
        <%
            }
        %>
      </table>
        <%
            rs.close();
            stmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        %>
  </div>
  <div class="w3-center w3-padding-32">
  </div>
  
  <hr>
  <div id="id01" class="modal">
  
    <form class="modal-content animate" action="OrderServlet" method="post" name="orders" method="post" onsubmit="return myValidation()">
  
      <div class="addcontainer">
        <label ><b>Contact No.</b></label>
        <input type="text" placeholder="Enter Contact No." name="contact" class="add-input">
  
        <label ><b>Address</b></label>
        <input type="text" placeholder="Enter Address" name="add" class="add-input">
          
        <button type="submit" class="btn2">SEND</button>
        <label>
          <input type="checkbox" checked="checked" name="remember"> Remember me
        </label>
      </div>
  
      <div class="addcontainer" style="background-color:#f1f1f1">
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
        <span class="psw">Forgot <a href="#">password?</a></span>
      </div>
    </form>
  </div>
  
  <!-- Menu Section -->
  <div class="w3-row w3-padding-64" id="menu">
    <div class="w3-col l6 w3-padding-large">
      <h1 class="w3-center">Popular Dishes</h1><br>
      <h4>Capsicum Pizza</h4>
      <p class="w3-text-grey">From Pizza Hut<br><button class="btn" onclick="document.getElementById('id01').style.display='block'">Order</button></p><br>
    
      <h4>Chow mein</h4>
      <p class="w3-text-grey">From Ching's<br><button class="btn" onclick="document.getElementById('id01').style.display='block'">Order</button></p><br>
    
      <h4>Veg. Thali</h4>
      <p class="w3-text-grey">From LTD Dhaba<br><button class="btn" onclick="document.getElementById('id01').style.display='block'">Order</button></p><br>
    
      <h4>Chilly Cheese</h4>
      <p class="w3-text-grey">From Krishna's<button class="btn" onclick="document.getElementById('id01').style.display='block'">Order</button></p><br>
    
      <h4>Blueberry Pancakes</h4>
      <p class="w3-text-grey">From Rana Bakery<button class="btn" onclick="document.getElementById('id01').style.display='block'">Order</button></p>    
    </div>
    
    <div class="w3-col l6 w3-padding-large">
      <img src="index2_files/tablesetting.jpg" class="w3-round w3-image w3-opacity-min" alt="Menu" style="width:100%">
    </div>
  </div>

  <hr>

  <!-- Contact Section -->
  <div class="w3-container w3-padding-64" id="contact">
    <h1>Contact</h1><br>
    <p>We offer 24 hour delivery service large or small. If you face any problem or have any queries do not hesitate to contact us. Do not hesitate to contact 
    us at.</p>
    <p class="w3-text-blue-grey w3-large"><b>customersupport@fooddelivery.com</b></p>
    <p>You can also contact us by phone 00553123-2323 or you can send us a message here:</p>
    <form action="" target="_blank">
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Name"  name="Name"></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Message \ Special requirements" name="Message"></p>
      <p><button class="w3-button w3-light-grey w3-section" type="submit">SEND MESSAGE</button></p>
    </form>
  </div>
  
<!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32">
  <p></p>
</footer>


</body></html>
