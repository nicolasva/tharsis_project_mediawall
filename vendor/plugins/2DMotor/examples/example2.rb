# Example 2: CSS box model, first useful drawing

require 'SVuGy'

drawing2 = SVuGy::Document.new(800, 400) do
  rect(0, 0, 800, 400).fill('#eeffee').stroke_width(0)
  t1 = nil
  group.fill(:green).font_size(40) {
    text 'Margin (top)', 320, 40
    text 'Margin (bottom)', 300, 390
    # using rotated_text
    rotated_text 'Margin (left)', 70, 300, -90
    rotated_text 'Margin (right)', 730, 100, 90
  }
  rect(100, 50, 600, 300).fill('#0066ff').stroke_width(0)
  group.fill(:black).font_size(20).font_weight(:bold) {
    text 'Border (top)', 360, 67
    text 'Border (bottom)', 350, 345
    # using text with points
    text('Border (left)', p1=pt(120, 250)).rotate -90, p1
    text('Border (right)', p2=pt(680, 130)).rotate 90, p2
  }
  rect(125, 75, 550, 250).fill('#ffe4e4').stroke_width(0)
  group.fill(:black).font_size(20).font_weight(:bold) {
    text 'Padding (top)', 355, 92
    text 'Padding (bottom)', 345, 320
    # using text with explicit rotation
    text('Padding (left)', 160, 255).rotate -90, 160, 255
    text('Padding (right)', 640, 125).rotate 90, 640, 125
  }
  
  textXY = [[175,125,0],[175,160,1],[175,190,0],[175,225,1],[175,255,0],[175,290,1]]

  str = ['This is some sample text','これは例文。これは例文。']

  rect(175, 100, 450, 200).style(:fill => :none, :stroke => :black, :stroke_width => 0.5)
  group.style(:fill => :black, :font_size => 30) {

	textXY.each do |ele|
      text str[ele[2]], ele[0], ele[1]
    end

#    text 'This is some sample text.', 175, 125
#    text 'これは例文。これは例文。', 175, 160
#    text 'This is some sample text.', 175, 190
#    text 'これは例文。これは例文。', 175, 225
#    text 'This is some sample text.', 175, 255
#    text 'これは例文。これは例文。', 175, 290
  }
end

print drawing2.to_svg
