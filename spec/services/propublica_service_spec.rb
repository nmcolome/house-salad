require 'rails_helper'

RSpec.describe PropublicaService do
  context '#get_house_members' do
    it 'returns an array of members' do
      state = "CO"
      members = PropublicaService.new(state).get_house_members
      member = members.first

      expect(members).to be_an Array
      expect(members.count).to eq(7)
      expect(member).to have_key("name")
      expect(member).to have_key("role")
      expect(member).to have_key("party")
      expect(member).to have_key("district")
      expect(member["name"]).to be_a String
      expect(member["role"]).to be_a String
      expect(member["party"]).to be_a String
      expect(member["district"]).to be_a String
    end
  end
end
