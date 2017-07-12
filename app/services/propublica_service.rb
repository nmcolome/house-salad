class PropublicaService
  def self.get_house_members_from(state)
    conn = Faraday.new("https://api.propublica.org")
    response = conn.get "/congress/v1/members/house/#{state}/current.json", {}, {"X-API-Key" => ENV['PROPUBLICA_API_KEY']}
    json_response = JSON.parse(response.body, serialize_name: true)["results"]
  end
end