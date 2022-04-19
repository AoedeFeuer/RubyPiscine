#!/usr/bin/env ruby -w
require 'open-uri'
require 'nokogiri'

class Parse
  def initialize
    
  end

  def get_cheetsheet
    doc = Nokogiri::HTML(URI.open("http://www.pragtob.info/rails-beginner-cheatsheet/"))
    file = File.new("index.html", "w")
    file.puts doc
  end
end

if $PROGRAM_NAME == __FILE__
  Parse.new.get_cheetsheet()
end