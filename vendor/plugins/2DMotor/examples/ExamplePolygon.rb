#Example Ellipse

require '/home/nicolas/ruby/prj/newproject/vendor/plugins/SVuGy-0.03/SVuGy'

tab = Array.new
tab = [200.50, 120, 10, 220, 390, 220, 400, 300]
drawingPG = SVuGy::Document.new(900, 700) do
im = image(0, 0, 900, 700, "http://localhost:3000/img_sqlite/floor/floor.png")
#  pg1 = polyline(tab).style(:stroke => '#22ee88', :stroke_width => 3, :fill => :none)
  #pl1 = polyline(250,170,15,250,390,220,480,300,480,500).style(:stroke => '#2266ee', :stroke_width => 5, :fill => :none)
  #group.style(:fill => :green, :font_size => 30) {
   # text 'テスト', 155, 110
  #}
 polyline(tab).style(:stroke => '#22ee88', :stroke_width => 3, :fill => :none) 
end
print drawingPG.to_svg
