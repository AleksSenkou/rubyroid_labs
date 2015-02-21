//require("canvas.js");

$(document).ready(function() {
  var Life = {
    DEAD: 0,
    ALIVE: 1,
    STOPPED: 0,
    RUNNING : 1
  };

  Life.gridInit = function(x, y, state) {
      var matrix = [];
      for(var i = 0; i < y; i++) {
        matrix[i] = [];
        for(var j = 0; j < x; j++) {
          matrix[i][j] = state;
        }
      }
      return matrix;
  };
          
  var Cell = {
    count_x: 40, 
    count_y: 20,
    position_x: 0,
    position_y: 0 
  }

  Life.grid = Life.gridInit(Cell.count_y, Cell.count_x, 0);

///////////////////////////////////////////////////////////
////////////////// WORK WITH ANIMATION ////////////////////
///////////////////////////////////////////////////////////

  drawingCanvas = document.getElementById("canvas");
  context = drawingCanvas.getContext("2d");
  
  var Canvas = {
    size_x: parseInt(drawingCanvas.getAttribute("width")),
    size_y: parseInt(drawingCanvas.getAttribute("height"))
  }

  Cell.size_x = (Canvas.size_x - 1) / Cell.count_x;
  Cell.size_y = (Canvas.size_y - 1) / Cell.count_y;
  
  Canvas.drawGridLines = function() {
    context.lineWidth = 1;
    context.strokeStyle = "#000000";

    for(var i = 0; i <= this.size_x; i += Cell.size_x) {
      context.moveTo(i + 0.5, 0);
      context.lineTo(i + 0.5, this.size_y);  
    }
  
    for(i = 0; i <= this.size_y; i += Cell.size_y) {
      context.moveTo(0, i + 0.5);
      context.lineTo(this.size_x, i + 0.5);
    }   
    context.stroke(); 
  };
        
  Canvas.updateGridCells = function() {
    for(var i = 0; i <= Cell.count_y; i++) {
      for(var j = 0; j <= Cell.count_x; j++) {
        if (Life.grid[i][j] == Life.ALIVE) {
          context.fillStyle = "#4169E1";                 
        } else {
          context.fillStyle = "#eee";
        }
        context.fillRect(j * Cell.size_x + 1, i * Cell.size_y + 1,
                           Cell.size_x - 1,     Cell.size_y - 1);
      }
    }
  };

  function canvasOnClickHandler(event) {
    getCursorPosition(event);
    var state = Life.grid[Cell.position_y][Cell.position_x] == Life.ALIVE ? Life.DEAD : Life.ALIVE;
    Life.grid[Cell.position_y][Cell.position_x] = state;
    Canvas.updateGridCells();
  };
    
  function getCursorPosition(event) {
    var x;
    var y;
    if (event.pageX || event.pageY) {
      x = event.pageX;
      y = event.pageY;
    } else {
      x = event.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
      y = event.clientY + document.body.scrollTop + document.documentElement.scrollTop;
    }
  
    x -= drawingCanvas.offsetLeft;
    y -= drawingCanvas.offsetTop;
    
    Cell.position_y = Math.floor((y - 4) / Cell.size_y);
    Cell.position_x = Math.floor((x - 2) / Cell.size_x);
  };
          
    Canvas.drawGridLines();
    drawingCanvas.addEventListener("click", canvasOnClickHandler, false);

});

