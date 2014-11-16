simple_life_game
=========
<a href="http://en.wikipedia.org/wiki/Conway's_Game_of_Life">Conway's Game of Life</a>.

Installing:

	gem install simple_life_game
	
Use:  
  
    game = LifeGame.new(width, height) # new object width*height.
    
    game.print_card                    # print game card.
    
    game.next_gen!                     # next generation.