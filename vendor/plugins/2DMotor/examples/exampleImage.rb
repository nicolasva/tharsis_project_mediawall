##example of Image, Anchor, Defs and Use
require '/home/nicolas/ruby/prj/newproject/vendor/plugins/SVuGy-0.03/SVuGy'

drawing = SVuGy::Document.new(600, 600) do

    im = image(:test, 50, 50, 200, 200, "http://rabico.cocolog-tnc.com/photos/uncategorized/20060418a.jpg").style(:stroke => :black, :fill => :none, :stroke_width => 2)

    my_link = anchor("http://rabico.cocolog-tnc.com/photos/uncategorized/20060418a.jpg"){
      rect(300, 300, 200, 200)
    }

    my_def = defs {
        line(:myline, 250, 250, 300, 300).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    }

    my_line = use("myline")
end

print drawing.to_svg
