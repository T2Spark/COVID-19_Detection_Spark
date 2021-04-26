<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Home</title>
<style type="text/css">
#chartdiv {
  width : 100%;
  height  : 400px;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}

</style>

</head>
<body>
<!-- partial:index.partial.html -->
<script src="https://www.amcharts.com/lib/3/ammap.js"></script>
<script src="https://www.amcharts.com/lib/3/maps/js/indiaLow.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/none.js"></script>
<ul>
  <li><a class="active" href="#home">Travel Risk</a></li>
  <li><a href="#news">Symptom Risk</a></li>
  <li><a href="#about">About</a></li>
</ul>
<div id="chartdiv"></div>
<!-- partial -->
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
  
  <body>
      <form name = "selected">
         <input type = "text" name = "selectedStates" size = "20" />
      </form>
  <form action="/action_page.php">
  <label for="Name">Name of the passenger :</label>
  <input type="text" id="Name" name="passengerName"><br><br>
  <label for="Source">Source location:</label>
  <input type="text" id="source" name="sourceLocation"><br><br>
  <label for="Destination">Destination location:</label>
  <input type="text" id="destination" name="destLocation"><br><br>
   <label for="Symptoms">Symptoms :</label>
  <input type="text" id="symptoms" name="symptoms"><br><br>
  <input type="submit" value="Submit">
</form>

</body>
</html>