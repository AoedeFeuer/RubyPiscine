#!/usr/bin/env ruby -w

def generate_html()

    fileHtml = File.new("periodic_table.html", "w+")
    periodic_list = File.read("periodic_table.txt").split("\n")
    

    fileHtml.write <<-EOF
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <title>Periodic Table</title>
        <meta charset="utf-8">
        <style>
        th, td {
            border: 1px solid black;
            padding:10px;
        }
     </style>
    </head>

    <body>
        <h1>Periodical Table by Qweissna from 42</h1>
            <table>
    EOF

    i = 0
    periodic_list.each do |x|
        pr = x.split(",").map{|a| a.to_s.strip }

        name = pr[0].split("=").map{|a| a.to_s.strip }
        position = name[1].split(":").map{|a| a.to_s.strip }

        while i != position[1].to_i && i < 17 do
            fileHtml.write <<-EOF
                <td>
                
                </td>
            EOF
            i += 1
        end

        if i == 18
            fileHtml.write <<-EOF
            <tr>
        EOF
        i = 1
        else
            i += 1
        end

        fileHtml.write <<-EOF
                <td>
        EOF

        fileHtml.write <<-EOF
                    <h4>#{name[0]}</h4>
                        <ul>
        EOF
        number = pr[1].split(":").map{|a| a.to_s.strip }
        fileHtml.write <<-EOF
                            <li>No #{number[1]}</li>
        EOF

        element = pr[2].split(":").map{|a| a.to_s.strip }
        fileHtml.write <<-EOF
                            <li>#{element[1]}</li>
        EOF

        mass = pr[3].split(":").map{|a| a.to_s.strip }
        fileHtml.write <<-EOF
                            <li>#{mass[1]}</li>
        EOF

        electon = pr[4].split(":").map{|a| a.to_s.strip }
        fileHtml.write <<-EOF
                            <li>#{electon[1]} electron</li>
        EOF

        fileHtml.write <<-EOF
                        </ul>
                </td>

        EOF
    end


    fileHtml.write <<-EOF
            </table>
    </body>
</html>
    EOF
    
    fileHtml.close()

end

generate_html()
