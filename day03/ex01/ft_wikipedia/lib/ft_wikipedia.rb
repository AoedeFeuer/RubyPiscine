#require "ft_wikipedia/version"
require "nokogiri"
require "open-uri"


class Ft_wikipedia
  def initialize
    @visited = []
    @nb_move = 0
  end

  def search(page)
    url = "https://en.wikipedia.org/wiki/#{page}"
    if @nb_move == 0
      puts("First search @ : " + url)
    else
      puts(url)
    end
    if page.eql? "Philosophy"
      return @nb_move
    end
    if @nb_move > 36
      raise StandardError, "Loop detected there is no way to philosophy here"
      return
    end
    
    if !page = Nokogiri::HTML(open(url))
      raise StandardError, "Dead end page reached"
      return
    end
    a = page.css('body').css('div').css('p').css('a').first['href'].gsub("/wiki/", "")
    if !@visited.include?(a)
      @visited.push(a)
      @nb_move += 1
    else
      raise StandardError, "#{a}: Loop detected there is no way to philosophy here"
      return
    end
    self.search(a)
    puts a
  end
end

# require_relative "ft_wikipedia.rb"
# Ft_wikipedia.new.search("Communication")