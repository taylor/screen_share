image_path = File.join(File.dirname(__FILE__), 'public', 'screen.png')

loop do
  `screencapture -C #{image_path}`
  sleep 2
end