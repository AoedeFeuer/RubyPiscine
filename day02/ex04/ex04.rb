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

class Html < Elem
    def initialize(content = [], opt = {})
        super("html", content, "double", opt)
    end
end

class Head < Elem
    def initialize(content = [], opt = {})
        super("head", content, "double", opt)
    end
end

class Body < Elem
    def initialize(content = [], opt = {})
        super("body", content, "double", opt)
    end
end

class Title < Elem
    def initialize(content = [], opt = {})
        super("title", content, "double", opt)
    end
end

class Meta < Elem
    def initialize(content = [], opt = {})
        super("meta", content ,"simple", opt)
    end
end

class Img < Elem
    def initialize(content = [], opt = {})
        super("img", content ,"simple", opt)
    end
end

class Table < Elem
    def initialize(content = [], opt = {})
        super("table", content, "double", opt)
    end
end

class Th < Elem
    def initialize(content = [], opt = {})
        super("th", content, "double", opt)
    end
end

class Tr < Elem
    def initialize(content = [], opt = {})
        super("tr", content, "double", opt)
    end
end

class Td < Elem
    def initialize(content = [], opt = {})
        super("td", content, "double", opt)
    end
end

class Ul < Elem
    def initialize(content = [], opt = {})
        super("ul", content, "double", opt)
    end
end

class Ol < Elem
    def initialize(content = [], opt = {})
        super("ol", content, "double", opt)
    end
end

class Li < Elem
    def initialize(content = [], opt = {})
        super("li", content, "double", opt)
    end
end

class H1 < Elem
    def initialize(content = [], opt = {})
        super("h1", content, "double", opt)
    end
end

class H2 < Elem
    def initialize(content = [], opt = {})
        super("h2", content, "double", opt)
    end
end

class P < Elem
    def initialize(content = [], opt = {})
        super("p", content, "double", opt)
    end
end

class Div < Elem
    def initialize(content = [], opt = {})
        super("div", content, "double", opt)
    end
end

class Span < Elem
    def initialize(content = [], opt = {})
        super("span", content, "double", opt)
    end
end

class Hr < Elem
    def initialize(content = [], opt = {})
        super("hr", content ,"simple", opt)
    end
end

class Br < Elem
    def initialize(content = [], opt = {})
        super("br", content ,"simple", opt)
    end
end


if $PROGRAM_NAME == __FILE__
    puts Html.new([Head.new([Title.new("Hello ground!")]),
    Body.new([H1.new("Oh no, not again!"),
    Img.new([], {'src':'http://i.imgur.com/pfp3T.jpg'}) ]) ])
end