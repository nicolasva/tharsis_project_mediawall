##example of Image, Anchor, Defs and Use
require '/home/nicolas/ruby/prj/newproject/vendor/plugins/SVuGy-0.03/SVuGy'

drawing = SVuGy::Document.new(1000, 1000) do
#(x,y,largeur_x, largeur_y)
    im = image(0, 0, 1000, 1000, "/home/nicolas/ruby/prj/newproject/public/img_sqlite/floor/floor.png").style(:stroke => :black, :fill => :none, :stroke_width => 2)

    rect(:myrect1, 20, 300, 100, 100).stroke_width(5).stroke(:blue).skewX(40) do 
    	fill :none
    end
end

print drawing.to_svg
