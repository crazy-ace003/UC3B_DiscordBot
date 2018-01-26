# encoding: UTF-8
require 'colorize'
require 'mechanize'
require 'json'
require "net/http"
bc = false
# encoding: UTF-8
require 'discordrb'
require'colorize'
token = "MzgwNTgzNjk4NzkxMzk5NDI0.DO8_vQ.Vc84O0pjrQcGzDQAXeG7nBDtZqk"
bot = Discordrb::Commands::CommandBot.new token: 'MzgwNTgzNjk4NzkxMzk5NDI0.DO8_vQ.Vc84O0pjrQcGzDQAXeG7nBDtZqk', client_id:  380583698791399424, prefix: '!'
puts "This bot's invite URL is #{bot.invite_url}."
bc = false


def checkBC()
    agent = Mechanize.new
    page = agent.get("https://www.bleepingcomputer.com/news/")
    link = page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > h4 > a")
    url = link['href']
    return url
end
def writeToBC()
    agent = Mechanize.new
    page = agent.get("https://www.bleepingcomputer.com/news/")
    link = page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > h4 > a")
    url = link['href']
    f = File.open("BC.txt", "w")
    f.write(url)
end
f = File.read("BC.txt")
#fg = writeToBC()
url = checkBC()
if url == f 
    puts"same"
else
    puts"no"
    bc = true
    puts bc
end
if bc == true
    
    bot.message() do |event|
        agent = Mechanize.new
        page = agent.get("https://www.bleepingcomputer.com/news/")
        link = page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > h4 > a")
        url = link['href']
        title = link.text
        main =  title + "\n" + url
        event.respond main.to_s
        bc = false
    end
puts bc
end
