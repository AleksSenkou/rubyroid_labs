//require("canvas.js");

$(document).ready(function() {
  var Cell = {
    position_x: 0,
    position_y: 0,
    neighbors_num: 0,
    DEAD: 0,
    ALIVE: 1
  }

  var Life = {
    cells_count_x: 40, 
    cells_count_y: 20
  };

  Life.gridInit = function(y, x, state) {
      var matrix = [];
      for(var i = 0; i < y; i++) {
        matrix[i] = [];
        for(var j = 0; j < x; j++) {
          matrix[i][j] = state;
        }
      }
      return matrix;
  };

  Life.grid = Life.gridInit(Life.cells_count_y, Life.cells_count_x, Cell.DEAD);

  Life.updateGameGrid = function() {
    var next_gen_grid = Life.gridInit(Life.cells_count_y, Life.cells_count_x, 0);

    for(var y = 0; y < Life.cells_count_y; y++) {
      for(var x = 0; x < Life.cells_count_x; x++) {
        Life.findNeighbors(y, x);
        if(Life.grid[y][x] == Cell.DEAD) {
          if(Cell.neighbors_num == 3) {
            next_gen_grid[y][x] = Cell.ALIVE;
          }
        } else {
          if(Cell.neighbors_num == 2 || Cell.neighbors_num == 3) {
            next_gen_grid[y][x] = Cell.ALIVE;
          }
        }
      }
    }

    Life.copyGrid(next_gen_grid, Life.grid);
  };

  Life.findNeighbors = function(y, x) {
    var up = (y == 0) ? Life.cells_count_y - 1 : y - 1;
    var down = (y == Life.cells_count_y - 1) ? 0 : y + 1;
    var left = (x == 0) ? Life.cells_count_x - 1 : x - 1;
    var right = (x == Life.cells_count_x - 1) ? 0 : x + 1;

    Cell.neighbors_num = Life.grid[down][left] + Life.grid[down][x] +
                         Life.grid[down][right] + Life.grid[y][right] +
                         Life.grid[y][left] + Life.grid[up][left] +
                         Life.grid[up][x] + Life.grid[up][right];
  };

  Life.copyGrid = function(source, destination) {
    for(var y = 0; y < Life.cells_count_y; y++) {
      destination[y] = source[y].slice(0);
    } 
  };

///////////////////////////////////////////////////////////
////////////////// WORK WITH ANIMATION ////////////////////
///////////////////////////////////////////////////////////

  drawingCanvas = document.getElementById("canvas");
  clearButton = document.getElementById("buttonClear");
  runButton = document.getElementById("buttonRun");
  stepButton = document.getElementById("buttonStep");
  stopButton = document.getElementById("buttonStop");
  context = drawingCanvas.getContext("2d");
  
  var Canvas = {
    size_x: parseInt(drawingCanvas.getAttribute("width")),
    size_y: parseInt(drawingCanvas.getAttribute("height")),
    STOPPED: 0,
    RUNNING : 1,
    DELAY: 70,
    state: 0,
    interval: null
  }

  Cell.size_x = (Canvas.size_x - 1) / Life.cells_count_x;
  Cell.size_y = (Canvas.size_y - 1) / Life.cells_count_y;
  
  Canvas.drawGridLines = function() {
    context.lineWidth = 1;
    context.strokeStyle = "#000000";

    for(var x = 0; x <= this.size_x; x += Cell.size_x) {
      context.moveTo(x + 0.5, 0);
      context.lineTo(x + 0.5, this.size_y);  
    }
  
    for(var y = 0; y <= this.size_y; y += Cell.size_y) {
      context.moveTo(0, y + 0.5);
      context.lineTo(this.size_x, y + 0.5);
    }   
    context.stroke(); 
  };
        
  Canvas.updateGridCells = function() {
    for(var y = 0; y <= Life.cells_count_y; y++) {
      for(var x = 0; x <= Life.cells_count_x; x++) {
        if (Life.grid[y][x] == Cell.ALIVE) {
          context.fillStyle = "#4169E1";                 
        } else {
          context.fillStyle = "#eee";
        }
        context.fillRect(x * Cell.size_x + 1, y * Cell.size_y + 1,
                           Cell.size_x - 1,     Cell.size_y - 1);
      }
    }
  };

  function canvasOnClickHandler(event) {
    getCursorPosition(event);
    var state = Life.grid[Cell.position_y][Cell.position_x] == Cell.ALIVE ? Cell.DEAD : Cell.ALIVE;
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

  function update() {
    Life.updateGameGrid();
    Canvas.updateGridCells();
  };

  clearButton.onclick = function() {
    Life.grid = Life.gridInit(Canvas.size_y, Canvas.size_x, Cell.DEAD);
    clearInterval(Canvas.interval);
    Canvas.state = Canvas.STOPPED;
    Canvas.updateGridCells();
  };

  runButton.onclick = function() {
    Canvas.interval = setInterval(function() { update(); }, Canvas.DELAY);
    Canvas.state = Canvas.RUNNING;
  }

  stopButton.onclick = function() {
    clearInterval(Canvas.interval);
    Canvas.state = Canvas.STOPPED;
  }
           
  Canvas.drawGridLines();
  drawingCanvas.addEventListener("click", canvasOnClickHandler, false);

});

