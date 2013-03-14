require 'SVuGy'

drawing = SVuGy::Document.new(800, 400) do
  g {
    rect 50, 50, 150, 100
    circle 250, 150, 75
  }
  text 'Hello SVuGy!', 50, 40
end

print drawing.to_svg