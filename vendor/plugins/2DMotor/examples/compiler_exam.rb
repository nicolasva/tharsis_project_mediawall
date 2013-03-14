
require '/home/nicolas/ruby/prj/newproject/vendor/plugins/SVuGy-0.03/SVuGy'

drawing3 = SVuGy::Document.new(1000, 880) do

#left side
    cy = rect(200, 50, 150, 75).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    text('calc.y', 240, 95).style(:font_size => 30)
    
    bi = ellipse(275, 230, 75, 30).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    arrow(cy.bc, bi.tc).style(:stroke => :black, :stroke_width => 2)
    text('bison', 245, 238).style(:font_size => 30)
    
    ctc = rect(75, 325, 150, 75).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    text('calc.tab.c', 90, 370).style(:font_size => 30)
    arrow(bi.bc, ctc.tc).style(:stroke => :black, :stroke_width => 2)
    
    cth = rect(285, 325, 150, 75).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    text('calc.tab.h', 300, 370).style(:font_size => 30)
    arrow(bi.bc, cth.tc).style(:stroke => :black, :stroke_width => 2)
    
    text('bison -d -v calc.y', 350, 295).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    gcl = ellipse(150, 475, 75, 30).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    arrow(ctc.bc, gcl.tc).style(:stroke => :black, :stroke_width => 2)
    text('gcc', 130, 483).style(:font_size => 30)
    
    cto = rect(75, 550, 150, 75).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    text('calc.tab.o', 90, 595).style(:font_size => 30)
    arrow(gcl.bc, cto.tc).style(:stroke => :black, :stroke_width => 2)
    
    text('gcc -c calc.tab.c', 220, 523).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
#right side
    cl = rect(530, 50, 150, 75).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    text('calc.l', 570, 95).style(:font_size => 30)
    
    le = ellipse(605, 230, 75, 30).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    arrow(cl.bc, le.tc).style(:stroke => :black, :stroke_width => 2)
    text('lex', 588, 238).style(:font_size => 30)
    
    lyc = rect(530, 325, 150, 75).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    text('lex.yy.c', 560, 370).style(:font_size => 30)
    arrow(le.bc, lyc.tc).style(:stroke => :black, :stroke_width => 2)
    
    text('flex -I calc.l', 650, 295).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    arrow(cth.mr, lyc.ml).style(:stroke => :black, :stroke_width => 2)
    text('include', 450, 395).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    gcr = ellipse(605, 475, 75, 30).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    arrow(lyc.bc, gcr.tc).style(:stroke => :black, :stroke_width => 2)
    text('gcc', 585, 483).style(:font_size => 30)
    
    lyo = rect(530, 550, 150, 75).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    text('lex.yy.o', 560, 595).style(:font_size => 30)
    arrow(gcr.bc, lyo.tc).style(:stroke => :black, :stroke_width => 2)
    
    text('gcc -c lex.yy.o', 650, 523).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
#center
    gcc = ellipse(385, 715, 75, 30).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    arrow(cto.bc, gcc.ml).style(:stroke => :black, :stroke_width => 2)
    arrow(lyo.bc, gcc.mr).style(:stroke => :black, :stroke_width => 2)
    text('gcc', 365, 723).style(:font_size => 30)
    
    text('gcc -o calc.exe calc.tab.o lex.yy.o', 450, 763).style(:font_size => 20, :font_weight => :bold, :fill => '#008800', :font_family => 'sans-serif')
    
    ce = rect(310, 790, 150, 75).style(:stroke => :black, :fill => :none, :stroke_width => 2)
    text('calc.exe', 340, 835).style(:font_size => 30)
    arrow(gcc.bc, ce.tc).style(:stroke => :black, :stroke_width => 2)
    
end

print drawing3.to_svg
