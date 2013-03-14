# Example 1: rectangles, with fill/stroke/stroke-width, 2007/05/12
#              showing various notational variants

require '/home/nicolas/ruby/prj/newproject/vendor/plugins/SVuGy-0.03/SVuGy'

drawing1 = SVuGy::Document.new(600, 600) do
  our_rectangle = rect 100, 150, 40, 80
  our_group = group {
    rect(400, 200, 200, 200)
    our_style = style {
      stroke Hff0000
      stroke_width 10
    }
    line :test, 300, 700, 200, 200
    line :myline, 300, 300, 100, 500
  }
  line(our_rectangle.br, myline.start).stroke_width(5).stroke(:blue)
end

print drawing1.to_svg
