<!DOCTYPE html>
<html lang="en">
<title>Team 2</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}

#chartdiv {
  width : 100%;
  height  : 400px;
}
</style>
<body>
<script src="https://www.amcharts.com/lib/3/ammap.js"></script>
<script src="https://www.amcharts.com/lib/3/maps/js/indiaLow.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/none.js"></script>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>Covid-19<br>Risk<br>Calculator</b></h3>
    <hr style="width:50px;border:5px solid white" class="w3-round">
  </div>
  <div class="w3-bar-block">
    <a href="#useful" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Home</a> 
    <a href="#travelling_risk" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Travelling Risk</a> 
    <a href="#symptoms_risk" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Symptoms based Risk</a> 
    <a href="#designers" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Designers</a> 
    
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
  <span>Covid Risk Calculator</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

  <!-- Header -->
  <div class="w3-container" style="margin-top:80px; height:600px" id="useful">
    <h1 class="w3-jumbo"><b>Covid Risk Prediction</b></h1>
    <%String s= "Tamil Nadu"; %>
    <h1 class="w3-xxxlarge w3-text-red"><b>How is this site useful? ${map.DL}} </b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <p>We provide you with risk analysis of travelling in India during the pandemic ${map.TN}</p>
    <p>We help you calculate the probability that you will contract COVID-19 while travelling through India based on up to date information gathered from various internet sources </p>
  </div>
  
  <!-- Photo grid (modal) -->
  <div class="w3-row-padding">
    
  </div>

  <!-- Modal for full size images on click-->
  <div id="modal01" class="w3-modal w3-black" style="padding-top:0" onclick="this.style.display='none'">
    <span class="w3-button w3-black w3-xxlarge w3-display-topright">×</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      <img id="img01" class="w3-image">
      <p id="caption"></p>
    </div>
  </div>

  <!-- Services -->
  <div class="w3-container" id="travelling_risk" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>Travelling Risk.</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <p>When you are travelling during the COVID times, taking measured risk is of utmost importance!</p>
    <div id="chartdiv"></div>
    <script>
  var map;
  AmCharts.ready(function () {
    map = new AmCharts.AmMap();
    map.panEventsEnabled = true;
    map.backgroundColor = "#FBEEC1";
    map.backgroundAlpha = 1;

    map.zoomControl.panControlEnabled = true;
    map.zoomControl.zoomControlEnabled = true;

    var dataProvider = {
      map: "indiaLow",
      getAreasFromMap: true
    };

    map.dataProvider = dataProvider;

    map.areasSettings = {
      autoZoom: false,
      color: "#DAAD86",
      colorSolid: "#BC986A",
      selectedColor: "#d57680",
      outlineColor: "#666666",
      rollOverColor: "#8D8741",
      rollOverOutlineColor: "#000000",
      selectable: true
    };

    map.addListener("clickMapObject", function (event) {
      // deselect the area by assigning all of the dataProvider as selected object
      map.selectedObject = map.dataProvider;

      // toggle showAsSelected
      event.mapObject.showAsSelected = !event.mapObject.showAsSelected;

      // bring it to an appropriate color
      map.returnInitialColor(event.mapObject);

      // let's build a list of currently selected states
      var states = [];
      for (var i in map.dataProvider.areas) {
        var area = map.dataProvider.areas[i];
        if (area.showAsSelected) {
          states.push(area.title);
          document.selected.selectedStates.value = states
        }
      }
    });
    map.export = {
      enabled: true
    };

    map.write("chartdiv");
  });  
  
  
  
  </script>
  	<button  class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom" style="margin-top:20px">Risk probability</button>
  </div>
  <!-- Contact -->
  <div class="w3-container" id="symptoms_risk" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>Symptom Based Risk</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <p>Do you want to compare your symptoms with those who have tested positive for COVID? You're in the right place!</p>
    <form action="/action_page.php" target="_blank">
      <div class="w3-section">
        <label>to be changed later</label>
        <input class="w3-input w3-border" type="text" name="Name" required>
      </div>
      <div class="w3-section">
        <label>Email</label>
        <input class="w3-input w3-border" type="text" name="Email" required>
      </div>
      <div class="w3-section">
        <label>Message</label>
        <input class="w3-input w3-border" type="text" name="Message" required>
      </div>
      <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom">Send Message</button>
    </form>  
  </div>
  
  <!-- Designers -->
  <div class="w3-container" id="designers" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>Designers.</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <p><b>This website uses concepts of SPARK, SPARK MLlib, Spring MVC, HTML, CSS and JavaScript to provide you the service.</b> 
    </p>
  </div>

  <!-- The Team -->
  <div class="w3-row-padding w3-grayscale" style="margin-bottom:300px">
    <div class="w3-col m4 w3-margin-bottom">
      <div class="w3-light-grey">
        <div class="w3-container">
          <h3>Purushotham Parthy</h3>
          <p class="w3-opacity">8088254</p>
        </div>
      </div>
    </div>
    <div class="w3-col m4 w3-margin-bottom">
      <div class="w3-light-grey">
        <div class="w3-container">
          <h3>Sreekesh V</h3>
          <p class="w3-opacity">8087989</p>
        </div>
      </div>
    </div>
    <div class="w3-col m4 w3-margin-bottom" >
      <div class="w3-light-grey">
        <div class="w3-container">
          <h3>Wiwatdaka Iakai</h3>
          <p class="w3-opacity">8087948</p>
        </div>
      </div>
    </div>
  </div>

  
<!-- End page content -->
</div>

<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-32" style="margin-top:75px;padding-right:58px"><p class="w3-right"></p></div>

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
</script>

</body>
</html>
