#Example Ellipse

require 'SVuGy'

drawing4 = SVuGy::Document.new(1000, 800) do
    el1 = ellipse(500, 50, 80, 30).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('el1', 480, 50).style(:font_size => 20)

    el2 = ellipse(500, 250, 100, 50).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('el2', 480, 250).style(:font_size => 20)

    el3 = ellipse(200, 380, 30, 70).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('el3', 180, 380).style(:font_size => 20)

    el4 = ellipse(700, 400, 20, 50).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('el4', 680, 400).style(:font_size => 20)

    arrow(el1.bc.x, el1.bc.y, el2.tc.x, el2.tc.y).style(:stroke => :black, :stroke_width => 4)
    arrow(el2.bl.x, el2.bl.y, el3.tr.x, el3.tr.y).style(:stroke => :black, :stroke_width => 4)
    arrow(el2.br.x, el2.br.y, el4.tl.x, el4.tl.y).style(:stroke => :black, :stroke_width => 4)

end
print drawing4.to_svg
