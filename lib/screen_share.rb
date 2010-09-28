require 'rubygems'
require 'sinatra'
require 'time'
require 'haml'

get '/' do
  launch_screen_capture

  @file = "screen.png"

  haml :index
end

def launch_screen_capture  
  unless screen_capture_running?
    pid = fork do
      exec "ruby #{File.join(File.dirname(__FILE__), 'screen_capture.rb')}"
    end
    
    File.open(screen_capture_pid_file, 'w') {|f| f.write(pid) }
  end
end

def screen_capture_running?
  File.exist?(screen_capture_pid_file)
end

def screen_capture_pid_file
  File.join(File.dirname(__FILE__), 'screen_capture.pid')
end

def kill_screen_capture
  if screen_capture_running?
    pid = File.read(screen_capture_pid_file)
    
    Process.kill(9, pid.to_i)
    
    File.delete(screen_capture_pid_file) 
  end
end

at_exit { kill_screen_capture }