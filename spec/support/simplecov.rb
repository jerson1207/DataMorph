require 'simplecov'

SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'

  track_files 'app/**/*.rb'
end

puts "SimpleCov started!" if ENV['CI']
