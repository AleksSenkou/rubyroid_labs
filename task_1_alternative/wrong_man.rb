require 'green_shoes'

Shoes.app height: 750, width: 800 do
  def sea
    stroke midnightblue
    fill midnightblue
    rect 0, 700, 800, 200
    -10.step(790, 200) { |i| arc i, 680, 200, 100, 0, 10 }  
  end

  def mountain
    stroke sienna
    fill sienna
    rect 670, 100, 130, 700
    rect 600, 100, 70, 35   
  end

  def world
    stroke white
    fill white
    rect 400, 100, 800, 800
    #rect 0, 600, 800, 800
    sea
    mountain
  end

  def man(x, y, color)
    nostroke
    fill goldenrod
    oval x - 26, y - 20, 11
    oval x + 4, y - 20, 11
    oval x - 10, y - 39, 10
    rect x - 15, y + 20, 11, 30   
    rect x + 4, y + 20, 11, 30    
    fill white
    oval x - 20, y - 16, 7
    oval x + 7, y - 16, 7
    fill color
    rect x - 15, y - 20, 30, 40  
    fill black
    arc x - 21, y + 48, 18, 7, 0, 10  
    arc x + 3, y + 48, 18, 7, 0, 10 
  end

  def write_text(whiсh_man, text)
    para "#{whiсh_man.capitalize} man:"
    para "<i> #{text} </i>",margin_left: 20, undercolor: whiсh_man, underline: 'double', size: 16
  end

  def red_befor_death(img_red)
    img_red.move 580, 170
    write_text('red', 'Goodbuy, world!')
    a = animate 80 do |i|
      y = 35 + i 
      img_red.move 560, y
      if y > 670
        world
        a.stop
      end
    end
  end

  def blue_appeared(img_blue)
    write_text('blue', "Wait, i'm here")
    img_blue.move 800, 16
    a = animate 30 do |i|
      x = 800 - i
      img_blue.move x, 16
      a.stop if x < 600
    end
  end

  alert 'Start'
  world
  #man(600, 200, red)
  #man(700, 47, green)
  img_blue = image 'blue.png', height: 85, width: 40
  img_red = image 'red.png', height: 85, width: 40
  red_befor_death(img_red)
  write_text('red', 'Help me, please !')
  blue_appeared(img_blue)
  write_text('blue', 'Fuck!')
end