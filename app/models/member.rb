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
    members = PropublicaService.new(state).get_house_members
    member_list = members.map do |member|
      new(member)
    end
    member_list.sort_by { |member| -member.seniority.to_i }
  end

  private
    attr_reader :attr
end