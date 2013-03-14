# Example 1: rectangles, with fill/stroke/stroke-width, 2007/05/12
#              showing various notational variants

require '/home/nicolas/ruby/prj/newproject/vendor/plugins/SVuGy-0.03/SVuGy'

drawing1 = SVuGy::Document.new(600, 600) do
  rect(0, 0, 200, 200).style(:fill => :none, :stroke_width => 3).style(:stroke => 'black')
  rect(200, 100, 40, 80).stroke_width(5).stroke(:blue) do
    fill 'yellow'
    #stroke :blue
    #stroke_width 5
  end
  rect -100, 200, 20, 400
  our_rectangle = rect 100, 150, 40, 80
  our_group = group {
    rect(400, 200, 200, 200)
    our_style = style {
      fill :none
      stroke Hff0000
      stroke_width 10
    }
    rect 300, 300, 200, 200
    line :myline, 300, 300, 100, 500
  }
  line(our_rectangle.br, myline.start).stroke_width(5).stroke(:blue)
end

print drawing1.to_svg
