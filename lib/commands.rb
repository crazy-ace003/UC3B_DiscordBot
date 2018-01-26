# encoding: UTF-8
require 'colorize'
require 'mechanize'
require 'json'
require "net/http"
module Bot
   class << self
    public
    def cats()
        begin
            uri = URI.parse("https://catfact.ninja/fact")
            response = Net::HTTP.get_response(uri)
            data = JSON.parse(response.body)
            cat = data["fact"]
        rescue
            cat = "Error in 'catFacts' function"
            puts"[+] Error in the 'catFacts' function".red
        return cat
        end
    end
    def movies()
        i = 0
        array = []
        mechanize = Mechanize.new
        page = mechanize.get('http://www.marqueecinemas.com//includes/load_data?t=movies&h=26188')
        for i in 1..10
                movie_id = page.xpath('/html/body/option[' + i.to_s + ']').to_s
                movie_name = page.xpath('/html/body/option[' + i.to_s + ']').text
        	    movie_ids = movie_id.split('<option value="').to_s.split('"')[3].to_s.gsub('\\','')
                mechanize1 = Mechanize.new
                puts"Movie: #{movie_name}".green
                page1 = mechanize1.get('http://www.marqueecinemas.com/includes/load_data?t=showtimes&h=26188&m='+ movie_ids + '&d=1/19/2018')
                for ii in 1..12
                	        times = page1.xpath('/html/body/option[' + ii.to_s + ']').to_s.split(">")[1].to_s.split('<')[0]
                            puts times
                            #puts movie_name
                        if times.nil? == false
                		if times.include? "Select a Showtime" 
                			next
                		else
        	        		puts"Time: #{times}"
        	        		puts"\n"
                            final = movie_name + "\n" + times
                            final = '** ' + movie_name + ' ** ' + "\n"+ "    #{times}" + "\n"
                            puts final
                            f = File.open("movies.txt", "a")
                                f << final
                            end
        	        	end
                end
               
        end
    end
    def thn()
        begin
            agent = Mechanize.new
            page = agent.get("http://thehackernews.com/")
            expression = ['//*[@id="Blog1"]/div[1]/article[1]/span/h2/a']
            #'//*[@id="Blog1"]/div[1]/article[2]/span/h2/a','//*[@id="Blog1"]/div[1]/article[3]/span/h2/a','//*[@id="Blog1"]/div[1]/article[4]/span/h2/a','//*[@id="Blog1"]/div[1]/article[5]/span/h2/a']
            expression.each do |loop|
            title = page.at(loop).text.strip
            link  = page.at(loop).attributes["href"].text
            final = title << "\n" << link
            return final
            end
        rescue
            puts"[+] Error in 'thn' function".red
        end
    end
    def urbandict(word)
        begin
            url = "http://api.urbandictionary.com/v0/define?term=#{word}"        #Adds the variable (word) to the end of the url
            uri = URI.parse(url)                      
            response = Net::HTTP.get_response(uri)                               #gets responses
            data = JSON.parse(response.body)                                     #Use json to parse the data
            return data
        rescue
            puts"Error in Urbandict function".red
        end
    end
    def checkBC()
        begin
            agent = Mechanize.new
            page = agent.get("https://www.bleepingcomputer.com/news/")
            link = page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > h4 > a")
            url = link['href'].strip
            f = File.open("BC.txt", "w")
            f.write(url)
            return url
        rescue => e
            puts "#{e.message}"
        end
    end
    def readBC()
        f = File.open("BC.txt", "a").read 
        if file
        
        
    end
    def bleeping_computer()
        begin
            agent = Mechanize.new
            page = agent.get("https://www.bleepingcomputer.com/news/")
            link = page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > h4 > a")
            url = link['href']
            title = link.text
            main =  title + "\n" + url
            return main
        rescue => e
            puts "#{e.message}"
        end
    end
    def jokes()
        begin
           uri = URI.parse("https://icanhazdadjoke.com/")
        request = Net::HTTP::Get.new(uri)
        request["Accept"] = "text/plain"
        
        req_options = {
          use_ssl: uri.scheme == "https",
        }
        
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end
        
        # response.code
        facts =  response.body
        rescue => e
            puts"[+] Error in 'joke' function, #{e.message}"
            message = "Error in 'joke' function."
            return message
        end
    end
    def puns()
        begin
            uri = URI.parse('https://getpuns.herokuapp.com/api/random')
            response = Net::HTTP.get_response(uri)
            data = JSON.parse(response.body)
            return data['Pun']
        rescue => e
            puts"Error with GetPuns, #{e.message}".red
        end
    end
end
end
end