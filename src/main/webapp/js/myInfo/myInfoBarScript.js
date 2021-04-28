        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
          var data = google.visualization.arrayToDataTable([
            ["Element", "Density", { role: "style" } ],
            ["오늘", 50000, "#3f1785"],
            ["어제", 60000, "#571fb8"],
            ["최근 7일 평균", 110000, "#B8B2F4"]
          ]);

          var view = new google.visualization.DataView(data);
          view.setColumns([0, 1,
                           { calc: "stringify",
                             sourceColumn: 1,
                             type: "string",
                             role: "annotation" },
                           2]);

          var options = {
            width: 600,
            height: 320,
            bar: {groupWidth: "95%"},
            legend: { position: "none" },
            chartArea:{left:100,top:16,width:'100%',height:'85%'},
            textStyle:{
            	fontName : 'nsrb',
				fontSize : 18  ,
				bold: false,
			      italic: false,
			      // The color of the text.
			      color: 'black',
			      // The color of the text outline.
			      auraColor: null,
			      // The transparency of the text.
			      opacity: 0.8
            }
          };
          var chart = new google.visualization.BarChart(document.getElementById("myinfoBar"));
          chart.draw(view, options);
      }