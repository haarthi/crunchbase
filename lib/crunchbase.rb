#!/usr/bin/env ruby

require 'rest_client'
require 'json'
require 'yaml'

 
class CrunchbaseAPI
    # the URL for the Crunchbase endpoint
    #@url
    

     # constructor
    def initialize
        # config = YAML.load_file('../config.yml')
        #@url = 'https://api.crunchbase.com/v/3/odm-people?user_key=955cdebf17dd4f975e5ec0b9294f36c3' #+ config['user_data'].to_s
    end
 
    # performs the GET request to get the trends from Crunchbase
    def getResults
        # response = RestClient.get(@url, {accept: :json})
        # return response.body
        response = [{"type":"Person","uuid":"38d3a4a981be5bb419416fbff9ec86e0","properties":{"permalink":"michael-slan","api_path":"people/michael-slan","web_path":"person/michael-slan","first_name":"Michael","last_name":"Slan","gender":"Male","title":"Vice-President","organization_permalink":"team-dignitas","organization_api_path":"organizations/team-dignitas","organization_web_path":"organization/team-dignitas","organization_name":"Team Dignitas","profile_image_url":"http://public.crunchbase.com/t_api_images/v1497957998/gloq5asuagfogaxztkau.png","created_at":1497958010,"updated_at":1497958011}},{"type":"Person","uuid":"38d3a4a981be5bb419416fbff9ec86e0","properties":{"permalink":"michael-slan","api_path":"people/michael-slan","web_path":"person/michael-slan","first_name":"Michael","last_name":"Slan","gender":"Male","title":"Vice-President","organization_permalink":"team-dignitas","organization_api_path":"organizations/team-dignitas","organization_web_path":"organization/team-dignitas","organization_name":"Team Dignitas","profile_image_url":"http://public.crunchbase.com/t_api_images/v1497957998/gloq5asuagfogaxztkau.png","created_at":1497958010,"updated_at":1497958011}}]
        puts response.to_s

        # puts response
    end

    def insertResults
    end
 
    # returns the raw JSON of the response from Crunchbase
    def getJSON
            return getTrends()
    end
 
    # returns a human-friendly text version of the response from Crunchbase
    def getText
            hashOfResponse = JSON.parse(getJSON())
            textOfResponse = "Twitter Trends\n----------------\n\n"
            #textOfResponse += "Results for: "+hashOfResponse['as_of']+"\n\n"
            # loop over the trends URLs returned and append them to the string to return
            hashOfResponse['trends'].each { |trend|
                    textOfResponse += "Trend: "+trend['name']+", URL: "+trend['url']+"\n"
            }
            return textOfResponse
    end

#     client = CrunchbaseAPI.new
# puts client.getResults()
end

client = CrunchbaseAPI.new
client.getResults()
