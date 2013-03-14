overview = File.open 'examples/overview.html', 'w'

overview.write <<HEADER
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>List of SVuGy Example Files</title>
    <style type='text/css'>
      h2 { color: black; background-color: #88FF88; padding: 10pt; }
    </style>
  </head>
  <body>
    <h1>List of SVuGy Example Files</h1>
HEADER

Dir.glob('examples/*.rb') do |rubyname|
  svgname = rubyname.sub(/\.rb$/, '.svg')
  basename = rubyname.sub(/examples\//, '').sub(/\.rb/, '')
  command = "ruby #{rubyname} > #{svgname}"
  puts command
  system command
  overview.write <<-DRAWING
    <div>
      <h2>File "#{basename}"</h2>
      <object type='image/svg+xml' data='#{basename}.svg' width='100%' height='600px' />
    </div>
  DRAWING
end

overview.write <<FOOTER
  </body>
</html>
FOOTER
