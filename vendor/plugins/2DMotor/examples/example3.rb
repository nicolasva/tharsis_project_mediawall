# Example 3: simple drawing with attachment points
# - can connect reference points on a rectangle with lines
# - can draw arrow

require 'SVuGy'

drawing3 = SVuGy::Document.new(1000, 800) do
    sc = rect(100, 200, 200, 100).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('students.c', 130, 260).style(:font_size => 30)
    text('stdio.h', 30, 90).style(:font_size => 30)
    arrow(50, 100, sc.tl).style(:stroke => :black, :stroke_width => 4)
    text('#include <stdio.h>', 70, 130).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    so = rect(100, 400, 200, 100).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('students.o', 130, 460).style(:font_size => 30)
    arrow(sc.bc, so.tc).style(:stroke => :black, :stroke_width => 4)
    text('#include "digits.h"', 180, 180).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    dh = rect(400, 100, 200, 100).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('digits.h', 450, 160).style(:font_size => 30)
    arrow(dh.ml, sc.tr).style(:stroke => :black, :stroke_width => 4)
    text('#include "digits.h"', 660, 180).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    dc = rect(700, 200, 200, 100).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('digits.c', 750, 260).style(:font_size => 30)
    arrow(dh.mr, dc.tl).style(:stroke => :black, :stroke_width => 4)
    text('gcc -c students.c', 220, 360).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    d_o = rect(700, 400, 200, 100).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('digits.o', 750, 460).style(:font_size => 30)
    arrow(dc.bc, d_o.tc).style(:stroke => :black, :stroke_width => 4)
    text('gcc -c digits.c', 640, 360).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    se = rect(400, 600, 200, 100).style(:stroke => :black, :fill => :none, :stroke_width => 4)
    text('students.exe', 420, 660).style(:font_size => 30)
    arrow(so.bc, se.tl).style(:stroke => :black, :stroke_width => 4)
    arrow(d_o.bc, se.tr).style(:stroke => :black, :stroke_width => 4)
    text('gcc -o students students.o digits.o', 340, 560).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
end

print drawing3.to_svg
