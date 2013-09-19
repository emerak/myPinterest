require 'spec_helper'
feature 'Twitter Auth' do

  before do
    OmniAuth.config.mock_auth[:twitter] = {
      "extra" => {
        "raw_info" => {
          "id" => '12345',
          "screen_name" => 'twit',
          "display_name" => "A Twit"
        }
      }
    }
  end

  it "signing in with Twitter" do
    visit '/'
    click_link 'Twitter'
    page.should have_content("Signed in with Twitter successfully.")
  end

end
