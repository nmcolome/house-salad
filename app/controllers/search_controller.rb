class SearchController < ApplicationController
  def index
    conn = Faraday.new("https://api.propublica.org")
    response = conn.get "/congress/v1/members/houses/CO/current.json", {}, {:X-API-Key => ENV['PROPUBLICA_API_KEY']}
    json_response = JSON.parse(response.body, serialize_name: true)
    binding.pry
  end
end