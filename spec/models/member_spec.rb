require 'rails_helper'

RSpec.describe Member do
  it 'returns member data' do
    raw_member = {"id"=>"B001289",
                  "name"=>"Bradley Byrne",
                  "role"=>"Representative",
                  "gender"=>"M",
                  "party"=>"R",
                  "times_topics_url"=>"",
                  "twitter_id"=>"RepByrne",
                  "youtube_id"=>"",
                  "seniority"=>"6",
                  "next_election"=>"2018",
                  "api_uri"=>"https://api.propublica.org/congress/v1/members/B001289.json",
                  "district"=>"1"
                  }

    member = Member.new(raw_member)

    expect(member.name).to eq("Bradley Byrne")
    expect(member.role).to eq("Representative")
    expect(member.party).to eq("R")
    expect(member.district).to eq("1")
    expect(member.seniority).to eq("6")
  end
end
