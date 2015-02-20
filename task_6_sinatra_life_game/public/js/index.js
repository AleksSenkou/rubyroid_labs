//require("canvas.js");

$(document).ready(function() {
  drawingCanvas = document.getElementById("canvas");
  context = drawingCanvas.getContext("2d");
  
  var Canvas = {
    size_x: parseInt(drawingCanvas.getAttribute("width")),
    size_y: parseInt(drawingCanvas.getAttribute("height"))
  }
  var Cell = {
    count_x: 40, 
    count_y: 20 
  }
  Cell.size_x = Canvas.size_x / Cell.count_x;
  Cell.size_y = Canvas.size_y / Cell.count_y;
  
  Canvas.drawGrid = function() {
    context.lineWidth = 1;
    context.strokeStyle = "DimGrey";

    for(var i = Cell.size_x; i <= this.size_x - Cell.size_x; i += Cell.size_x) {
      context.moveTo(i, 0);
      context.lineTo(i, this.size_y);
      context.stroke();
    }
  
    for(i = Cell.size_y; i <= this.size_y - Cell.size_y; i += Cell.size_y) {
      context.moveTo(0, i);
      context.lineTo(this.size_x, i);
      context.stroke();
    }
  }


  Canvas.drawGrid();
  alert(Cell.size_x);
})

