# encoding: UTF-8
require 'discordrb'
require'colorize'
require_relative 'lib/commands'
require_relative 'lib/coins'
require_relative 'lib/netflix'
token = "MzgwNTgzNjk4NzkxMzk5NDI0.DO8_vQ.Vc84O0pjrQcGzDQAXeG7nBDtZqk"
bot = Discordrb::Commands::CommandBot.new token: 'MzgwNTgzNjk4NzkxMzk5NDI0.DO8_vQ.Vc84O0pjrQcGzDQAXeG7nBDtZqk', client_id:  380583698791399424, prefix: '!'
puts "This bot's invite URL is #{bot.invite_url}."
bc = false

bot.message(content: '!thn') do |event|                                         #example: !hello world
    begin
        thn = Bot.thn()
        event.respond thn                                                       #Sends to discord
    rescue => e                                                                 #catching any errors
        puts e.message.red                                                      #prints the error
        event.respond "Error in the 'THN' command"
    end
end
bot.command :urban do |event, *word|                                            #'word' is the variable
    begin
        word = word.shift                                                       #remove any blank spaces
        data = Bot.urbandict(word)                                              #uses function at lib/commands.rb
        definition = data['list'][0]['definition']
        example = data['list'][0]['example']
        final = definition + "\n" + example
        event.respond final
    rescue => e 
        puts e.message.red
        event.respond "Error in urban dict"
    end
end
bot.command :xmr do |event|
    begin
         price = Coins.priceMonero()
         event.respond price
    rescue => e
        event.respond e
    end
end
bot.command :btc do |event|
    begin
         price = Coins.priceBitcoin()
         event.respond price
    rescue => e
        event.repond e
    end
end
bot.command :xlm do |event|
    begin
         price = Coins.priceStellar()
         event.respond price
    rescue => e
        event.repond e
    end
end
bot.command :eth do |event|
    begin
         price = Coins.priceEthereum()
         event.respond price
    rescue => e
        event.repond e
    end
end
bot.command :netflixCrime do |event|
    begin
        infos = Netflix.Get_Crime()
        info = "***Title:*** #{infos["title"]}" + "\n" +"***Overview:*** #{infos["overview"]}" + "\n" + "***Release On:*** #{infos["released_on"]}"
        event.respond info
    rescue => e
        puts e
    retry
    end
end
bot.command :netflix do |event|
    begin
    id = Netflix.Get_ID()
    infos = Netflix.Get_Movie(id)
    info = "***Title:*** #{infos["title"]}" + "\n" +"***Overview:*** #{infos["overview"]}" + "\n" + "***Release On:*** #{infos["released_on"]}"
    event.respond info
   rescue
   retry
   end
end
bot.command :netflixDoc do |event|
    begin
        infos = Netflix.Get_Doc()
        info = "***Title:*** #{infos["title"]}" + "\n" +"***Overview:*** #{infos["overview"]}" + "\n" + "***Release On:*** #{infos["released_on"]}"
        event.respond info
    rescue
    retry
    end
end
bot.command :netflixMystery do |event|
    begin
        infos = Netflix.Get_Mystery()
        info = "***Title:*** #{infos["title"]}" + "\n" +"***Overview:*** #{infos["overview"]}" + "\n" + "***Release On:*** #{infos["released_on"]}"
        event.respond info
    rescue
    retry
    end
end
bot.command :bleepingcomputer do |event|
    begin
         bc = Bot.bleeping_computer()
         event.respond bc.to_s
    rescue => e
        event.repond e
    end
end

bot.command :joke do |event|
    begin
        joke = Bot.jokes()
        event.respond joke
    rescue => e
        event.respond e
    end
end

bot.command :puns do |event|
    begin
        pun = Bot.puns()
        event.respond pun
    rescue => e
        event.respond e
    end
end

bot.command :cats do |event|
    begin
        cats = Bot.cats()
        event.respond cats
    end
end

bot.command :movies do |event|
    Bot.movies()
    file = File.open("movies.txt", "r").read.to_s
    event.respond file.to_s
    nil                                                                #this is needed so it wont print out the whole array at the end
    #File.delete("movies.txt")
end
bot.command(:play_mp3) do |event|
end
bot.run                                                                         #leave this at the end