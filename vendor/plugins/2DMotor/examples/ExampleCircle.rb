require '/home/nicolas/ruby/prj/newproject/vendor/plugins/SVuGy-0.03/SVuGy'

drawing = SVuGy::Document.new(1000, 800) do
    c1 = circle(300, 300, 100).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('circle1', 270, 300).style(:font_size => 30)
    text('text1',100, 100).style(:font_size => 30)
    arrow(130, 110, c1.tl.x, c1.tl.y).style(:stroke => :black, :stroke_width => 4)
    text('arrow1', 180, 150).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    c2 = circle(150, 700, 50).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('circle2', 110, 700).style(:font_size => 30)
    arrow(c2.tr.x, c2.tr.y, c1.bc.x, c1.bc.y).style(:stroke => :black, :stroke_width => 4)
    text('arrow2', 130, 500).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')

    c3 = circle(700, 350, 80).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('circle3', 670, 350).style(:font_size => 30)
    arrow(c1.mr.x, c1.mr.y, c3.ml.x, c3.ml.y).style(:stroke => :black, :stroke_width => 4)
    text('arrow3', 500, 280).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
end

print drawing.to_svg
