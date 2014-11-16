require "colorize"

Time.class_eval do
  #unavailable_elements = ['E','f','i','J','K','o','O','q','Q']

  def method_missing args
    elements = args.to_s.split(//)
    str = making_available_for_strftime(elements)
    puts strftime(str).green
  end

  private
  def making_available_for_strftime(elements)
    elements.each_with_index.inject('') do |str, (elem, num)|
      str << if num > 0 && elements[num - 1] !~ /\D/ 
               elem
             else
               " %" + elem
             end
    end
  end
end