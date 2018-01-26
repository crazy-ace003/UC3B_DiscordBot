require'httparty'
require'mysql'
module Netflix
class << self
    public
    def Get_ID()
    	response = HTTParty.get('https://api.reelgood.com/v1/roulette/netflix?nocache=true&kind=0&minimumScore=4&genre=5&sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true')
    	id =  response.parsed_response["id"]
    	return id
    end
    def Get_Movie(id)
    	url = "https://api.reelgood.com/v1/movie/"+ id + "?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true"
    	response = HTTParty.get('https://api.reelgood.com/v1/movie/'+ id + '?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true')
    	info = response.parsed_response
    	return info
    end
    def Get_Doc()
    	response = HTTParty.get('https://api.reelgood.com/v1/roulette/netflix?nocache=true&kind=0&minimumScore=4&genre=11&sources=netflix&free=false')
        id =  response.parsed_response["id"]
        url = "https://api.reelgood.com/v1/movie/"+ id + "?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true"
    	puts url
    	response = HTTParty.get('https://api.reelgood.com/v1/movie/'+ id + '?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true')
    	info = response.parsed_response
    	#info = "Title:" + info["title"] + "<br>" + "Overview: " + info["overview"] + "<br>" + "Release On: " + info["released_on"]
    	puts info
    	return info
   end
   def Get_Mystery()
	response = HTTParty.get('https://api.reelgood.com/v1/roulette/netflix?nocache=true&kind=0&minimumScore=4&genre=23&sources=netflix&free=false')
    id =  response.parsed_response["id"]
    url = "https://api.reelgood.com/v1/movie/"+ id + "?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true"
	puts url
	response = HTTParty.get('https://api.reelgood.com/v1/movie/'+ id + '?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true')
	info = response.parsed_response
	#info = "Title:" + info["title"] + "<br>" + "Overview: " + info["overview"] + "<br>" + "Release On: " + info["released_on"]
	puts info
	return info
end
def Get_StandUp()
	response = HTTParty.get('https://api.reelgood.com/v1/roulette/netflix?nocache=true&kind=0&minimumScore=4&genre=45&sources=netflix&free=false')
    id =  response.parsed_response["id"]
    url = "https://api.reelgood.com/v1/movie/"+ id + "?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true"
	puts url
	response = HTTParty.get('https://api.reelgood.com/v1/movie/'+ id + '?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true')
	info = response.parsed_response
	#info = "Title:" + info["title"] + "<br>" + "Overview: " + info["overview"] + "<br>" + "Release On: " + info["released_on"]
	puts info
	return info
end
def Get_Crime()
	response = HTTParty.get('https://api.reelgood.com/v1/roulette/netflix?nocache=true&kind=0&minimumScore=4&genre=10&sources=netflix&free=false')
    id =  response.parsed_response["id"]
    url = "https://api.reelgood.com/v1/movie/"+ id + "?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true"
	response = HTTParty.get('https://api.reelgood.com/v1/movie/'+ id + '?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true')
	info = response.parsed_response
	#info = "Title:" + info["title"] + "<br>" + "Overview: " + info["overview"] + "<br>" + "Release On: " + info["released_on"]
	return info
end
def Get_Thriller()
	response = HTTParty.get('https://api.reelgood.com/v1/roulette/netflix?nocache=true&kind=0&minimumScore=4&genre=32&sources=netflix&free=false')
    id =  response.parsed_response["id"]
    url = "https://api.reelgood.com/v1/movie/"+ id + "?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true"
	puts url
	response = HTTParty.get('https://api.reelgood.com/v1/movie/'+ id + '?sources=amazon_prime%2Cfx_tveverywhere%2Chbo%2Chulu_plus%2Cnetflix%2Cshowtime%2Cstarz&free=true')
	info = response.parsed_response
	#info = "Title:" + info["title"] + "<br>" + "Overview: " + info["overview"] + "<br>" + "Release On: " + info["released_on"]
	puts info
	return info
end
end
end