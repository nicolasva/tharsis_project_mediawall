#Example Matrix

require '/home/nicolas/ruby/prj/newproject/vendor/plugins/SVuGy-0.03/SVuGy'

drawingMatrix = SVuGy::Document.new(600, 600) do
  group(:mygroup1).stroke_width(3).fill(:none) {
    rect(:myrect1, 100, 100, 50, 150).stroke(:gray)
    rect(:myrect2, 100, 100, 50, 150).stroke(:red).skewX(5)
    rect(:mysquare1, 300, 300, 120, 120).stroke(:gray)
    rect(:mysquare2, 300, 300, 120, 120).stroke(:yellow).translate(10, 20)
    mysquare2.scale(1.2)
    mysquare2.skewY(10)
    group.translate(50,50) {
      rect(:myrect3, 100, 100, 50, 150).stroke(:blue).skewY(5)
      arrow(myrect3.br, mysquare2.tl).stroke(:black).stroke_width(2)
    }
    group(:mygroup2).skewX(10) {
      circle(:mycircle1, 120, 400, 50).stroke(:gray).skewX(-10)
      circle(:mycircle2, mycircle1.mc, 50).stroke(:purple)
    }
    arrow(mycircle2.tc, mysquare2.bl).stroke(:orange).stroke_width(2)
  }
  grid_line(:mygrid, 50).stroke('#eeeeee').stroke_width(0.5)
end
print drawingMatrix.to_svg
