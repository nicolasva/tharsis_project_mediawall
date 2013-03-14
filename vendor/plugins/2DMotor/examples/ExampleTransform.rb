#Example Transform

require '/home/nicolas/ruby/prj/newproject/vendor/plugins/SVuGy-0.03/SVuGy'

drawingTR = SVuGy::Document.new(800, 600) do
  ph1 = path(['M',150,200,'C',80,160,130,20,170,100]).style(:stroke =>:red, :stroke_width => 5, :fill => :none)
  ph2 = path(['M', 100, 200, 'C', 100, 100, 250, 100, 250, 200, 'S', 400, 300, 400, 200])
end
print drawingTR.to_svg
