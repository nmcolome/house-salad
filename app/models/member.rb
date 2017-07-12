class Member
  attr_reader :name, :role, :party, :district, :seniority

  def initialize(attr)
    @attr = attr
    @name = attr["name"]
    @role = attr["role"]
    @party = attr["party"]
    @district = attr["district"]
    @seniority = attr["seniority"]
  end

  def self.get_house_members_from(state)
    conn = Faraday.new("https://api.propublica.org")
    response = conn.get "/congress/v1/members/house/#{state}/current.json", {}, {"X-API-Key" => ENV['PROPUBLICA_API_KEY']}
    json_response = JSON.parse(response.body, serialize_name: true)
    member_list = json_response["results"].map do |member|
      new(member)
    end
  end

  private
    attr_reader :attr
end