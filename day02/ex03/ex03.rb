#!/usr/bin/env ruby -w

class Text
    def initialize(str)
        @str = str
    end

    def to_s
        @str.to_s
    end
end

class Elem
    attr_reader :tag, :content, :tag_type, :opt

    def initialize(tag = "", content = [], tag_type = "double", opt = {})
        @tag = tag
        @content = content 
        @tag_type = tag_type
        @opt = opt
    end 

    def add_content(*con)
        if con.first.respond_to?(:concat)
            @content.concat(con.first)
        else
            @content.concat(con)
        end
    end

    def to_s()
		html = "<" + @tag + ""
		if @opt.length != 0
			html += " "
		end
		@opt.each do |k, v|
			html += k.to_s + "='" + v.to_s + "' "
		end

		if @tag_type == "simple"
			html += "/>"
			return html
		end
		html += ">"
		if @content.class == Text
			html += @content.to_s
		else
			html += "\n"
			@content.each do | elem |
				html += elem.to_s + "\n"
			end
		end
		html += "</" + @tag + ">"
		return html
    end
end
