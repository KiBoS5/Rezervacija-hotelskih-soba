<html >
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
  background-color: #666;
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 30%;
  height: 600px; /* only for demonstration, should be removed */
  background: #ccc;
  padding: 20px;
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  background-color: #f1f1f1;
  height: 400px; /* only for demonstration, should be removed */
    text-align: center;
    font-family:cursive;
}
        p{ text-align: left;
        font-family:cursive;
        font-size: 23;}

/* Clear floats after the columns */
section::after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
  background-color: #777;
  padding: 10px;
  text-align: center;
  color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
        .dropbtn {
  background-color: dimgray;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
  background-color: gray;
}
</style>
    
    </head>
<body>
    <form id="rez" method="post" action="">
        
       <header>
  <h2>REZERVACIJA HOTELSKIH SOBA</h2>
</header>

<section>
  <nav>
    <div class="dropdown">
  <button class="dropbtn">UNOS</button>
  <div class="dropdown-content">
    <a href="Sobe.php">SOBE</a>
    <a href="Gosti.php">GOSTI</a>
       </div>
</div>
      <div class="dropdown">
       <button class="dropbtn">ANALIZA</button>
  <div class="dropdown-content">
    <a href="NeuplaceneRezervacije.php">NEUPLACENE REZERVACIJE</a>
    <a href="SlobodneSobe.php">SLOBODNE SOBE</a>
      </div>
      </div>
      
  </nav>
  
  <article>
    <h1>INFO O HOTELU</h1>
    <p>Hotelska kuća Hoteli Krk sa sjedištem u gradu Krku u svojem vlasništvu ima četiri smještajna objekta na atraktivnim lokacijama u gradu, a svojom raznolikom ponudom odgovorit će na želje najzahtjevnijih gostiju i pružiti im odmor za pamćenje.</p>
    <p>Za luksuzni odmor u središtu grada Krka tu je Boutique hotel Marina s 4 zvjezdice koji se nalazi na samoj rivi uz more i u blizini povijesnih znamenitosti. </p>
  </article>
</section>

<footer>
  <p>Footer</p>
</footer>
        
        
    </form>
    </body>



</html>