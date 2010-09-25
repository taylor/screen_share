require 'rubygems'
require 'sinatra'
require 'time'
require 'haml'

set :started, false
set :pid, nil

get '/' do
  launch_screen_capture
  
  @file = "screen.png"
  
  haml :index
end

def image_path
  File.join(File.dirname(__FILE__), 'public', 'screen.png')
end

def launch_screen_capture  
  unless settings.started
    set :started, true
    
    pid = fork do
      exec 'ruby screen_capture.rb'
    end
    
    set :pid, pid
  end
end