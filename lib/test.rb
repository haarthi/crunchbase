#!/usr/bin/env ruby

# require 'rest-client'
# require 'json'
 
# url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
# crunchbaseurl = 'https://api.crunchbase.com/v/3/odm-people?user_key=955cdebf17dd4f975e5ec0b9294f36c3'
# response = RestClient.get(crunchbaseurl, :verify_ssl => false){|response, request, result| response }
# puts response


require_relative 'crunchbase.rb'

require_relative 'bigquery.rb'

# client = CrunchbaseAPI.new
# client.getResults()

# bq = BigQuery.new
# bq.create_table()

# puts bq.create_table()

# displayTwitterTrends.rb
# require 'api.rb'
 
# client = CrunchbaseAPI.new
# puts client.getText()


# sql()
# # Looker.Connector.connect()
# # /Users/looker/Projects/crunchbase_data-master

# # 2bda69525eee4b66a8028a5bfeb1d327?registrationkey=000f4e000f204473bb565256e8eee73e

# # url = 'https://api.bls.gov/publicAPI/v2/timeseries/data/?registrationkey=2bda69525eee4b66a8028a5bfeb1d327'
# # response = RestClient.post(url,
# #                            {'seriesid' => ['CEU0800000003'],
# #                             'startyear' => '1995',
# #                             'endyear'   => '1998'
# #                            }.to_json,
# #                            :content_type => 'application/json')

# # my_json = response.to_json

# # puts my_json


# # require 'rest_client'
# # require 'json'
# # url = 'https://api.bls.gov/publicAPI/v1/timeseries/data/'
# # response = RestClient.post(url,
# #                            {'seriesid' => ['LAUCN040010000000005'],
# #                             'startyear' => '1995',
# #                             'endyear'   => '1998', 
# #                             "registrationkey" => "2bda69525eee4b66a8028a5bfeb1d327" 
# #                            }.to_json,
# #                            :content_type => 'application/json')


# # my_json = response.to_json
# # puts my_json