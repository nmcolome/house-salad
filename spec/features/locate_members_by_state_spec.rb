require 'rails_helper'

RSpec.describe :search do
  it "locates all congress members by state" do
    visit '/'
    select 'Colorado', from: 'state'
    click_on 'Locate Members of the House'

    expect(current_path).to eq('/search')
    expect(page).to have_content("7 Results")
    expect(page).to have_selector('.member', count: 7)

    within first('.member') do
      expect(page).to have_selector('.name')
      expect(page).to have_selector('.role')
      expect(page).to have_selector('.party')
      expect(page).to have_selector('.district')
    end
  end
end

# As a user
# When I visit "/"
# And I select "Colorado" from the dropdown
# And I click on "Locate Members from the House"
# Then my path should be "/search" with "state=CO" in the parameters
# And I should see a message "7 Results"
# And I should see a list of 7 the members of the house for Colorado
# And they should be ordered by seniority from most to least
# And I should see a name, role, party, and district for each member
