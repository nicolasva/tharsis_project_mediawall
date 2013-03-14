# Example Repeat: CSS box model, first useful drawing

require 'SVuGy'

drawing = SVuGy::Document.new(600, 800) do
  tri = group(:tri){
    line(100, 100, 250, 250).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    line(250, 250, 100, 250).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    line(100, 250, 100, 100).style(:stroke => :black, :fill => :none, :stroke_width => 2)
  }
  repeat(tri, 3, 50, 100)
  
  repeat(3, 50, 100){
    line(200, 200, 350, 350).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    line(350, 350, 200, 350).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    line(200, 350, 200, 200).style(:stroke => :black, :fill => :none, :stroke_width => 2)
  }
end

print drawing.to_svg
