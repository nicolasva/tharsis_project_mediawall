require 'SVuGy'

drawing4 = SVuGy::Document.new(200, 200) do
  g {
    fill :none
    stroke :black
    stroke_width 1
    font_size 18
    labeled_circle :stateS,  30,  30, 15, "S"
    labeled_circle :stateA, 170,  30, 15, "A"
    circle 170, 30, 12
    labeled_circle :stateB, 170, 170, 15, "B"
    labeled_circle :stateC,  30, 170, 15, "C"
    labeled_circle :stateD, 100, 100, 15, "D"
    arrow 0, 0, stateS.tl
    arrow stateS.mr, stateA.ml
    text "0", 100, 25
    arrow stateS.bc, stateC.tc
    text "1", 20, 100
    arrow stateC.tr, stateD.bl
    text "1", 60, 130
    arrow stateD.tr, stateA.bl
    text "1", 130, 60
    arrow stateD.br, stateB.tl
    text "1", 160, 100
    arrow stateC.mr, stateB.ml
    text "1", 100, 185
    arrow stateA.bc, stateB.tc
    text "0", 140, 130
    bent_arrow stateB.tc, stateA.bc, 20, 50
    text "0", 190, 100
  }
end
print drawing4.to_svg
